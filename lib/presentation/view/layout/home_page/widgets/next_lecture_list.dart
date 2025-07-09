import 'package:eazifly_student/presentation/view/layout/home_page/widgets/next_lecture_item.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/my_programs.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NextLectureList extends StatelessWidget {
  final bool isHorizontal;
  const NextLectureList({
    super.key,
    this.isHorizontal = true,
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
            padding:
                isHorizontal ? null : EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var session = closestSessions?[index];
              return NextLectureItem(
                isRejoin: session?.status == "started",
                onRejoinTap: () {
                  openUrl(session?.meetingUrl ?? "");
                },
                sessionState:
                    "${session?.sessionDate.toString().substring(0, 10)}",
                sessionDuration: "${session?.duration} دقيقة",
                sessionTime: convertTo12HourFormat(
                    int.tryParse(session?.sessionTime?.split(":").first ?? "") ??
                        0,
                    int.tryParse(session?.sessionTime?.split(":")[1] ?? "") ??
                        0),
                // "${session?.sessionTime?.substring(0, 5)} ${session?.sessionTimeTo?.substring(0, 5)}",
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
