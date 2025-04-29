
import 'package:eazifly_student/presentation/view/layout/home_page/widgets/next_lecture_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';


class NextLectureList extends StatelessWidget {
  const NextLectureList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 127.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => NextLectureItem(
          onTap:() =>  Navigator.pushNamed(context,RoutePaths.navigateToLectureView),
        ),
        separatorBuilder: (context, index) => 12.pw,
        itemCount: 4,
      ),
    );
  }
}
