import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/goals_percent_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Widget buildGoalsPercentWithLoading(LectureCubit cubit, BuildContext context) {
  var programData = cubit.showProgramDetailsEntity?.data;

  // if (programData == null) {
  //   return buildLoadingContainer(height: 100.h);
  // }

  return GoalsPercentContainer(
    onTap: () {
      delightfulToast(message: "سيتم عرض هذه الميزة قريبا", context: context);
      //   Navigator.pushNamed(
      //   context,
      //   RoutePaths.goalsScreen,
      // );
    },
    percent: (programData?.goalsPercentage?.toString()) ?? "0",
  );
}
