import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/build_goal_percent_with_loading.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/build_lecture_data_with_loading.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/build_lecture_link_with_loading.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/build_lecture_stats_with_loader.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/build_pageview_with_loading.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/build_tabbar_with_loading.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/child_navigator.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_view_app_bar.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureView extends StatefulWidget {
  final int programId;

  const LectureView({
    super.key,
    required this.programId,
  });

  @override
  State<LectureView> createState() => _LectureViewState();
}

class _LectureViewState extends State<LectureView>
    with SingleTickerProviderStateMixin {
  late LectureCubit cubit;
  late PageController pageController;

  @override
  void initState() {
    cubit = context.read<LectureCubit>();
    cubit.initController(this, widget.programId);
    cubit.showProgramDetails(programId: widget.programId);
    context
        .read<MyProgramsCubit>()
        .getAssignedChildrenToProgram(programId: widget.programId);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LectureCubit.get(context);
    return Scaffold(
      appBar: LectureViewAppBar(cubit: cubit, widget: widget),
      body: BlocBuilder<LectureCubit, LectureState>(
        bloc: cubit,
        builder: (context, state) {
          // إذا كانت البيانات الأساسية لسه بتتحمل
          if (cubit.showProgramDetailsLoader) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ShowProgramDetailsErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 50),
                  const SizedBox(height: 16),
                  Text(state.errorMessage),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      cubit.showProgramDetails(programId: widget.programId);
                    },
                    child: const Text("إعادة المحاولة"),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              10.ph,
              buildLectureStatsWithLoading(cubit, state),
              24.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildLectureDataWithLoading(cubit, state),
                  8.pw,
                  buildLectureLinkWithLoading(
                      context, cubit, state, widget.programId),
                ],
              ),
              8.ph,
              buildGoalsPercentWithLoading(cubit, state, context),
              20.ph,
              ChildrenNavigator(
                programId: widget.programId,
              ),
              1.ph,
              buildTabBarWithLoading(cubit, state, pageController),
              8.ph,
              buildPageViewWithLoading(cubit, state, pageController),
              8.ph,
            ],
          );
        },
      ),
    );
  }
}


