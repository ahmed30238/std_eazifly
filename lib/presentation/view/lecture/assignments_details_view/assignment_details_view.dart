import 'dart:io';

import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AssignmentDetailsView extends StatefulWidget {
  final int assignmentId;
  final String assignmentTitle;

  const AssignmentDetailsView(
      {super.key, required this.assignmentId, required this.assignmentTitle});

  @override
  State<AssignmentDetailsView> createState() => _AssignmentDetailsViewState();
}

class _AssignmentDetailsViewState extends State<AssignmentDetailsView> {
  late LectureCubit cubit;
  @override
  void initState() {
    cubit = context.read<LectureCubit>();

    cubit.initializeRecordVars();
    super.initState();
    cubit.getAssignmentDetails(assignmentId: widget.assignmentId);
  }

  @override
  Widget build(BuildContext context) {
    // var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: widget.assignmentTitle,
        leadingText: "الاختبارات",
        isCenterTitle: true,
      ),
      body: ListView(
        children: [
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              var assignmentDetails = cubit.getAssignmentDetailsEntity?.data;
              return StudentStats(
                horizontalPadding: 0,
                titleText: const [
                  "تاريخ التسليم",
                  "درجة التسليم",
                  "حالة التسليم",
                ],
                downSideWidgets: [
                  Text(
                    assignmentDetails?.createdAt.toString().substring(0, 10) ??
                        "",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onSecondary,
                    ),
                  ),
                  Text(
                    "${assignmentDetails?.mark ?? "0"} / ...",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onSecondary,
                    ),
                  ),
                  TextedContainer(
                    width: 81.w,
                    text: "جاري التسليم",
                    containerColor: MainColors.onTertiary,
                    textColor: MainColors.tertiary,
                  ),
                ],
              );
            },
          ),
          12.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              var assignmentDetails = cubit.getAssignmentDetailsEntity?.data;
              return AssigmentItemContainer(
                question: assignmentDetails?.title ?? "",
                attachements: [cubit.selectedFile?.path ?? ""],
              );
            },
          ),
          // const Spacer(),
          48.ph,
          CustomElevatedButton(
            text: "تسليم الإجابات",
            width: 343.w,
            color: MainColors.primary,
            radius: 16.r,
            onPressed: () {
              cubit.postAssignment(
                sessionAssignmentId: widget.assignmentId.toString(),
                context: context,
              );
            },
          ).center(),
          32.ph,
        ],
      ),
    );
  }
}

class AssigmentItemContainer extends StatelessWidget {
  final String question;
  final List<String> attachements;
  const AssigmentItemContainer({
    super.key,
    required this.question,
    required this.attachements,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LectureCubit>();
    return Container(
      height: 450.h,
      width: double.infinity,
      color: MainColors.inputFill,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            13.5.ph,
            Text(
              "نص التسليم",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
              ),
            ),
            9.5.ph,
            Container(
              padding: EdgeInsets.all(12.r),
              height: 45.h,
              child: Text(
                question,
                style: MainTextStyle.mediumTextStyle(fontSize: 14),
              ),
            ),
            const Spacer(),
            Text(
              "مرفقات الطالب",
              style: MainTextStyle.mediumTextStyle(fontSize: 12),
            ),
            8.ph,
            _buildAttachments(
              attachements,
              cubit: cubit,
              title: question,
            ),
            16.ph,
            Text(
              "الإجابة",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.borderPrimary,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (cubit.isRecording) {
                      cubit.stopRecording();
                    } else {
                      cubit.startRecording();
                    }
                  },
                  child: SvgPicture.asset(
                    Assets.iconsMicrophone,
                    colorFilter: ColorFilter.mode(
                      cubit.isRecording ? Colors.red : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                8.pw,
                Material(
                  elevation: 1,
                  child: SizedBox(
                    height: 44.h,
                    width: 263.w,
                    child: CustomTextFormField(
                      vPadding: 0,
                      borderRadius: 0.cr,
                      borderColor: MainColors.background,
                      validator: customValidation,
                      hintText: "   أدخل الإجابة هنا............",
                      controller: cubit.assignmentAnswerController,
                      filledColor: MainColors.background,
                    ),
                  ),
                ),
                8.pw,
                GestureDetector(
                  onTap: () => cubit.pickFile(),
                  child: SvgPicture.asset(
                    Assets.iconsGallery,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildAttachments(
  List<String> attachments, {
  required LectureCubit cubit,
  required String title,
}) {
  if (attachments.isEmpty || attachments.first.isEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "لا توجد مرفقات",
          style: MainTextStyle.regularTextStyle(
            fontSize: 12,
            color: MainColors.onSurfaceSecondary,
          ),
        ),
        8.ph,
      ],
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 120.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: attachments.length,
          separatorBuilder: (_, __) => 8.pw,
          itemBuilder: (context, index) {
            final file = attachments[index];
            final isPdf = file.toLowerCase().endsWith('.pdf');
            final isImage = ['.jpg', '.jpeg', '.png', '.gif']
                .any((ext) => file.toLowerCase().endsWith(ext));

            return GestureDetector(
              onTap: () => _handleAttachmentTap(
                fileUrl: file,
                cubit: cubit,
                context: context,
                fileType: isPdf ? "pdf" : "image",
                title: title,
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: 110.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: MainColors.surfaceVariant,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isPdf) ...[
                          Icon(
                            Icons.picture_as_pdf,
                            size: 40.sp,
                            color: Colors.red,
                          ),
                          4.ph,
                          Text(
                            "ملف PDF",
                            style: MainTextStyle.regularTextStyle(fontSize: 10),
                          ),
                        ] else if (isImage) ...[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: AvatarImage(
                              imageFile: File(file),
                              width: 100.w,
                              height: 80.h,
                            ),
                          ),
                        ] else ...[
                          Icon(
                            Icons.insert_drive_file,
                            size: 40.sp,
                            color: Colors.blue,
                          ),
                          4.ph,
                          Text(
                            "ملف",
                            style: MainTextStyle.regularTextStyle(fontSize: 10),
                          ),
                        ],
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            file.split('/').last,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: MainTextStyle.regularTextStyle(
                              fontSize: 10,
                              color: MainColors.onSurfaceSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // أيقونة الحذف المعدلة
                  Positioned(
                    top: 4.h,
                    right: 4.w,
                    child: GestureDetector(
                      onTap: () {
                        // كود حذف المرفق هنا
                        cubit.removeAttachedFile(index);
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2.r,
                              offset: Offset(0, 1.h),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.close,
                          size: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      8.ph,
    ],
  );
}

void _handleAttachmentTap({
  required String fileUrl,
  required LectureCubit cubit,
  required BuildContext context,
  required String fileType,
  required String title,
}) {
  if (fileUrl.toLowerCase().endsWith('.pdf')) {
    cubit.openFile(
      fileUrl: fileUrl,
      fileType: fileType,
      context: context,
      title: title,
    );

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
