import 'dart:developer';

import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/presentation/controller/home_program_details_controller/programdetails_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_program_details_controller/programdetails_state.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/widgets/program_details_view_loader.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../core/enums/plan_page_enum.dart';

class ProgramDetailsView extends StatefulWidget {
  final int programId;

  const ProgramDetailsView({super.key, required this.programId});

  @override
  State<ProgramDetailsView> createState() => _ProgramDetailsViewState();
}

class _ProgramDetailsViewState extends State<ProgramDetailsView>
    with SingleTickerProviderStateMixin {
  late ProgramDetailsCubit cubit;

  @override
  void initState() {
    cubit = ProgramDetailsCubit.get(context);
    cubit.initController(this);
    cubit.getProgramDetails(programId: widget.programId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.programDetails,
        leadingText: lang.programs,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          BlocBuilder<ProgramDetailsCubit, ProgramdetailsState>(
            builder: (context, state) {
              var program = cubit.getProgramDetailsEntity?.data;

              if (cubit.getProgramDetailsLoading) {
                return const ProgramDetailsViewLoader();
              }

              // التحقق من وجود البيانات
              if (program == null) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 80.r,
                          color: MainColors.onSurfaceSecondary,
                        ),
                        16.ph,
                        Text(
                          lang.dataLoadError,
                          style: MainTextStyle.mediumTextStyle(
                            fontSize: 16,
                            color: MainColors.onSurfaceSecondary,
                          ),
                        ),
                        8.ph,
                        Text(
                          "تحقق من الاتصال بالإنترنت وحاول مرة أخرى",
                          style: MainTextStyle.regularTextStyle(
                            fontSize: 14,
                            color: MainColors.onSurfaceSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        20.ph,
                        CustomElevatedButton(
                          text: "إعادة المحاولة",
                          textStyle: MainTextStyle.mediumTextStyle(
                            fontSize: 14,
                            color: MainColors.background,
                          ),
                          color: MainColors.primary,
                          width: 120.w,
                          height: 36.h,
                          radius: 8.r,
                          onPressed: () {
                            cubit.getProgramDetails(
                              programId: widget.programId,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.ph,
                        AvatarImage(
                          height: 188.h,
                          width: double.infinity,
                          imageUrl: program.image ?? "",
                          radius: 16.r,
                        ),
                        16.ph,
                        SizedBox(
                          height: 29.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  program.title ?? "",
                                  style: MainTextStyle.boldTextStyle(
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        8.ph,
                        Html(
                          data: program.description ?? "",
                          // style: htmlStyle,
                        ),
                        16.ph,
                        CustomTabBar(
                          controller: cubit.controller,
                          tabs: List.generate(cubit.tabs.length, (index) {
                            bool isSelected = cubit.controller.index == index;
                            return Text(
                              cubit.tabs[index],
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? MainColors.primary
                                    : MainColors.onSurfaceSecondary,
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          height: cubit.controller.index == 0
                              ? (40 * 4) + 16
                              : 348.h,
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: cubit.controller,
                            children: cubit.screens(),
                          ),
                        ),
                      ].itemPadding(rightPadding: 16.w, leftPadding: 16.w),
                    ),
                  ],
                ),
              );
            },
          ),
          8.ph,
          // إخفاء الزر أثناء التحميل أو في حالة عدم وجود بيانات
          BlocBuilder<ProgramDetailsCubit, ProgramdetailsState>(
            builder: (context, state) {
              if (cubit.getProgramDetailsLoading ||
                  cubit.getProgramDetailsEntity?.data == null) {
                return const SizedBox.shrink();
              }

              return CustomElevatedButton(
                text: lang.subscribeNowButton,
                color: MainColors.primary,
                radius: 16.r,
                width: 343.w,
                onPressed: () {
                  final String planPage =
                      cubit.getProgramDetailsEntity?.data?.planPage ?? "";
                  Navigator.pushNamed(
                    arguments: planPage == PlanPageEnum.filterPlan.name
                        ? {
                            "programId": widget.programId,
                            "programTitle":
                                cubit.getProgramDetailsEntity?.data?.title ??
                                "",
                            "programDescription":
                                cubit
                                    .getProgramDetailsEntity
                                    ?.data
                                    ?.description ??
                                "",
                            "programImage":
                                cubit.getProgramDetailsEntity?.data?.image ??
                                "",
                          }
                        : widget.programId,
                    context,
                    getRouteForPlanPage(planPage) ?? "",
                  );
                  // return Navigator.pushNamed(
                  //   arguments: {

                  //   },
                  //   context,
                  //   RoutePaths.programSubscriptionPlan,
                  // );
                },
              );
            },
          ),
          32.ph,
        ],
      ),
    );
  }
}

String? getRouteForPlanPage(String planPageName) {
  log("${PlanPageExtension.fromString(planPageName)?.route}");
  return PlanPageExtension.fromString(planPageName)?.route;
}
