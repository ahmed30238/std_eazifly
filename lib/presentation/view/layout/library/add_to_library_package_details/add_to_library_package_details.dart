import 'dart:developer';

import 'package:eazifly_student/presentation/controller/add_to_library_package_details_controller/addtolibrarypackagedetails_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class AddToLibraryPackageDetailsView extends StatefulWidget {
  const AddToLibraryPackageDetailsView({super.key});

  @override
  State<AddToLibraryPackageDetailsView> createState() =>
      _AddToLibraryPackageDetailsViewState();
}

class _AddToLibraryPackageDetailsViewState
    extends State<AddToLibraryPackageDetailsView>
    with SingleTickerProviderStateMixin {
  late AddtolibrarypackagedetailsCubit cubit;

  @override
  void initState() {
    cubit = context.read<AddtolibrarypackagedetailsCubit>();
    cubit.initTabBarControllers(this);
    cubit.getPlanSubsriptionPeriod(); // This will also load library plans
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    var cubit = context.read<AddtolibrarypackagedetailsCubit>();
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
                  if (cubit.getLibraryPlansLoader) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  if (cubit.getLibraryPlansEntity?.data?.isEmpty ?? true) {
                    return const Center(
                      child: Text("لا توجد باقات متاحة"),
                    );
                  }

                  return SizedBox(
                    height: 423.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.getLibraryPlansEntity?.data?.length ?? 0,
                      separatorBuilder: (context, index) => 16.pw,
                      itemBuilder: (context, index) {
                        final plan = cubit.getLibraryPlansEntity!.data![index];
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
                // TODO add programId as arguments
                Navigator.pushNamed(
                  arguments: {"itemId": 1, "cubit": cubit},
                  context,
                  RoutePaths.completeLibraryPaymentProcessScreen,
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
