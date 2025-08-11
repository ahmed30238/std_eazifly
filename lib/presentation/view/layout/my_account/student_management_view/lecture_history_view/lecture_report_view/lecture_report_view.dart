import 'package:eazifly_student/data/models/my_programs/get_report_questions_model.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureReportView extends StatefulWidget {
  final int index;
  const LectureReportView({
    super.key,
    required this.index,
  });

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
        mainTitle:
            cubit.reportQuestionsEntity?.data?[widget.index].program ?? "",
        leadingText: "بيانات الطالب",
        leadingCustomWidth: 120.w,
        isCenterTitle: true,
      ),
      body: Padding(
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
                  color: MainColors.onSurfaceSecondary,
                ),
              ),
            ),
            14.ph,
            BlocBuilder<LectureCubit, LectureState>(
              builder: (context, state) {
                if (cubit.getReportQuestionsLoader) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: MainColors.primary,
                    ),
                  );
                }
                return Text(
                  cubit.reportQuestionsEntity?.data?.first.program ?? "",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                  ),
                );
              },
            ),
            40.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (cubit.getReportQuestionsLoader) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: MainColors.primary,
                      ),
                    ),
                  );
                }

                if (state is GetReportQuestionsErrorState) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        "حدث خطأ في تحميل البيانات",
                        style: MainTextStyle.mediumTextStyle(
                          fontSize: 14,
                          color: MainColors.onError,
                        ),
                      ),
                    ),
                  );
                }

                var questions = cubit.reportQuestionsEntity?.data;
                if (questions == null || questions.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        "لا توجد أسئلة متاحة",
                        style: MainTextStyle.mediumTextStyle(
                          fontSize: 14,
                          color: MainColors.onSurfaceSecondary,
                        ),
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      var question = questions[index];
                      return EssayReportQuestion(
                        question: question,
                      );
                    },
                    separatorBuilder: (context, index) => 10.ph,
                    itemCount: questions.length,
                  ),
                );
              },
            ),
            24.ph,
          ],
        ),
      ),
    );
  }
}

class EssayReportQuestion extends StatelessWidget {
  const EssayReportQuestion({
    super.key,
    required this.question,
  });

  final GetReportQuestionsDatumModel? question;

  @override
  Widget build(BuildContext context) {
    String? answer = question?.answer;
    var rightMultiSelectTitle = question?.reportQuestion?.options
        ?.firstWhere(
          (element) =>
              element.id! ==
              int.tryParse(
                question?.reportQuestionAnswerId ?? "",
              ),
          orElse: () =>
              GetReportQuestionsOptionModel(), // أو يمكنك إنشاء object فارغ
        )
        .title;
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MainColors.inputFill,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            question?.reportQuestion?.title ?? "",
            style: MainTextStyle.boldTextStyle(
              fontSize: 15,
              color: MainColors.primary,
            ),
          ),
          8.ph,
          Text(
            answer ?? rightMultiSelectTitle ?? "لا توجد إجابة",
            style: MainTextStyle.mediumTextStyle(
              fontSize: 12,
              color: MainColors.onSurfaceSecondary,
            ).copyWith(
              height: 1.5,
            ),
          ),
          if (question?.note?.isNotEmpty ?? false) ...[
            8.ph,
            Text(
              "ملحوظة: ${question?.note}",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.onSurfaceSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
