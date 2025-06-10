import 'package:eazifly_student/presentation/view/layout/library/widgets/program_with_stats_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';


class HomeBestSellersList extends StatelessWidget {
  const HomeBestSellersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
             ProgramWithStatsContainer(
              onTap: (){},
                        image: Assets.imagesPersona,
          likes: "2",
          noOfSubscription: "1",
          title: "dsfdsfsd",
          views: "3",
            ),
        separatorBuilder: (context, index) => 12.pw,
        itemCount: 4,
      ),
    );
  }
}