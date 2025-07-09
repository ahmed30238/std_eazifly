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
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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

  /// 🟡 Tutorial setup
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];
  GlobalKey btnKey = GlobalKey();

  @override
  void initState() {
    cubit = context.read<LectureCubit>();
    cubit.initController(this, widget.programId);
    cubit.showProgramDetails(programId: widget.programId);
    context.read<MyProgramsCubit>().getAssignedChildrenToProgram(
          programId: widget.programId,
        );
    pageController = PageController();

    /// 🟡 Start the tutorial
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(milliseconds: 300),
        () {
          showTutorial();
        },
      );
    });

    super.initState();
  }

  /// 🟡 Show tutorial coach mark
  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      // useSafeArea: false,
      // context: context,
      targets: targets,
      textSkip: "تخطي",
      paddingFocus: 8,
      colorShadow: Colors.black.withOpacity(0.8),
      onFinish: () => print("تم الانتهاء من الشرح"),
    )..show(context: context);
  }

  /// 🟡 Define what elements to highlight
  void initTargets() {
    targets.clear();
    targets.add(
      TargetFocus(
        identify: "more_button",
        keyTarget: btnKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Text(
              "اضغط هنا لرؤية المزيد",
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
                color: MainColors.white,
              ),
            ),
          ),
        ],
      ),
    );
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
      appBar: LectureViewAppBar(
        cubit: cubit,
        widget: widget,
        btnKey: btnKey,
      ),
      body: BlocBuilder<LectureCubit, LectureState>(
        bloc: cubit,
        builder: (context, state) {
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
              ChildrenNavigator(programId: widget.programId),
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
