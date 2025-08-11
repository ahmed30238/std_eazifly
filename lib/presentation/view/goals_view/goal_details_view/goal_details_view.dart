import 'dart:developer';

import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/goals_view/goal_details_view/widgets/goal_data_widget.dart';
import 'package:eazifly_student/presentation/view/goals_view/goal_details_view/widgets/progress_percent_container.dart';
import 'package:eazifly_student/presentation/view/goals_view/goal_details_view/widgets/sub_goals_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalDetailsView extends StatefulWidget {
  final int chapterId;
  final String chapterTitle;
  const GoalDetailsView({
    super.key,
    required this.chapterId,
    required this.chapterTitle,
  });

  @override
  State<GoalDetailsView> createState() => _GoalDetailsViewState();
}

class _GoalDetailsViewState extends State<GoalDetailsView> {
  late LectureCubit cubit;

  @override
  void initState() {
    cubit = context.read<LectureCubit>();
    super.initState();
    cubit.getChapterLessons(
      chapterId: widget.chapterId,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
        child: BlocBuilder<LectureCubit, LectureState>(
          builder: (context, state) {
            return CustomAppBar(
              context,
              mainTitle: widget.chapterTitle,
              isCenterTitle: true,
              leadingText: lang.back,
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            32.ph,
            // Goal Data Widget مع Loader
            BlocBuilder<LectureCubit, LectureState>(
              builder: (context, state) {
                if (cubit.getChapterLessonsLoader) {
                  return Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                var points = cubit.chapterLessonsEntity?.data?.fold<int>(0,
                        (total, element) {
                      int pointValue = 0;
                      if (element.points != null) {
                        pointValue =
                            int.tryParse(element.points.toString()) ?? 0;
                      }
                      return total + pointValue;
                    }) ??
                    0;

                return GoalDataWidget(
                  points: points.toString(),
                  title: widget.chapterTitle,
                );
              },
            ),
            20.ph,
            // Progress Container مع Loader
            BlocBuilder<LectureCubit, LectureState>(
              builder: (context, state) {
                if (cubit.getChapterLessonsLoader) {
                  return Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                var doneTasksLength = cubit.chapterLessonsEntity?.data
                    ?.where(
                      (element) => element.isDone == true,
                    )
                    .toList()
                    .length;
                int totallessons =
                    cubit.chapterLessonsEntity?.data?.length ?? 0;
                double percent = 0.0;
                if (doneTasksLength != null && totallessons > 0) {
                  percent = doneTasksLength / totallessons;
                }
                log("$doneTasksLength");
                return ProgressPercentContainer(
                  percent: (percent * 100).toString(),
                );
              },
            ),
            20.ph,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الأهداف الفرعية",
                style: MainTextStyle.regularTextStyle(
                  fontSize: 11,
                  color: MainColors.onSurfaceSecondary,
                ),
              ),
            ),
            12.ph,
            // Sub Goals List مع Loader
            BlocBuilder<LectureCubit, LectureState>(
              builder: (context, state) {
                if (cubit.getChapterLessonsLoader) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                var lessons = cubit.chapterLessonsEntity?.data;

                // إذا لم تكن هناك دروس
                if (lessons == null || lessons.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        "لا توجد أهداف فرعية",
                        style: MainTextStyle.regularTextStyle(
                          fontSize: 14,
                          color: MainColors.onSurfaceSecondary,
                        ),
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var lesson = lessons[index];
                      return SubGoalsWidget(
                        index: index,
                        description: lesson.description ?? "",
                        title: lesson.title ?? "",
                        isDone: lesson.isDone ?? false,
                        lessonId: lesson.id ?? -1,
                      );
                    },
                    separatorBuilder: (context, index) => 16.ph,
                    itemCount: lessons.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
