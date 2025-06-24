import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
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
      body: Column(
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
                      color: MainColors.blackText,
                    ),
                  ),
                  Text(
                    "${assignmentDetails?.mark} / ...",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.blackText,
                    ),
                  ),
                  TextedContainer(
                    width: 81.w,
                    text: "جاري التسليم",
                    containerColor: MainColors.lightYellow,
                    textColor: MainColors.yellow,
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
              );
            },
          ),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => cubit.removeAttachedFile(),
              );
            },
          ),
          BlocBuilder<LectureCubit, LectureState>(
            builder: (context, state) {
              if (cubit.selectedFile == null) {
                return GestureDetector(
                  onTap: () async {
                    await cubit.pickFile();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: MainColors.grayBorderColor),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file,
                            size: 40.sp, color: Colors.grey),
                        8.ph,
                        Text(
                          "اضغط لرفع ملف الإجابة (PDF أو صورة)",
                          style: MainTextStyle.regularTextStyle(
                            fontSize: 14,
                            color: MainColors.grayTextColors,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                // عرض الملف المرفق
                return Container(
                  width: double.infinity,
                  height: 200.h,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: MainColors.grayBorderColor),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: cubit.selectedFile!.path.endsWith('.pdf')
                      ? Column(
                          children: [
                            Icon(Icons.picture_as_pdf,
                                size: 50.sp, color: Colors.red),
                            8.ph,
                            Text(
                              "ملف PDF: ${cubit.selectedFile!.path.split('/').last}",
                              // style: MainTextStyle.regularTextStyle(),
                            ),
                          ],
                        )
                      : Image.file(
                          cubit.selectedFile!,
                          fit: BoxFit.cover,
                        ),
                );
              }
            },
          ),

// ... باقي الكود كما هو ...
          const Spacer(),
          // Expanded(
          //   child: ListView.separated(
          //     itemBuilder: (context, index) =>
          //     separatorBuilder: (context, index) => 16.ph,
          //     itemCount: 1,
          //   ),
          // ),
          8.ph,
          CustomElevatedButton(
            text: "تسليم الإجابات",
            width: 343.w,
            color: MainColors.blueTextColor,
            radius: 16.r,
            onPressed: () {
              cubit.postAssignment(
                  sessionAssignmentId: widget.assignmentId.toString());
            },
          ),
          32.ph,
        ],
      ),
    );
  }
}

class AssigmentItemContainer extends StatelessWidget {
  final String question;
  const AssigmentItemContainer({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LectureCubit>();
    return Container(
      height: 190.h,
      width: double.infinity,
      color: MainColors.veryLightGrayFormField,
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
            GestureDetector(
              onTap: () {
                cubit.playRecording();
              },
              child: Text("play"),
            ),
            16.ph,
            Text(
              "الإجابة",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.checkBoxBorderGray,
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
                    color: cubit.isRecording ? Colors.red : Colors.grey,
                  ), // أيقونة الميكروفون العادية
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
                      borderColor: MainColors.white,
                      hintText: "   أدخل الإجابة هنا............",
                      controller: cubit.assignmentAnswerController,
                      filledColor: MainColors.white,
                    ),
                  ),
                ),
                8.pw,
                GestureDetector(
                    onTap: () => cubit.pickFile(),
                    child: SvgPicture.asset(Assets.iconsGallery)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
