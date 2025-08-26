 import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/goals_percent_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

  Widget buildGoalsPercentWithLoading(LectureCubit cubit, LectureState state,BuildContext context) {
    var programData = cubit.showProgramDetailsEntity?.data;

    // if (programData == null) {
    //   return buildLoadingContainer(height: 100.h);
    // }

    return GoalsPercentContainer(
      onTap: () => Navigator.pushNamed(
        context,
        RoutePaths.goalsScreen,
      ),
      percent: (programData?.goalsPercentage?.toString()) ?? "0",
    );
  }