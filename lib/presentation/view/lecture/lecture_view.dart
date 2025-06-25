import 'dart:developer';

import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/child_navigator.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/goals_percent_container.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_data_item.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_link_item.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_state_helper.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecure_tabbar.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            String title =
                cubit.showProgramDetailsEntity?.data?.title ?? "البرنامج";
            return CustomAppBar(
              context,
              mainTitle: title,
              leadingText: "المواعيد",
              isCenterTitle: true,
              leadingCustomWidth: 80.w,
              onLeadinTap: () => Navigator.pop(context),
            );
          },
        ),
      ),
      body: BlocBuilder<LectureCubit, LectureState>(
        bloc: cubit,
        builder: (context, state) {
          // إذا كانت البيانات الأساسية لسه بتتحمل
          if (cubit.showProgramDetailsLoader) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // إذا في error في البيانات الأساسية
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

          // إذا البيانات الأساسية جاهزة
          return Column(
            children: [
              10.ph,
              // Lecture Stats مع loading
              _buildLectureStatsWithLoading(cubit, state),
              24.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Lecture Data مع loading
                  _buildLectureDataWithLoading(cubit, state),
                  8.pw,
                  // Lecture Link مع loading
                  _buildLectureLinkWithLoading(cubit, state),
                ],
              ),
              8.ph,
              // Goals Percent مع loading
              _buildGoalsPercentWithLoading(cubit, state),
              20.ph,
              ChildrenNavigator(
                programId: widget.programId,
              ),
              // BlocBuilder<MyProgramsCubit, MyProgramsState>(
              //   builder: (context, state) {
              //     var programCubit = context.read<MyProgramsCubit>();
              //     var userName = context
              //         .read<MyProgramsCubit>()
              //         .getAssignedChildrenToProgramEntity
              //         ?.data?[0]
              //         .firstName;

              //     DataModel log = DataModel.fromJson(
              //       jsonDecode(
              //         GetStorage().read(StorageEnum.loginModel.name),
              //       ),
              //     );

              //     return StudentsChangeItem(
              //       studentName: userName ?? "${log.firstName} ${log.lastName}",
              //       onBackTap: () {
              //         cubit.showProgramDetails(programId: widget.programId);
              //         cubit.getProgramSessions(
              //             programId: widget.programId,
              //             userId: programCubit
              //                     .getAssignedChildrenToProgramEntity
              //                     ?.data?[0]
              //                     .id ??
              //                 -1);
              //         cubit.getProgramAssignments(programId: widget.programId, userId: userId)
              //       },
              //       onNextTap: () {
              //         cubit.showProgramDetails(programId: widget.programId);
              //         // cubit.getUserSe
              //       },
              //     );
              //   },
              // ),
              1.ph,
              // Tab Bar مع loading
              _buildTabBarWithLoading(cubit, state),
              8.ph,
              // Page View مع loading (بدل من TabBarView)
              _buildPageViewWithLoading(cubit, state),
              8.ph,
            ],
          );
        },
      ),
    );
  }

  Widget _buildLectureStatsWithLoading(LectureCubit cubit, LectureState state) {
    var programData = cubit.showProgramDetailsEntity?.data;

    if (programData == null) {
      return _buildLoadingContainer(height: 120.h);
    }

    // تحديد حالة المحاضرة
    LectureStatesEnum lectureState = LectureStateHelper.getLectureState(
      nextSession: programData.nextSession,
      nextSessionDuration: int.tryParse(programData.nextSessionDuration ?? "0"),
    );

    // حساب الوقت المتبقي/المنقضي
    String timeDifference = LectureStateHelper.getTimeDifference(
      nextSession: programData.nextSession,
      nextSessionDuration: int.tryParse(programData.nextSessionDuration ?? "0"),
    );

    return LectureStats(
      state: lectureState,
      reJoin: lectureState == LectureStatesEnum.ongoing,
      onRejoinTap: () {
        // كود إعادة الدخول
      },
      nextLecture:
          programData.nextSession?.toString().substring(0, 10) ?? "غير محدد",
      duration: programData.nextSessionDuration != null
          ? "${programData.nextSessionDuration} دقيقة"
          : "غير محدد",
      timeDiff: timeDifference,
      titleText: const ["المحاضرة التالية", "مدة الجلسة", "حالة الجلسة"],
    );
  }

  Widget _buildLectureDataWithLoading(LectureCubit cubit, LectureState state) {
    var programData = cubit.showProgramDetailsEntity?.data;

    if (programData == null) {
      return _buildLoadingContainer(width: 150.w, height: 80.h);
    }

    return LectureData(
      host: programData.host ?? "غير محدد",
    );
  }

  Widget _buildLectureLinkWithLoading(LectureCubit cubit, LectureState state) {
    var programData = cubit.showProgramDetailsEntity?.data;

    if (programData == null) {
      return _buildLoadingContainer(width: 226.w, height: 80.h);
    }

    var lectureState = LectureStateHelper.getLectureState(
      nextSession: programData.nextSession,
      nextSessionDuration: int.tryParse(programData.nextSessionDuration ?? "0"),
    );

    return LectureLink(
      width: 226.w,
      state: lectureState,
      onLinkTap: lectureState == LectureStatesEnum.ongoing
          ? () {
              // TODO call join session before this. in Program Cubit
              final meetingUrl = programData.meetingUrl;
              if (meetingUrl != null && meetingUrl.isNotEmpty) {
                openUrl(meetingUrl);
              } else {
                delightfulToast(
                    message: "رابط الاجتماع غير متوفر", context: context);
              }
            }
          : () {
              delightfulToast(message: "لم تبدأ بعد", context: context);
              log("لم تبدأ بعد");
            },
    );
  }

  Widget _buildGoalsPercentWithLoading(LectureCubit cubit, LectureState state) {
    var programData = cubit.showProgramDetailsEntity?.data;

    if (programData == null) {
      return _buildLoadingContainer(height: 100.h);
    }

    return GoalsPercentContainer(
      onTap: () => Navigator.pushNamed(
        context,
        RoutePaths.goalsScreen,
      ),
      percent: (programData.goalsPercentage?.toString()) ?? "0",
    );
  }

  Widget _buildTabBarWithLoading(LectureCubit cubit, LectureState state) {
    var programData = cubit.showProgramDetailsEntity?.data;

    if (programData == null) {
      return _buildLoadingContainer(height: 50.h);
    }

    return LectureTabBar(
      cubit: cubit,
      onTabTap: (index) {
        // تحريك الـ PageView عند الضغط على تاب
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  Widget _buildPageViewWithLoading(LectureCubit cubit, LectureState state) {
    var programData = cubit.showProgramDetailsEntity?.data;

    if (programData == null) {
      return _buildLoadingContainer(height: 400.h);
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

  Widget _buildLoadingContainer({double? width, double? height}) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
