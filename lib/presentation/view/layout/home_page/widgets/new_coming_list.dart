
import 'package:eazifly_student/presentation/view/layout/library/widgets/program_with_stats_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NewComingList extends StatelessWidget {
  const NewComingList({
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
            const ProgramWithStatsContainer(),
        separatorBuilder: (context, index) => 12.pw,
        itemCount: 4,
      ),
    );
  }
}