import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/lecture/lecture_view_loader.dart';
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
import 'package:get_storage/get_storage.dart';

class LectureView extends StatefulWidget {
  final int programId;

  const LectureView({super.key, required this.programId});

  @override
  State<LectureView> createState() => _LectureViewState();
}

class _LectureViewState extends State<LectureView>
    with SingleTickerProviderStateMixin {
  late LectureCubit cubit;
  late MyProgramsCubit myProgramsCubit;
  final GetStorage storage = GetStorage();

  /// 🟡 Tutorial setup
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];
  GlobalKey btnKey = GlobalKey();

  // Key for storing tutorial completion status
  static const String _lectureTutorialCompletedKey =
      'lecture_tutorial_completed';

  // إعداد بيانات الطفل الابتدائي
  void _setupInitialChild() async {
    if (cubit.currentUserIndex != -1 &&
        myProgramsCubit.getAssignedChildrenToProgramEntity?.data != null) {
      var children = myProgramsCubit.getAssignedChildrenToProgramEntity!.data!;
      if (cubit.currentUserIndex < children.length) {
        int userId = children[cubit.currentUserIndex].id ?? -1;
        cubit.fillUserId(userId);

        await Future.delayed(const Duration(milliseconds: 100));

        if (mounted) {
          cubit.studentPageViewController.jumpToPage(
            cubit.currentUserIndex,
            // duration: const Duration(milliseconds: 300),
            // curve: Curves.easeInOut,
          );

          // استدعاء sessions للطفل المحدد
          // cubit.getProgramSessions(programId: widget.programId, userId: userId);
        }
      }
    }
  }

  @override
  void initState() {
    cubit = context.read<LectureCubit>();
    myProgramsCubit = context.read<MyProgramsCubit>();
    cubit.initController(this, widget.programId);
    cubit.showProgramDetails(programId: widget.programId);
    // myProgramsCubit.getAssignedChildrenToProgram(
    //   programId: widget.programId,
    // );
    /// 🟡 Start the tutorial only if not shown before
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!_isTutorialCompleted()) {
          showTutorial();
        }
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupInitialChild();
    });

    super.initState();
  }

  // Check if tutorial has been completed before
  bool _isTutorialCompleted() {
    return storage.read(_lectureTutorialCompletedKey) ?? false;
  }

  // Mark tutorial as completed
  void _markTutorialCompleted() {
    storage.write(_lectureTutorialCompletedKey, true);
  }

  /// 🟡 Show tutorial coach mark
  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      textSkip: "تخطي",
      paddingFocus: 8,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      onFinish: () {
        _markTutorialCompleted(); // Mark as completed when finished
      },
      onSkip: () {
        _markTutorialCompleted(); // Mark as completed when skipped
        return true;
      },
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
                color: MainColors.background,
              ).copyWith(),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    var cubit = LectureCubit.get(context);
    return Scaffold(
      appBar: LectureViewAppBar(cubit: cubit, widget: widget, btnKey: btnKey),
      body: BlocBuilder<MyProgramsCubit, MyProgramsState>(
        bloc: myProgramsCubit,
        builder: (context, state) {
          if (myProgramsCubit.getAssignedChildrenLoader) {
            return const Center(child: LectureViewLoader());
          }

          if (state is GetAssignedChildrenErrorState) {
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
                      myProgramsCubit.getAssignedChildrenToProgram(
                        programId: widget.programId,
                      );
                    },
                    child: const Text("إعادة المحاولة"),
                  ),
                ],
              ),
            );
          }

          return BlocBuilder<LectureCubit, LectureState>(
            builder: (context, state) {
              return PageView.builder(
                itemBuilder: (context, index) {
                  String host =
                      cubit.showProgramDetailsEntity?.data?.host ?? "";
                  return Column(
                    children: [
                      10.ph,
                      buildLectureStatsWithLoading(myProgramsCubit, index),
                      24.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildLectureDataWithLoading(host),
                          8.pw,
                          buildLectureLinkWithLoading(
                            context,
                            myProgramsCubit,
                            widget.programId,
                            index,
                            host,
                          ),
                        ],
                      ),
                      8.ph,
                      buildGoalsPercentWithLoading(cubit, context),
                      20.ph,
                      ChildrenNavigator(
                        programId: widget.programId,
                        childIndex: index,
                      ),
                      1.ph,
                      buildTabBarWithLoading(cubit),
                      8.ph,
                      buildPageViewWithLoading(cubit),
                      8.ph,
                    ],
                  );
                },
                controller: cubit.studentPageViewController,
                itemCount:
                    myProgramsCubit
                        .getAssignedChildrenToProgramEntity
                        ?.data
                        ?.length ??
                    0,
                onPageChanged: (childIndex) {
                  cubit.controller.animateTo(0);

                  cubit.changeCurrentUserIndex(childIndex);
                  // final myProgramsCubit = context.read<MyProgramsCubit>();
                  cubit.studentPageViewController.animateToPage(
                    childIndex,
                    duration: const Duration(microseconds: 500),
                    curve: Curves.bounceIn,
                  );
                  int userId =
                      myProgramsCubit
                          .getAssignedChildrenToProgramEntity
                          ?.data?[childIndex]
                          .id ??
                      -1;
                  cubit.fillUserId(userId);
                  cubit.getProgramSessions(
                    programId: widget.programId,
                    userId: userId,
                  );
                  // myProgramsCubit.getAssignedChildrenToProgram(
                  //   programId: widget.programId,
                  // );
                },
              );
            },
          );
        },
      ),
    );
  }
}
