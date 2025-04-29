import 'package:eazifly_student/presentation/view/programs_underreview/widgets/under_review_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramsUnderReviewView extends StatelessWidget {
  const ProgramsUnderReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "برامج في المراجعة",
        leadingText: lang.myPrograms,
        isCenterTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) => UnderReviewItem(
          
          state: index == 0
              ? "accepted"
              : index == 1
                  ? "rejected"
                  : "pending",
        ),
        itemCount: 8,
        separatorBuilder: (context, index) => 24.ph,
      ),
    );
  }
}

var programTitles = [
  "عدد البرامج",
  "سعر المجموعة ",
  "تاريخ البدء",
];
