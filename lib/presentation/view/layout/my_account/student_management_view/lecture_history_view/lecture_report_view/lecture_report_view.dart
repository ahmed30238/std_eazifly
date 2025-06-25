import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureReportView extends StatefulWidget {
  final int index;
  const LectureReportView({super.key, required this.index});

  @override
  State<LectureReportView> createState() => _LectureReportViewState();
}

class _LectureReportViewState extends State<LectureReportView> {
  late LectureCubit cubit;
  
  @override
  void initState() {
    cubit = context.read<LectureCubit>();
    super.initState();
    cubit.getReportQuestions(index: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تقرير 1",
        leadingText: "بيانات الطالب",
        leadingCustomWidth: 120.w,
        isCenterTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  "إسم البرنامج",
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 12,
                    color: MainColors.grayTextColors,
                  ),
                ),
              ),
              14.ph,
              BlocBuilder<LectureCubit, LectureState>(
                builder: (context, state) {
                  return Text(
                    cubit.reportQuestionsEntity?.data?[widget.index].program ?? "",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                    ),
                  );
                },
              ),
              40.ph,
              Container(
                padding: EdgeInsets.all(16.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MainColors.veryLightGrayFormField,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "تقرير 1",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 15,
                        color: MainColors.blueTextColor,
                      ),
                    ),
                    8.ph,
                    Text(
                      "مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص. مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص.",
                      style: MainTextStyle.mediumTextStyle(
                        fontSize: 12,
                        color: MainColors.grayTextColors,
                      ).copyWith(
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              24.ph, // Add some bottom padding
            ],
          ),
        ),
      ),
    );
  }
}