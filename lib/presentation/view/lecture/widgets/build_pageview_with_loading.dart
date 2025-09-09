import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Widget buildPageViewWithLoading(
    LectureCubit cubit) {
  // var programData = cubit.showProgramDetailsEntity?.data;
  //
  // if (programData == null) {
  //   return buildLoadingContainer(height: 100.h);
  // }

  return Expanded(
    child: cubit.screens[cubit.controller.index],
    // PageView.builder(
    //   controller: cubit.pageController,
    //   onPageChanged: (index) {
    //     // تحديث الـ TabController عند تغيير الصفحة
    //     cubit.controller.animateTo(index);
    //
    //     // لا حاجة لاستدعاء التحميل هنا لأن TabController listener سيقوم بذلك
    //   },
    //   itemCount: cubit.screens.length,
    //   itemBuilder: (context, index) {
    //     return
    //   },
    // ),
  );
}
