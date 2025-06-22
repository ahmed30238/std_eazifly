import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/voice_audio_wave.dart';
import 'package:eazifly_student/core/component/voice_message_widget.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class QuestionAndSolutionContainer extends StatelessWidget {
  final bool fullTeacherAssessment;
  final String title;
  final String text;
  final String teacherAssessment;
  final String stdImages;
  final int stdImagesLength;
  final String instructorImgs;
  final int instructorImgsLength;
  final String? studentVoiceNote;
  final String? teacherVoiceNote;
  final double? studentVoiceDuration;
  final double? teacherVoiceDuration;

  const QuestionAndSolutionContainer({
    super.key,
    this.fullTeacherAssessment = false,
    required this.title,
    required this.text,
    required this.stdImages,
    required this.teacherAssessment,
    required this.stdImagesLength,
    required this.instructorImgs,
    required this.instructorImgsLength,
    this.studentVoiceNote,
    this.teacherVoiceNote,
    this.studentVoiceDuration,
    this.teacherVoiceDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      constraints: BoxConstraints(
        minHeight: 355.h,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MainColors.veryLightGrayFormField,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,

          // Submission text header
          SizedBox(
            height: 29.h,
            child: GestureDetector(
              onTap: () {
                var cubit = context.read<LectureCubit>();
                cubit.postAssignment(
                  sessionAssignmentId: "1",
                  file: cubit.profileImage,
                );
              },
              child: Text(
                "نص التسليم",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.checkBoxBorderGray,
                ),
              ),
            ),
          ),
          10.ph,

          // Title
          InkWell(
            onTap: () {
              context.read<LectureCubit>().pickProfileImageFroGallery();
            },
            child: SizedBox(
              height: 20.h,
              child: Text(
                title,
                style: MainTextStyle.mediumTextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
          16.ph,

          // Answer header
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "الاجابة",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.checkBoxBorderGray,
              ),
            ),
          ),
          8.ph,

          // Answer text
          Text(
            text,
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
          8.ph,

          // Student images
          if (stdImagesLength > 0) ...[
            SizedBox(
              height: 105.h,
              width: 375.w,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => AvatarImage(
                  width: 104.h,
                  height: 84.w,
                  imageUrl: stdImages,
                  radius: 8.r,
                ),
                separatorBuilder: (context, index) => 8.pw,
                itemCount: stdImagesLength,
              ),
            ),
            8.ph,
          ],

          // Student voice note
          if (studentVoiceNote != null && studentVoiceNote!.isNotEmpty) ...[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: MainColors.lightGray,
                  borderRadius: 12.cr,
                ),
                height: 40.h,
                child: NetworkVoiceMessage(
                  audioUrl: 'https://your-server.com/audio/message.mp3',

                  messageId: 'msg_123', // مهم للكاش!
                  primaryColor: Colors.blue,
                ),
                // child: VoiceMessageWidget(
                //   isFile: false,
                //   backgroundColor: MainColors.transparentColor,
                //   audioSource: studentVoiceNote!,
                //   duration: studentVoiceDuration ?? 11.0,
                //   onComplete: () {
                //     debugPrint("Student voice note completed");
                //   },
                //   onError: (error) {
                //     debugPrint("Student voice note error: $error");
                //   },
                // ),
              ),
            ),
            12.ph,
          ],

          // Teacher assessment header
          Text(
            "تقييم المعلم",
            style: MainTextStyle.mediumTextStyle(
              fontSize: 12,
            ),
          ),
          8.ph,

          // Teacher assessment content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (fullTeacherAssessment) ...[
                // Teacher assessment text
                Text(
                  teacherAssessment,
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 12,
                  ),
                ),
                8.ph,

                // Teacher images
                if (instructorImgsLength > 0) ...[
                  SizedBox(
                    height: 105.h,
                    width: 375.w,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => AvatarImage(
                        shape: BoxShape.rectangle,
                        width: 104.h,
                        height: 84.w,
                        imageUrl: instructorImgs,
                        radius: 8.r,
                      ),
                      separatorBuilder: (context, index) => 8.pw,
                      itemCount: instructorImgsLength,
                    ),
                  ),
                  8.ph,
                ],
              ],

              // Teacher voice note
              if (teacherVoiceNote != null && teacherVoiceNote!.isNotEmpty) ...[
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: MainColors.lightGray,
                      borderRadius: 12.cr,
                    ),
                    height: 40.h,
                    child: NetworkVoiceMessage(
                      audioUrl: 'https://your-server.com/audio/message.mp3',

                      messageId: 'msg_123', // مهم للكاش!
                      primaryColor: Colors.blue,
                    ),
                    // child: VoiceMessageWidget(
                    //   isFile: false,
                    //   backgroundColor: MainColors.transparentColor,
                    //   audioSource: teacherVoiceNote!,
                    //   duration: teacherVoiceDuration ?? 11.0,
                    //   activeSliderColor: MainColors.blueTextColor,
                    //   onComplete: () {
                    //     debugPrint("Teacher voice note completed");
                    //   },
                    //   onError: (error) {
                    //     debugPrint("Teacher voice note error: $error");
                    //   },
                    // ),
                  ),
                ),
              ] else ...[
                // Default placeholder if no teacher voice note
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: MainColors.lightGray,
                      borderRadius: 12.cr,
                    ),
                    height: 40.h,
                    child: const VoiceMessageWidget(
                      isFile: false,
                      backgroundColor: MainColors.transparentColor,
                      audioSource: "",
                      duration: 0.0,
                      showPlayButton: false,
                      showCounter: false,
                    ),
                  ),
                ),
              ],
            ],
          ),
          12.ph,
        ],
      ),
    );
  }
}
