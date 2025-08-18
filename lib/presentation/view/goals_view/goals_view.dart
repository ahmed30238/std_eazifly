import 'package:eazifly_student/core/component/hexagon.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/goals_view/widgets/app_bar.dart';
import 'package:eazifly_student/presentation/view/goals_view/widgets/goals_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class GoalsView extends StatefulWidget {
  const GoalsView({super.key});

  @override
  State<GoalsView> createState() => _GoalsViewState();
}

class _GoalsViewState extends State<GoalsView> {
  late LectureCubit cubit;

  @override
  void initState() {
    cubit = context.read<LectureCubit>();
    super.initState();
    cubit.getContentChapters(
      userId: cubit.userId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoalsViewAppbar(),
      body: Column(
        children: [
          BlocBuilder<LectureCubit, LectureState>(
            builder: (context, state) {
              // إظهار loader أثناء تحميل البيانات
              if (cubit.getContentChaptersLoader) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              var goals = cubit.getContentChapterEntity?.data;

              // إظهار رسالة في حالة عدم وجود أهداف
              if (goals == null || goals.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.track_changes_outlined,
                          size: 80.r,
                          color: MainColors.onSurfaceSecondary,
                        ),
                        16.ph,
                        Text(
                          "لا توجد أهداف متاحة حالياً",
                          style: MainTextStyle.mediumTextStyle(
                            fontSize: 16,
                            color: MainColors.onSurfaceSecondary,
                          ),
                        ),
                        8.ph,
                        CustomElevatedButton(
                          text: "إعادة المحاولة",
                          textStyle: MainTextStyle.mediumTextStyle(
                            fontSize: 14,
                            color: MainColors.background,
                          ),
                          color: MainColors.primary,
                          width: 120.w,
                          height: 36.h,
                          radius: 8.r,
                          onPressed: () {
                            cubit.getContentChapters(
                              userId: cubit.userId,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Expanded(
                child: ListView(
                  children: [
                    20.ph,
                    ...List.generate(
                      goals.length,
                      (index) {
                        var goal = goals[index];
                        bool isAllElementDone = false;
                        if (goal.lessons != null && goal.lessons!.isNotEmpty) {
                          isAllElementDone = goal.lessons!.every(
                            (element) => element.isDone == true,
                          );
                        }
                        var points = goal.lessons?.fold<int>(0,
                                (total, element) {
                              int pointValue = 0;
                              if (element.points != null) {
                                pointValue =
                                    int.tryParse(element.points.toString()) ??
                                        0;
                              }
                              return total + pointValue;
                            }) ??
                            0;
                        return TimlineItem(
                          padding: EdgeInsets.symmetric(vertical: .5.h),
                          lineXY: .01,
                          indicatorXY: .4.h,
                          indicator: Checkbox.adaptive(
                            activeColor: MainColors.primary,
                            value: isAllElementDone,
                            onChanged: (p) {},
                            shape: const CircleBorder(),
                          ),
                          isFirst: index == 0,
                          isLast: index == goals.length - 1,
                          child: GoalsItem(
                            onTap: () {
                              Navigator.pushNamed(
                                arguments: {
                                  "chapterId": goal.id,
                                  "chapterTitle": goal.title ?? ""
                                },
                                context,
                                RoutePaths.goalDetailsView,
                              );
                            },
                            title: goal.title ?? "",
                            points: points.toString(),
                            description: goal.description ?? "",
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          8.ph,
          // زر قائمة المتصدرين يكون مخفي أثناء التحميل
          // BlocBuilder<LectureCubit, LectureState>(
          //   builder: (context, state) {
          //     if (cubit.getContentChaptersLoader) {
          //       return const SizedBox.shrink();
          //     }

          //     return CustomElevatedButton(
          //       text: "قائمة المتصدرين",
          //       textStyle: MainTextStyle.mediumTextStyle(
          //         fontSize: 16,
          //         color: MainColors.white,
          //       ),
          //       color: MainColors.blueTextColor,
          //       width: 147.w,
          //       height: 40.h,
          //       radius: 12.r,
          //       onPressed: () {
          //         Navigator.pushNamed(
          //           context,
          //           RoutePaths.leaderBoardView,
          //         );
          //       },
          //     );
          //   },
          // ),
          32.ph,
        ],
      ),
    );
  }
}

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexaGon(),
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: const BoxDecoration(
          // color: MainColors.white
          color: MainColors.onError,
          // borderRadius: 48.cr,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.imagesPersona,
            ),
          ),
        ),
      ),
    );
  }
}
