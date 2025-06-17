import 'dart:io';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());
  static ChatsCubit get(context) => BlocProvider.of(context);
  late TabController controller;
  
  void initController(TickerProvider vsync) {
    controller = TabController(length: 2, vsync: vsync)
      ..addListener(
        () {
          if (controller.indexIsChanging) {
            emit(ChangeTapbarState());
          }
        },
      );
  }

  List<File> images = [];
  
  Future<void> pickImages() async {
    final response = await pickMultiImageFromGallery();
    if (response != null) {
      images = List.from(response.map((e) => File(e.path)));
    }
    emit(GetGalleryImagesState());
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
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        isPlaying = false;
        emit(StopPlayingRecordState());
      }
    });
    
    // Listen to player completion
    audioPlayer.onPlayerComplete.listen((event) {
      isPlaying = false;
      emit(StopPlayingRecordState());
    });
  }

  Future<String> getRecordPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/recording.wav';
  }

  Future<void> startRecording() async {
    String recordPath = await getRecordPath();
    if (await audioRecord.hasPermission()) {
      await audioRecord.start(
        const RecordConfig(
          androidConfig: AndroidRecordConfig(
            audioSource: AndroidAudioSource.mic,
          )
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
    recordPath = path!;
    emit(StopRecordState());
  }

  Future<void> playAudio() async {
    if (recordPath != "") {
      await audioPlayer.play(DeviceFileSource(recordPath));
      isPlaying = true;
      emit(PlayRecordState());
    } else {
      isPlaying = false;
    }
  }

  Future<void> stopAudio() async {
    if (isPlaying) {
      await audioPlayer.pause();
      isPlaying = false;
      emit(StopPlayingRecordState());
    }
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    audioRecord.dispose();
    controller.dispose();
    return super.close();
  }
}