import 'dart:developer';

import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class ProgramPlanFilter extends StatefulWidget {
  final int programId;
  const ProgramPlanFilter({super.key, required this.programId});

  @override
  State<ProgramPlanFilter> createState() => _ProgramPlanFilterState();
}

class _ProgramPlanFilterState extends State<ProgramPlanFilter>
    with SingleTickerProviderStateMixin {
  late ProgramsubscriptionplanCubit cubit;
  @override
  void initState() {
    cubit = context.read<ProgramsubscriptionplanCubit>();
    cubit.initTabBarControllers(this);
    cubit.getPlanSubsriptionPeriod();
    cubit.fillProgramId(widget.programId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    var cubit = context.read<ProgramsubscriptionplanCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.packageDetails,
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.ph,
            Text(
              lang.choosePlanDescription,
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            ),
            19.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) => SizedBox(
                height: 55.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    cubit.getPlanSubscriptionLoader || cubit.controller == null
                        ? const Center(
                        child: CircularProgressIndicator.adaptive())
                        : CustomFilledTabBar(
                      margin: EdgeInsets.zero,
                      innerRadius: 12.r,
                      outerRadius: 12.cr,
                      controller: cubit.controller!,
                      onTap: (v) {
                        // Tab change is handled in controller listener
                      },
                      tabs: List.generate(
                        cubit.subscriptionTypeTabs.length,
                            (index) {
                          bool isSelected =
                              cubit.controller!.index == index;
                          return Text(
                            cubit.subscriptionTypeTabs[index],
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 12,
                              color: isSelected
                                  ? MainColors.background
                                  : MainColors.onPrimary,
                            ),
                          );
                        },
                      ),
                    ),
                    if (!cubit.getPlanSubscriptionLoader &&
                        cubit.controller != null)
                      Positioned(
                        left: 15.w,
                        top: 0.h,
                        child: OfferContainer(
                          height: 25.h,
                          width: 73.w,
                          offerText: lang.saveDiscount,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            18.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (cubit.getPlansWithDetailsLoader) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                if (cubit.getPlansWithDetailsEntity?.data?.isEmpty ?? true) {
                  return Center(
                    child: Text(lang.noAvailablePlans),
                  );
                }

                return SizedBox(
                  height: 475.h,
                  child: Column(
                    children: [
                      StartDateField(cubit: cubit),
                      16.ph,
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                          cubit.getPlansWithDetailsEntity?.data?.length ??
                              0,
                          separatorBuilder: (context, index) => 16.pw,
                          itemBuilder: (context, index) {
                            final plan =
                            cubit.getPlansWithDetailsEntity!.data![index];
                            bool isSelected = index == cubit.packageIndex;

                            return InkWell(
                              onTap: () {
                                log("DEBUG: User tapped plan at index $index");
                                log("DEBUG: Plan ID: ${plan.id}, Title: ${plan.title}");

                                cubit.changePackageIndex(index);

                                if (plan.id != null && plan.id! > 0) {
                                  cubit.fillPlanId(plan.id!);
                                } else {
                                  log("ERROR: Plan ID is null or invalid: ${plan.id}");
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                height: 423.h,
                                width: 295.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected
                                        ? MainColors.primary
                                        : MainColors.onPrimary,
                                  ),
                                  color: isSelected
                                      ? MainColors.surface
                                      : MainColors.background,
                                  borderRadius: 12.cr,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    16.ph,
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            plan.title ?? lang.planName,
                                            style: MainTextStyle.boldTextStyle(
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "${plan.price ?? 0} / ${lang.monthly}",
                                          style: MainTextStyle.boldTextStyle(
                                              fontSize: 14,
                                              color: MainColors.onSurfaceSecondary),
                                        ),
                                      ],
                                    ),
                                    8.ph,
                                    const CustomHorizontalDivider(),
                                    8.ph,
                                    Html(data: plan.description ?? ""),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      24.ph,
                      Container(
                        height: 53.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              lang.studentsCount,
                              textAlign: TextAlign.center,
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 14,
                                color: MainColors.onSurfaceSecondary,
                              ),
                            ),
                            const Spacer(),
                            BlocBuilder(
                              bloc: cubit,
                              builder: (context, state) => GestureDetector(
                                onTap: cubit.decrementCount,
                                child: Container(
                                  width: 32.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: cubit.studentCount > 1
                                        ? MainColors.surface
                                        : Colors.grey[100],
                                    borderRadius: 12.cr,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 20.r,
                                    color: cubit.studentCount > 1
                                        ? MainColors.primary
                                        : Colors.grey[400],
                                  ).center(),
                                ),
                              ),
                            ),

                            // Student count display
                            BlocBuilder(
                              bloc: cubit,
                              builder: (context, state) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Text(
                                  '${cubit.studentCount}',
                                  textAlign: TextAlign.center,
                                  style: MainTextStyle.boldTextStyle(
                                    fontSize: 18,
                                    color: MainColors.onPrimary,
                                  ),
                                ),
                              ),
                            ),

                            // Increase button
                            GestureDetector(
                              onTap: cubit.incrementCount,
                              child: Container(
                                width: 32.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: MainColors.surface,
                                  borderRadius: 12.cr,
                                ),
                                child: Icon(
                                  size: 20.r,
                                  Icons.add,
                                  color: MainColors.primary,
                                ).center(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            CustomElevatedButton(
              text: lang.subscribe,
              color: MainColors.primary,
              radius: 16.r,
              onPressed: () {
                Navigator.pushNamed(
                  arguments: {
                    "itemId": cubit.programId,
                    "cubit": cubit,
                  },
                  context,
                  RoutePaths.completePaymentProcessScreen,
                );
              },
            ),
            32.ph,
          ],
        ),
      ),
    );
  }
}

class StartDateField extends StatelessWidget {
  const StartDateField({
    super.key,
    required this.cubit,
  });

  final ProgramsubscriptionplanCubit cubit;

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return GestureDetector(
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
          locale: const Locale('ar', 'SA'),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );

        if (selectedDate != null) {
          cubit.updateStartDate(selectedDate);
        }
      },
      child: TitledFormFieldItem(
        titleText: lang.startDate,
        iconWidget: 0.ph,
        formfieldHintText: lang.startDateHint,
        controller: cubit.startDate,
        validator: customValidation,
        enabled: false,
      ),
    );
  }
}