import 'package:eazifly_student/core/component/spline_area_chart.dart';
import 'package:eazifly_student/core/component/stats_area.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/deliveries_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/exam_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/notes_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/report_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/schedules_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LectureCubit extends Cubit<LectureState> {
  LectureCubit() : super(LectureInitial());
    static LectureCubit get(context) => BlocProvider.of(context);
  late TabController controller;
  void initController(TickerProvider vsync) {
    controller = TabController(length: tabs.length, vsync: vsync)
      ..addListener(
        () {
          if (controller.indexIsChanging) {
            emit(TabIndexState());
          }
        },
      );

  }

    List<Widget> screens = [
    const SchedulesBody(),
    StatsArea(
      chartData: chartData,
      gradientColors: gradientColors,
    ),
    const ExamBodyWidget(),
    const DeliveriesBodyWidget(),
    const ReportBody(),
    const NotesBodyWidget(),
  ];
    var tabs = [
    "المواعيد",
    "الإحصائيات",
    "الإمتحانات",
    "التسليمات",
    "التقارير",
    "الملاحظات",
  ];
}
