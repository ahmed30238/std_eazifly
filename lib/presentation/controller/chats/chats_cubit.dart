import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:eazifly_student/data/models/chat_model/get_messages_model.dart';
import 'package:eazifly_student/data/models/chat_model/get_my_chats_model.dart';
import 'package:eazifly_student/data/models/chat_model/send_messages_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/add_note_tojson.dart';
import 'package:eazifly_student/domain/entities/add_note_entity.dart';
import 'package:eazifly_student/domain/entities/chat/get_messages_entities.dart';
import 'package:eazifly_student/domain/entities/chat/get_my_chats_entity.dart';
import 'package:eazifly_student/domain/entities/chat/send_messages_entities.dart';
import 'package:eazifly_student/domain/use_cases/add_note_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_messages_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_my_chats_usecase.dart';
import 'package:eazifly_student/domain/use_cases/send_messages_usecase.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/controller/chats/message_ui_model.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
// import 'package:record/record.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({
    required this.getMessagesUsecase,
    required this.getMyChatsUsecase,
    required this.sendMessagesUsecase,
    // required this.getOldChatsUsecase,
    required this.addNoteUsecase,
  }) : super(ChatsInitial());

  static ChatsCubit get(BuildContext context) => BlocProvider.of(context);
  bool isMessageNotEmpty = false;

  void initMessageListener() {
    messageController.addListener(() {
      final isNotEmpty = messageController.text.isNotEmpty;
      if (isNotEmpty != isMessageNotEmpty) {
        isMessageNotEmpty = isNotEmpty;
        emit(MessageTextChanged());
      }
    });
  }

  TabController? controller;
  TextEditingController messageController = TextEditingController();

  void initController(TickerProvider vsync, BuildContext context) {
    controller =
        TabController(length: tabs(context: context).length, vsync: vsync)
          ..addListener(
            () {
              if (controller!.indexIsChanging) {
                emit(ChangeTapbarState());
              }
            },
          );
  }

  File? image;

  Future<void> pickImageFroGallery() async {
    final response = await pickImageFromGallery();
    if (response != null) {
      image = File(response.path);
    }
    emit(PickImageFromGallerySuccessState());
  }

  List<String> tabs({required BuildContext context}) {
    var lang = context.loc!;
    var tabs = [
      lang.professors,
      lang.appManagement,
    ];
    return tabs;
  }

  late AudioRecorder audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  bool isPlaying = false;
  String recordPath = "";

  initializeRecordVars() {
    audioPlayer = AudioPlayer();
    audioRecord = AudioRecorder();

    // Listen to player state changes
    audioPlayer.playerStateStream.listen((PlayerState state) {
      if (state.processingState == ProcessingState.completed) {
        isPlaying = false;
        emit(StopPlayingRecordState());
      }
    });
  }

  Future<String> getRecordPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/recording.wav';
  }

  Future<void> startRecording() async {
    recordPath = await getRecordPath();

    if (await audioRecord.hasPermission()) {
      await audioRecord.start(
        const RecordConfig(
          encoder: AudioEncoder.wav,
          androidConfig: AndroidRecordConfig(
            audioSource: AndroidAudioSource.mic,
          ),
        ),
        path: recordPath,
      );
      isRecording = true;
      emit(StartRecordState());
    }
  }

  Future<void> stopRecording() async {
    String? path = await audioRecord.stop();
    isRecording = false;
    if (path != null) {
      recordPath = path;
    }
    emit(StopRecordState());
  }

  Future<void> playAudio() async {
    if (recordPath.isNotEmpty && File(recordPath).existsSync()) {
      try {
        await audioPlayer.setFilePath(recordPath);
        await audioPlayer.play();
        isPlaying = true;
        emit(PlayRecordState());
      } catch (e) {
        print('Error playing audio: $e');
        isPlaying = false;
      }
    } else {
      isPlaying = false;
      print('No recording found to play');
    }
  }

  Future<void> stopAudio() async {
    if (isPlaying) {
      await audioPlayer.pause();
      isPlaying = false;
      emit(StopPlayingRecordState());
    }
  }

