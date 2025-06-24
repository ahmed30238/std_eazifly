import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/voice_message_widget.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class QuestionAndSolutionContainer extends StatelessWidget {
  final bool isCorrected;
  final String title;
  final String answerText;
  final String teacherFeedback;
  final List<String> studentAttachments;
  // final List<String> teacherAttachments;
  final String? studentVoiceNote;
  final String? teacherVoiceNote;
  final double? studentVoiceDuration;
  final double? teacherVoiceDuration;
  final String mark;
  final String fullMark;

  const QuestionAndSolutionContainer({
    super.key,
    required this.isCorrected,
    required this.title,
    required this.answerText,
    required this.teacherFeedback,
    required this.studentAttachments,
    // required this.teacherAttachments,
    this.studentVoiceNote,
    this.teacherVoiceNote,
    this.studentVoiceDuration,
    this.teacherVoiceDuration,
    required this.mark,
    required this.fullMark,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LectureCubit>();
    // final isPassed = isCorrected && (int.tryParse(mark) ?? 0) >= (int.tryParse(fullMark) ?? 10) / 2;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        constraints: BoxConstraints(minHeight: 355.h),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: MainColors.veryLightGrayFormField,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.ph,

            // النتيجة العامة
            // if (isCorrected) _buildResultStatus(isPassed),

            // عنوان السؤال
            Text(
              "نص السؤال",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.checkBoxBorderGray,
              ),
            ),
            10.ph,

            Text(
              title,
              style: MainTextStyle.mediumTextStyle(fontSize: 12),
            ),
            16.ph,

            // إجابة الطالب
            _buildSectionHeader("إجابة الطالب"),
            8.ph,

            Text(
              answerText,
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            ),
            8.ph,

            // مرفقات الطالب
            if (studentAttachments.isNotEmpty)
              _buildAttachments(
                studentAttachments,
                isStudent: true,
                cubit: cubit
              ),

            // تسجيل صوتي للطالب
            if (studentVoiceNote != null && studentVoiceNote!.isNotEmpty)
              _buildVoiceNote(
                studentVoiceNote!,
                studentVoiceDuration ?? 0,
                isStudent: true,
                onPlayingAdio: () {
                  cubit.playExternalSourceAudio(teacherVoiceNote ?? "");
                },
              ),

            // تقييم المعلم (يظهر فقط إذا تم التصحيح)
            if (isCorrected) ...[
              _buildSectionHeader("تقييم المعلم"),
              8.ph,

              Text(
                teacherFeedback,
                style: MainTextStyle.mediumTextStyle(fontSize: 12),
              ),
              8.ph,

              // مرفقات المعلم
              // if (teacherAttachments.isNotEmpty)
              //   _buildAttachments(teacherAttachments, isStudent: false),

              // تسجيل صوتي للمعلم
              if (teacherVoiceNote != null && teacherVoiceNote!.isNotEmpty)
                _buildVoiceNote(
                  teacherVoiceNote!,
                  teacherVoiceDuration ?? 0,
                  isStudent: false,
                  onPlayingAdio: () {
                    cubit.playExternalSourceAudio(teacherVoiceNote ?? "");
                  },
                ),
            ],

            12.ph,
          ],
        ),
      ),
    );
  }

  // Widget _buildResultStatus(bool isPassed) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
  //     margin: EdgeInsets.only(bottom: 16.h),
  //     decoration: BoxDecoration(
  //       color: isPassed ? MainColors.lightgreenTeal : MainColors.lightRed,
  //       borderRadius: BorderRadius.circular(8.r),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           "النتيجة: $mark/$fullMark",
  //           style: MainTextStyle.boldTextStyle(
  //             fontSize: 14,
  //             color: MainColors.blackText,
  //           ),
  //         ),
  //         Container(
  //           padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
  //           decoration: BoxDecoration(
  //             color: isPassed ? MainColors.greenTeal : MainColors.red,
  //             borderRadius: BorderRadius.circular(16.r),
  //           ),
  //           child: Text(
  //             isPassed ? "ناجح" : "راسب",
  //             style: MainTextStyle.mediumTextStyle(
  //               fontSize: 12,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: MainTextStyle.boldTextStyle(
          fontSize: 12,
          color: MainColors.checkBoxBorderGray,
        ),
      ),
    );
  }

  Widget _buildAttachments(List<String> attachments,
      {required bool isStudent, required LectureCubit cubit}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isStudent ? "مرفقات الطالب" : "مرفقات المعلم",
          style: MainTextStyle.mediumTextStyle(fontSize: 12),
        ),
        8.ph,
        SizedBox(
          height: 105.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: attachments.length,
            separatorBuilder: (_, __) => 8.pw,
            itemBuilder: (context, index) {
              final file = attachments[index];
              final isPdf = file.toLowerCase().endsWith('.pdf');

              return GestureDetector(
                onTap: () => _handleAttachmentTap(
                    fileUrl: file,
                    cubit: cubit,
                    context: context,
                    fileType: "pdf"),
                child: Container(
                  width: 104.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: MainColors.lightGray,
                  ),
                  child: isPdf
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.picture_as_pdf,
                                size: 40.sp, color: Colors.red),
                            4.ph,
                            Text(
                              "ملف PDF",
                              style:
                                  MainTextStyle.regularTextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      : AvatarImage(
                          width: 104.w,
                          height: 105.h,
                          imageUrl: file,
                          radius: 8.r,
                        ),
                ),
              );
            },
          ),
        ),
        8.ph,
      ],
    );
  }

  Widget _buildVoiceNote(
    String audioUrl,
    double duration, {
    required bool isStudent,
    required VoidCallback onPlayingAdio,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isStudent ? "تسجيل الطالب" : "تسجيل المعلم",
          style: MainTextStyle.mediumTextStyle(fontSize: 12),
        ),
        8.ph,
        Container(
          decoration: BoxDecoration(
            color: MainColors.lightGray,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: VoiceMessageWidget(
            areaWidth: 300,
            isFile: false,
            audioSource: audioUrl,
            duration: duration,
            activeSliderColor:
                isStudent ? MainColors.blueTextColor : MainColors.greenTeal,
            showPlayButton: true,
            onPlaying: onPlayingAdio,
            showCounter: true,
          ),
        ),
        12.ph,
      ],
    );
  }

  void _handleAttachmentTap({
    required String fileUrl,
    required LectureCubit cubit,
    required BuildContext context,
    required String fileType,
  }) {
    if (fileUrl.toLowerCase().endsWith('.pdf')) {
      cubit.openFile(
          fileUrl: fileUrl, fileType: fileType, context: context, title: title);

      // افتح ملف PDF باستخدام PDF viewer
      // يمكن استخدام حزمة مثل: flutter_pdfview
      // PdfViewer.openFile(fileUrl);
    } else {
      // عرض الصورة في وضع ملء الشاشة
      // يمكن استخدام حزمة مثل: photo_view
      // Navigator.push(context, MaterialPageRoute(
      //   builder: (_) => PhotoViewGallery.builder(
      //     itemCount: 1,
      //     builder: (_, index) => PhotoViewGalleryPageOptions(
      //       imageProvider: NetworkImage(fileUrl),
      //     ),
      //   ),
      // ));
    }
  }
}
