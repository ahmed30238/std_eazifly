import 'dart:io';

import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../../../controller/programs_under_review/programs_under_review_state.dart';

class WritingMessageArea extends StatefulWidget {
  final int orderId;
  final bool isReport;

  const WritingMessageArea({
    super.key,
    required this.orderId,
    this.isReport = false,
  });

  @override
  State<WritingMessageArea> createState() => _WritingMessageAreaState();
}

class _WritingMessageAreaState extends State<WritingMessageArea>
    with TickerProviderStateMixin {
  late AnimationController _recordingAnimationController;
  late Animation<double> _pulseAnimation;
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    ChatsCubit.get(context).initMessageListener();

    // Animation for recording pulse effect
    _recordingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _recordingAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Animation for slide effect when showing image preview
    _slideAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _slideAnimationController,
            curve: Curves.easeOutCubic,
          ),
        );
  }

  @override
  void dispose() {
    _recordingAnimationController.dispose();
    _slideAnimationController.dispose();
    super.dispose();
  }

  Widget _buildRecordingIndicator() {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MainColors.onError.withValues(alpha: 0.2),
            ),
            child: SvgPicture.asset(
              Assets.iconsMicrophone,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                MainColors.onError,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImagePreview(File image) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: MainColors.background,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: MainColors.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.file(
                image,
                width: 50.w,
                height: 50.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'صورة محددة',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: MainColors.tertiary,
                    ),
                  ),
                  Text(
                    'اضغط إرسال للمشاركة',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: MainColors.tertiary.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                final cubit = ChatsCubit.get(context);
                cubit.image = null;
                _slideAnimationController.reverse();
              },
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MainColors.onError.withValues(alpha: 0.1),
                ),
                child: Icon(
                  Icons.close,
                  size: 16.sp,
                  color: MainColors.onError,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordingPreview() {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: MainColors.background,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: MainColors.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: MainColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.mic, color: MainColors.primary, size: 24.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'تسجيل صوتي',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: MainColors.tertiary,
                    ),
                  ),
                  Text(
                    'اضغط إرسال للمشاركة',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: MainColors.tertiary.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                final cubit = ChatsCubit.get(context);
                if (cubit.isPlaying) {
                  cubit.stopAudio();
                } else {
                  cubit.playAudio();
                }
              },
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MainColors.primary.withValues(alpha: 0.1),
                ),
                child: BlocBuilder<ChatsCubit, ChatsState>(
                  builder: (context, state) {
                    final cubit = ChatsCubit.get(context);
                    return Icon(
                      cubit.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 20.sp,
                      color: MainColors.primary,
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 8.w),
            InkWell(
              onTap: () {
                final cubit = ChatsCubit.get(context);
                cubit.recordPath = "";
                // cubit.emit(StopRecordState());
                _slideAnimationController.reverse();
              },
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MainColors.onError.withValues(alpha: 0.1),
                ),
                child: Icon(
                  Icons.close,
                  size: 16.sp,
                  color: MainColors.onError,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSendButton(ChatsCubit cubit) {
    final hasContent =
        cubit.isMessageNotEmpty ||
        cubit.image != null ||
        cubit.recordPath.isNotEmpty;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: hasContent ? MainColors.primary : Colors.transparent,
      ),
      child: InkWell(
        onTap: hasContent
            ? () {
                if (widget.isReport) {
                  cubit.addNote(
                    orderId: widget.orderId.toString(),
                    context: context,
                  );
                } else {
                  cubit.sendMessages(
                    receiverId: cubit.currentInstructor?.id ?? "",
                  );
                }
              }
            : () {
                if (cubit.isRecording) {
                  cubit.stopRecording();
                  _recordingAnimationController.stop();
                  _recordingAnimationController.reset();
                } else {
                  cubit.startRecording();
                  _recordingAnimationController.repeat(reverse: true);
                }
              },
        borderRadius: BorderRadius.circular(20.r),
        child: cubit.isRecording
            ? _buildRecordingIndicator()
            : SvgPicture.asset(
                hasContent ? Assets.iconsSend2 : Assets.iconsMicrophone,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  hasContent
                      ? Colors.white
                      : MainColors.tertiary.withValues(alpha: 0.6),
                  BlendMode.srcIn,
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsState>(
      listener: (context, state) {
        final cubit = ChatsCubit.get(context);

        // Show image preview animation
        if (state is PickImageFromGallerySuccessState && cubit.image != null) {
          _slideAnimationController.forward();
        }

        // Show recording preview animation
        if (state is StopRecordState && cubit.recordPath.isNotEmpty) {
          _slideAnimationController.forward();
        }

        // Handle recording animation
        if (state is StartRecordState) {
          _recordingAnimationController.repeat(reverse: true);
        } else if (state is StopRecordState) {
          _recordingAnimationController.stop();
          _recordingAnimationController.reset();
        }

        // Reset animations after sending
        if (state is SendMesssagesSuccesState || state is AddNoteSuccessState) {
          _slideAnimationController.reverse();
        }
      },
      builder: (context, state) {
        final cubit = ChatsCubit.get(context);

        return Container(
          color: MainColors.inputFill,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image Preview
              if (cubit.image != null)
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                  child: _buildImagePreview(cubit.image!),
                ),

              // Recording Preview
              if (cubit.recordPath.isNotEmpty && !cubit.isRecording)
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                  child: _buildRecordingPreview(),
                ),

              // Recording Indicator
              if (cubit.isRecording)
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        color: MainColors.onError,
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'جاري التسجيل...',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: MainColors.onError,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

              // Main Input Area
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 20.h),
                child: Row(
                  children: [
                    _buildSendButton(cubit),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: CustomTextFormField(
                        filledColor: MainColors.background,
                        controller: cubit.messageController,
                        hintText: cubit.isRecording
                            ? "جاري التسجيل..."
                            : "أكتب رسالتك",
                        enabled: !cubit.isRecording,
                        maxLines: 1,
                        minLines: 1,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    AnimatedOpacity(
                      opacity: cubit.isRecording ? 0.5 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: InkWell(
                        onTap: cubit.isRecording
                            ? null
                            : () => cubit.pickImageFroGallery(),
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: SvgPicture.asset(
                            Assets.iconsGallery,
                            fit: BoxFit.scaleDown,
                            colorFilter: ColorFilter.mode(
                              cubit.isRecording
                                  ? MainColors.tertiary.withValues(alpha: 0.3)
                                  : MainColors.tertiary.withValues(alpha: 0.6),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}