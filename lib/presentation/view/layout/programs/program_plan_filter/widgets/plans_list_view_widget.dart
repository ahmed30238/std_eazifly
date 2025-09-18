import 'dart:developer';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class PlansListViewWidget extends StatelessWidget {
  final ProgramSubscriptionPlanCubit cubit;

  const PlansListViewWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.viewList.length,
        separatorBuilder: (context, index) => 16.pw,
        itemBuilder: (context, index) {
          final plan = cubit.viewList[index];
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
                  color: isSelected ? MainColors.primary : MainColors.onPrimary,
                ),
                color: isSelected ? MainColors.surface : MainColors.background,
                borderRadius: 12.cr,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          plan.title ?? lang.planName,
                          style: MainTextStyle.boldTextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${plan.price ?? 0} / ${lang.monthly}",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 14,
                          color: MainColors.onSurfaceSecondary,
                        ),
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
    );
  }
}
