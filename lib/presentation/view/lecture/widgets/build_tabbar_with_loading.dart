import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecure_tabbar.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Widget buildTabBarWithLoading(LectureCubit cubit) {
  // var programData = cubit.showProgramDetailsEntity?.data;

  // if (programData == null) {
  //   return buildLoadingContainer(height: 50.h);
  // }

  return LectureTabBar(
    cubit: cubit,
    onTabTap: (index) {
      // تحريك الـ PageView عند الضغط على تاب
      // cubit.pageController.animateToPage(
      //    index,
      //    duration: const Duration(milliseconds: 300),
      //    curve: Curves.easeInOut,
      //  );
    },
  );
}
