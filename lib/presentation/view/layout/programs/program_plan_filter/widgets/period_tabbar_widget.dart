import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PeriodTapBarWidget extends StatelessWidget {
  final ProgramSubscriptionPlanCubit cubit;

  const PeriodTapBarWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return SizedBox(
          height: 55.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              cubit.getPlansWithDetailsLoader ||
                      cubit.controller == null ||
                      cubit.staticMadeTabs.isEmpty
                  ? const CircularProgressIndicator.adaptive()
                  : CustomFilledTabBar(
                      margin: EdgeInsets.zero,
                      innerRadius: 12.r,
                      outerRadius: 12.cr,
                      controller: cubit.controller!,
                      onTap: (v) {
                        // Tab change is handled in controller listener
                      },
                      tabs: List.generate(cubit.staticMadeTabs.length, (index) {
                        bool isSelected = cubit.controller!.index == index;
                        final key = cubit.staticMadeTabs.keys.elementAt(index);
                        final subscriptionPlan =
                            cubit.staticMadeTabs[key]?.first.subscriptionPlan ??
                            "";

                        return Text(
                          subscriptionPlan,
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? MainColors.background
                                : MainColors.onPrimary,
                          ),
                        );
                      }),
                    ),
              // وفر 20%
              // if (!cubit.getPlanSubscriptionLoader &&
              //     cubit.controller != null)
              //   Positioned(
              //     left: 15.w,
              //     top: 0.h,
              //     child: OfferContainer(
              //       height: 25.h,
              //       width: 73.w,
              //       offerText: lang.saveDiscount,
              //     ),
              //   ),
            ],
          ),
        );
      },
    );
  }
}
