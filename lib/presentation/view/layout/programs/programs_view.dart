import 'dart:developer';

import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/core/enums/plan_page_enum.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_state.dart';
import 'package:eazifly_student/presentation/controller/programs_controller/programs_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_controller/programs_state.dart';
import 'package:eazifly_student/presentation/view/layout/programs/widgets/p_item.dart';
import 'package:eazifly_student/presentation/view/layout/programs/widgets/program_item_shimmer.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramsView extends StatefulWidget {
  const ProgramsView({super.key});

  @override
  State<ProgramsView> createState() => _ProgramsViewState();
}

class _ProgramsViewState extends State<ProgramsView> {
  late ProgramsCubit cubit;
  @override
  void initState() {
    cubit = ProgramsCubit.get(context);
    cubit.getPrograms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
        child: BlocBuilder<HomeNotificationCubit, HomeNotificationState>(
          builder: (context, state) {
            bool allNotificationsRead = HomeNotificationCubit.get(context)
                .isRead
                .every((element) => element);
            return CustomAppBar(
              context,
              mainTitle: lang.thePrograms,
              leadingText: "",
              leadingCustomWidth: 10.w,
              customAction: [
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutePaths.chatsViewPath,
                  ),
                  child: AppbarIconWidget(
                    iconWidget: SvgPicture.asset(
                      Assets.iconsChatsIcon,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                4.pw,
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutePaths.homeNotification,
                  ),
                  child: CustomNotificationIcon(
                    showBadge: !allNotificationsRead,
                  ),
                ),
                16.pw,
              ],
            );
          },
        ),
      ),
      body: Column(
        children: [
          8.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextFormField(
              hintText: lang.search,
              prefixIconWidget: const PrefixSearchFormField(),
              suffixIconWidget: const SuffixMenuFormField(),
            ),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              // Show loader if state is loading
              if (cubit.getProgramsLoading) {
                return const ProgramsShimmerLoader();
              }

              // Show error message if state is error
              if (state is GetProgramsErrorState) {
                log("error state");
                return Center(
                  child: Text(state.errorMessage),
                );
              }

              // Default case (LoadedState or similar)
              var programsList = cubit.getProgramsEntity?.data;
              if (programsList == null || programsList.isEmpty) {
                log("empty state");
                return const NoDataAnimatedImageWidget(
                  message: "لا يوجد برامج متاحة",
                ).center();
              }

              return Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.only(bottom: 16.h, right: 16.w, left: 16.w),
                  itemBuilder: (context, index) => ProgramItem(
                    programEntity: programsList[index],
                    onTap: () {
                      var planPage = programsList[index].planPage;
                      log("this is planPage $planPage");
                      log("this is prog id ${programsList[index].id}");

                      Navigator.pushNamed(
                        arguments: programsList[index].id,
                        context,
                        getRouteForPlanPage(planPage ?? "") ?? "",
                      );
                    },
                  ),
                  separatorBuilder: (context, index) => 16.ph,
                  itemCount: programsList.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

String? getRouteForPlanPage(String planPageName) {
  log("${PlanPageExtension.fromString(planPageName)?.route}");
  return PlanPageExtension.fromString(planPageName)?.route;
}
