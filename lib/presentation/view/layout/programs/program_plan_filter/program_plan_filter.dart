import 'dart:developer';

import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class ProgramPlanFilter extends StatefulWidget {
  final int programId;
  const ProgramPlanFilter({super.key, required this.programId});

  @override
  State<ProgramPlanFilter> createState() =>
      _AddToLibraryPackageDetailsViewState();
}

class _AddToLibraryPackageDetailsViewState extends State<ProgramPlanFilter>
    with SingleTickerProviderStateMixin {
  late ProgramsubscriptionplanCubit cubit;
  @override
  void initState() {
    cubit = context.read<ProgramsubscriptionplanCubit>();
    cubit.initTabBarControllers(this);
    cubit.getPlanSubsriptionPeriod(); // This will also load library plans
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
        mainTitle: "تفاصيل الباقات",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.ph,
            Text(
              "اختر بين مجموعة من الباقات و إستمتع بالمزايا الحصرية",
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
                                        ? MainColors.white
                                        : MainColors.black,
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
                          offerText: "وفر 20%",
                        ),
                      ),
                  ],
                ),
              ),
            ),
            18.ph,
            Expanded(
              child: BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (cubit.getPlansWithDetailsLoader) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  if (cubit.getPlansWithDetailsEntity?.data?.isEmpty ?? true) {
                    return const Center(
                      child: Text("لا توجد باقات متاحة"),
                    );
                  }

                  return SizedBox(
                    height: 423.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          cubit.getPlansWithDetailsEntity?.data?.length ?? 0,
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
                                    ? MainColors.blueTextColor
                                    : MainColors.black,
                              ),
                              color: isSelected
                                  ? MainColors.lightblue
                                  : MainColors.white,
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
                                        plan.title ?? "إسم الباقة",
                                        style: MainTextStyle.boldTextStyle(
                                          fontSize: 14,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "${plan.price ?? 0} / شهريا",
                                      style: MainTextStyle.boldTextStyle(
                                          fontSize: 14,
                                          color: MainColors.grayTextColors),
                                    ),
                                  ],
                                ),
                                8.ph,
                                const CustomHorizontalDivider(),
                                8.ph,
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Html(data: plan.description ?? ""),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            CustomElevatedButton(
              text: "إشتراك",
              color: MainColors.blueTextColor,
              radius: 16.r,
              onPressed: () {
                // // TODO add programId as arguments
                // var arguments = settings.arguments as Map<String, dynamic>?;
                // var cubit = arguments?["cubit"] as ProgramsubscriptionplanCubit;
                // int itemId = arguments?["itemId"] as int;
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
