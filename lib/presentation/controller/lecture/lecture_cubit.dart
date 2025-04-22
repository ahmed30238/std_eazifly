import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
      const Text("fgfg"),
      const Text("fgfg"),
      const Text("fgfg"),
      const Text("fgfg"),
      const Text("fgfg"),
      const Text("fgfg"),
  ];
    var tabs = [
    "الإحصائيات",
    "المواعيد",
    "الإمتحانات",
    "التسليمات",
    "التقارير",
    "ملاحظات",
  ];
}