//! ###################### API #######################

  AddNoteEntity? addNoteEntity;
  AddNoteUsecase addNoteUsecase;
  bool addNoteLoader = false;

  Future<void> addNote({
    required String orderId,
    required BuildContext context,
  }) async {
    String? imagePath;
    // إذا كان في صورة جديدة
    if (image != null) {
      final File file = image!;

      if (!await file.exists()) {
        throw Exception('Profile image file does not exist');
      }

      imagePath = file.path;
    }
    String userId = loginData?.id.toString() ?? "";
    emit(GetOldChatsLoadingState());
    final result = await addNoteUsecase.call(
      parameter: AddNoteParameters(
        data: AddNoteTojson(
          title: messageController.text,
          description: "description",
          orderId: orderId,
          userId: userId,
          image: imagePath,
        ),
      ),
    );
    result.fold(
      (l) {
        log("left");
        emit(GetOldChatsErrorState(errorMessage: l.message));
      },
      (r) {
        log("right");
        addNoteEntity = r;
        messageController.clear();
        emit(GetOldChatsSuccessState());
      },
    );
  }

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  //
  void initScorllController(String chatId) {
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100) {
          getMessages(chatId: chatId);
        }
      },
    );
  }

  GetMessagesEntities? getMessagesEntities;
  GetMessagesUsecase getMessagesUsecase;
  int _offset = 0;
  final int _limit = 20;
  bool hasMore = true;
  bool _isFetching = false;
  bool getMessagesLoader = false;

  Future<void> getMessages(
      {bool isInitial = false,
      required String chatId,
      bool showLoader = true}) async {
    log("fetch $_isFetching");
    log("has more $hasMore");
    log("initial $isInitial");
    if (_isFetching || !hasMore) return;
    // log("started messages");

    _isFetching = true;
    if (isInitial) {
      if (showLoader) emit(GetMesssagesLoadingState());
      uiMessages.clear();
      // messages?.clear();
      _offset = 0;
      hasMore = true;
    }

    final result = await getMessagesUsecase.call(
      parameter: GetMessagesParameters(
        chatId: int.parse(chatId),
        offset: _offset,
      ),
    );

    result.fold(
      (l) {
        emit(GetMessagesErrorState(errorMessage: l.message));
      },
      (r) {
        getMessagesEntities = r;
        final newMessages = r.data ?? [];

        if (isInitial) {
          log("is init");
          uiMessages.clear();
          uiMessages =
              newMessages.map((e) => MessageUIModel(message: e)).toList();
          emit(GetMesssagesSuccesState(uiMessages: uiMessages));
        } else {
          final newUiMessages = r.data
                  ?.map((message) => MessageUIModel(message: message))
                  .toList() ??
              [];

          uiMessages.addAll(newUiMessages);
          // messages?.addAll(newMessages);
        }

        _offset += newMessages.length;
        hasMore = newMessages.length == _limit;

        emit(GetMesssagesSuccesState(uiMessages: uiMessages));
        // emit(GetUiMesssagesSuccesState(uiMessages: uiMessages));
        // _updateMessagesStream();
      },
    );

    _isFetching = false;
  }

  SendMessagesEntities? sendMessagesEntities;
  SendMessagesUsecase sendMessagesUsecase;
  List<MessageUIModel> uiMessages = [];

  // List<GetMessagesDatumModel>? messages = [];

  Future<void> sendMessages({
    int? userId,
    required String receiverId,
  }) async {
    if (isRecording) {
      await stopRecording();
    }

    String? imagePath;
    String currentRecordPath = recordPath;
    String messageType = "text"; // default

    // إذا كان في صورة جديدة
    if (image != null) {
      final File file = image!;
      if (!await file.exists()) {
        throw Exception('Profile image file does not exist');
      }
      imagePath = file.path;
      messageType = "image";
    } else if (currentRecordPath.isNotEmpty) {
      messageType = "voice_message";
    }

    final String textToSend = messageController.text;
    messageController.clear();
    final tempMessage = SendMessagesTojson(
      message: textToSend,
      senderId: loginData?.id.toString() ?? "",
      senderType: "User",
      receiverId: receiverId,
      receiverType: "Instructor",
      createdAt: DateTime.now().toIso8601String(),
      file: imagePath ?? currentRecordPath,
    );

    // 2. ضفها للواجهة كـ isSending مع النوع
    uiMessages.insert(
      0,
      MessageUIModel(
        message: GetMessagesDatumModel.fromJson(tempMessage.toJson()),
        isSending: true,
        messageType: messageType, // حفظ النوع
      ),
    );

    // امسح المتغيرات دلوقتي
    image = null;
    recordPath = "";

    emit(SendMesssagesLoadingState());
    final result = await sendMessagesUsecase.call(
      parameter: SendMessagesParameters(
        data: tempMessage,
      ),
    );

    result.fold(
      (l) {
        // فشل في الإرسال
        final failed = uiMessages[0].copyWith(
          isSending: false,
          isFailed: true,
        );
        uiMessages[0] = failed;
        emit(SendMessagesErrorState(errorMessage: l.message));
      },
      (r) {
        // نجح الإرسال
        if (r.data != null) {
          final serverMessage =
              GetMessagesDatumModel.fromJson(r.data!.toJson());
          uiMessages[0] = MessageUIModel(message: serverMessage);
        } else {
          uiMessages[0] = uiMessages[0].copyWith(isSending: false);
        }
        sendMessagesEntities = r;
        emit(SendMesssagesSuccesState());
      },
    );
  }

  bool getMyChatsLoader = false;
  GetMyChatsUsecase getMyChatsUsecase;
  GetMyChatsEntity? getMyChatsEntity;

// Method
  Future<void> getMyChats() async {
    getMyChatsLoader = true;
    emit(GetMyChatsLoadingState());

    final result = await getMyChatsUsecase.call(
      parameter: GetMyChatsParameters(
        type: "user",
      ),
    );

    result.fold(
      (failure) {
        getMyChatsLoader = false;
        emit(GetMyChatsErrorState(failure.message));
      },
      (data) {
        getMyChatsLoader = false;
        getMyChatsEntity = data;
        emit(GetMyChatsSuccessState());
      },
    );
  }

  @override
  Future<void> close() async {
    await audioPlayer.dispose();
    await audioRecord.dispose();
    // _messagesStreamController.close();
    audioPlayer.dispose();
    // audioRecord.dispose();
    controller?.dispose();
    messageController.dispose();
    return super.close();
  }

  // this is a variable to use in the dm screen to get student(user) data
  // filled when the user click on the student item in the chat screen
  GetMyChatsParticipantModel? currentInstructor;

  fillCurrentInstructor(int index) {
    // currentInstructor = getMyChatsEntity?.data?[index].participant1;
    if (getMyChatsEntity?.data?[index].participant1?.type == "Instructor") {
      currentInstructor = getMyChatsEntity?.data?[index].participant1;
    } else {
      currentInstructor = getMyChatsEntity?.data?[index].participant2;
    }
  }

  GetMyChatsParticipantModel? currentClient;

  fillCurrentClient(int index) {
    // currentClient = getMyChatsEntity?.data?[index].participant1;
    if (getMyChatsEntity?.data?[index].participant1?.type == "Client") {
      currentClient = getMyChatsEntity?.data?[index].participant1;
    } else {
      currentClient = getMyChatsEntity?.data?[index].participant2;
    }
  }
}
