import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/build_loading_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Widget buildPageViewWithLoading(
    LectureCubit cubit, LectureState state, PageController pageController) {
  var programData = cubit.showProgramDetailsEntity?.data;

  if (programData == null) {
    return buildLoadingContainer(height: 100.h);
  }

  return Expanded(
    child: PageView.builder(
      controller: pageController,
      onPageChanged: (index) {
        // تحديث الـ TabController عند تغيير الصفحة
        cubit.controller.animateTo(index);

        // لا حاجة لاستدعاء التحميل هنا لأن TabController listener سيقوم بذلك
      },
      itemCount: cubit.screens.length,
      itemBuilder: (context, index) {
        return cubit.screens[index];
      },
    ),
  );
}
