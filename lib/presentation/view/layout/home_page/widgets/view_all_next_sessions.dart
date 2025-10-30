import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ViewAllNextSessions extends StatelessWidget {
  const ViewAllNextSessions({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "المحاضرات القادمة",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "المحاضرات القادمة",
              style: MainTextStyle.boldTextStyle(fontSize: 15),
            ),
          ),
          24.ph,
          // إضافة Hero Widget مع نفس الـ tag
          const Expanded(
            child: Hero(
              tag: "next_lectures_hero",
              child: Material(
                color: Colors.transparent,
                child: NextLectureList(isHorizontal: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
