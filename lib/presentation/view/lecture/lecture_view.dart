import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_linear_percent_indicator.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_data_item.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_link_item.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecure_tabbar.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/student_change_item.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureView extends StatefulWidget {
  final bool? isFinishedLecture;

  const LectureView({
    super.key,
    this.isFinishedLecture,
  });

  @override
  State<LectureView> createState() => _LectureViewState();
}

class _LectureViewState extends State<LectureView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    LectureCubit.get(context).initController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LectureCubit.get(context);
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "محاضرة رياضيات للصف السادس",
        leadingText: "المواعيد",
        isCenterTitle: true,
        leadingCustomWidth: 80.w,
        onLeadinTap: () => Navigator.pop(context),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          10.ph,
          // TODO
          // BlocBuilder(
          //   bloc: cubit,
          //   builder:(context, state) {
          //     var item = cubit. 
          //     return LectureStats(
          //     state: item.currentSession?.status == "started" 
          //       ? LectureStatesEnum.ongoing 
          //       : item.currentSession?.status == "finished"
          //         ? LectureStatesEnum.finished
          //         : LectureStatesEnum.dated,
          //     reJoin: item.currentSession?.status == "started",
          //     onRejoinTap: () {
          //       // كود إعادة الدخول
          //     },
          //     nextLecture: nextLec, // الوقت المنسق من الدالة السابقة
          //     duration: "${item.duration} دقيقة",
          //     timeDiff: formattedTimeDiff, // الوقت المنسق من الدالة السابقة
          //     titleText: ["المحاضرة التالية", "مدة الجلسة", "حالة الجلسة"], // اختياري
          //   );
          //   },
          // ),
          24.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LectureData(),
              8.pw,
              LectureLink(
                width: 226.w,
                isFinishedLecture: widget.isFinishedLecture,
              ),
            ],
          ),
          8.ph,
          InkWell(
            onTap: () {
              print("tapped");
              Navigator.pushNamed(
                context,
                RoutePaths.goalsScreen,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 82.h,
              decoration: const BoxDecoration(
                color: MainColors.veryLightGrayFormField,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.ph,
                  SizedBox(
                    height: 20.h,
                    child: Text(
                      "أهداف البرنامج",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.grayTextColors,
                      ),
                    ),
                  ),
                  8.ph,
                  SizedBox(
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "نسبة الإنجاز",
                          style: MainTextStyle.boldTextStyle(fontSize: 11),
                        ),
                        Text(
                          "45 %",
                          style: MainTextStyle.boldTextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  4.ph,
                  CustomLinearPercentIndicator(
                    percent: .45,
                    width: 310.w,
                  ),
                  4.ph,
                ],
              ),
            ),
          ),
          20.ph,
          const StudentsChangeItem(),
          1.ph,
          BlocBuilder<LectureCubit, LectureState>(
            builder: (context, state) {
              return LectureTabBar(cubit: cubit);
            },
          ),
          8.ph,
          BlocBuilder<LectureCubit, LectureState>(
            bloc: cubit,
            builder: (context, state) {
              var index = cubit.controller.index;
              return SizedBox(
                height: index == 0
                    ? 74 * 9
                    : index == 1
                        ? 500.h
                        : 400.h,
                child: TabBarView(
                  controller: cubit.controller,
                  children: cubit.screens,
                ),
              );
            },
          ),
          8.ph,
        ],
      ),
    );
  }
}
