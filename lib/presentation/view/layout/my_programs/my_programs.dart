import 'dart:developer';

import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/my_programs_loder.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/program_item.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/program_navigation.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class MyProgramsView extends StatefulWidget {
  const MyProgramsView({super.key});

  @override
  State<MyProgramsView> createState() => _MyProgramsViewState();
}

class _MyProgramsViewState extends State<MyProgramsView> {
  late MyProgramsCubit cubit;
  final GetStorage storage = GetStorage();

  // Key for storing tutorial completion status
  static const String _tutorialCompletedKey = 'my_programs_tutorial_completed';

  GlobalKey keyReviewButton = GlobalKey();
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];

  @override
  void initState() {
    cubit = context.read<MyProgramsCubit>();
    context.read<ProgramsUnderReviewCubit>().getUserOrders();
    cubit.getMyPrograms();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!_isTutorialCompleted()) {
          showTutorial();
        }
      });
    });

    super.initState();
  }

  // Check if tutorial has been completed before
  bool _isTutorialCompleted() {
    return storage.read(_tutorialCompletedKey) ?? false;
  }

  // Mark tutorial as completed
  void _markTutorialCompleted() {
    storage.write(_tutorialCompletedKey, true);
  }

  void showTutorial() {
    var lang = context.loc!;
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      textSkip: lang.skip,

      paddingFocus: 10,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      onFinish: () {
        log(lang.tutorialFinished);
        _markTutorialCompleted(); // Mark as completed when finished
      },
      onSkip: () {
        log(lang.tutorialSkipped);
        _markTutorialCompleted(); // Mark as completed when skipped
        return true;
      },
    )..show(context: context);
  }

  void initTargets() {
    var lang = context.loc!;

    targets.clear();
    targets.add(
      TargetFocus(
        identify: "review_button",
        keyTarget: keyReviewButton,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Text(
              lang.reviewProgramsTutorial,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  // Optional: Method to reset tutorial (for testing or settings)
  void resetTutorial() {
    storage.remove(_tutorialCompletedKey);
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.myPrograms,
        leadingText: "",
        leadingCustomWidth: 10.w,
        customAction: [
          InkWell(
            key: keyReviewButton,
            onTap: () => Navigator.pushNamed(
              context,
              RoutePaths.programsUnderReviewView,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(Assets.iconsMyProgramAppbar),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          16.ph,
          CustomTextFormField(
            prefixIconWidget: const PrefixSearchFormField(),
            controller: TextEditingController(),
            hintText: lang.search,
            suffixIconWidget: const SuffixMenuFormField(),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              // مراقبة القيمة المطلوبة بس - أفضل أداء
              final programsUnderReview = context
                  .select<ProgramsUnderReviewCubit, List?>(
                    (cubit) => cubit.getUserOrdersEntity?.data,
                  );

              if (cubit.getMyProgramsLoader) {
                return const MyProgramsLoader();
              } else if (!cubit.getMyProgramsLoader) {
                var myPrograms = cubit.getMyProgramsEntity?.data;

                if (myPrograms == null ||
                    myPrograms.isEmpty &&
                        programsUnderReview?.isEmpty == true) {
                  return Column(
                    children: [
                      NoDataAnimatedImageWidget(message: lang.noSubscriptions),
                      24.ph,
                      GestureDetector(
                        onTap: () {
                          context.read<LayoutCubit>().changeIndex(1);
                        },
                        child: Text(
                          lang.subscribeNow,
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.primary,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (programsUnderReview?.isNotEmpty == true &&
                    myPrograms.isEmpty) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.programsUnderReviewView,
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        270.ph,
                        Center(
                          child: Text(
                            lang.programsUnderReview,
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 16,
                              color: MainColors.primary,
                            ),
                          ),
                        ),
                        8.ph,
                        Center(
                          child: Text(
                            lang.tapToAddSessions,
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 16,
                              color: MainColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = myPrograms[index];
                    bool started = item.currentSession?.status == "started";

                    String nextLec = "";
                    String formattedTimeDiff = "";

                    if (item.currentSession?.status != null) {
                      if (item.nextSession != null) {
                        int hour = item.nextSession!.hour;
                        int minute = item.nextSession!.minute;
                        nextLec = convertTo12HourFormat(hour, minute);
                        formattedTimeDiff = formatTimeDifference(
                          item.nextSession,
                        );
                      } else {
                        nextLec = lang.alreadyStarted;
                        formattedTimeDiff = lang.ongoingNow;
                      }
                    } else {
                      if (item.nextSession != null) {
                        int hour = item.nextSession!.hour;
                        int minute = item.nextSession!.minute;
                        nextLec = convertTo12HourFormat(hour, minute);
                        formattedTimeDiff = formatTimeDifference(
                          item.nextSession,
                        );
                      } else {
                        nextLec = lang.notSpecified;
                        formattedTimeDiff = lang.notSpecified;
                      }
                    }

                    return ProgramItem(
                      desc: item.description ?? lang.noDescription,

                      duration: "${item.duration} ${lang.minutes}",

                      image: item.image ?? "",
                      nextLec: nextLec,
                      status: item.currentSession?.status ?? "",
                      title: item.title ?? "",
                      isRejoin: started,
                      timeDiff: formattedTimeDiff,
                      onRejoinTap: () async {
                        await cubit.joinSession(
                          sessionId: item.currentSession?.id ?? -1,
                        );
                        Navigator.pushNamed(
                          context,
                          arguments: {
                            "cubit": cubit,
                            "sessionId": item.currentSession?.id ?? -1,
                          },
                          RoutePaths.navigateToLectureView,
                        );
                      },
                      onTap: cubit.getAssignedChildrenLoader
                          ? () {}
                          : () async {
                              await cubit
                                  .getAssignedChildrenToProgram(
                                    programId: item.id ?? -1,
                                  )
                                  .then((value) {
                                    onMyProgramTap(
                                      context: context,
                                      cubit: cubit,
                                      item: item,
                                      programId: item.id ?? -1,
                                      noOfChildren:
                                          cubit
                                              .getAssignedChildrenToProgramEntity
                                              ?.data
                                              ?.length ??
                                          0,
                                    );
                                  });
                            },
                    );
                  },
                  separatorBuilder: (context, index) => 20.ph,
                  itemCount: myPrograms.length,
                );
              } else if (state is GetMyProgramsErrorState) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const SizedBox();
              }
            },
          ),
          20.ph,
        ],
      ),
    );
  }
}
