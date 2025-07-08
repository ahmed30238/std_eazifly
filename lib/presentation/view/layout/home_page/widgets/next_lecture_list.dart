import 'package:eazifly_student/presentation/view/layout/home_page/widgets/next_lecture_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NextLectureList extends StatelessWidget {
  const NextLectureList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var closestSessions = cubit.getHomeClosestSessionsEntity?.data;
        return SizedBox(
          height: 127.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var session = closestSessions?[index];
              return NextLectureItem(
                sessionDuration: "${session?.duration} دقيقة",
                sessionTime:
                    "${session?.sessionTime?.substring(0, 5)} ${session?.sessionTimeTo?.substring(0, 5)}",
                title: session?.programTitle ?? "",
                onTap: () =>
                    Navigator.pushNamed(context, RoutePaths.currentSession),
              );
            },
            separatorBuilder: (context, index) => 12.pw,
            itemCount: closestSessions?.length ?? 0,
          ),
        );
      },
    );
  }
}
