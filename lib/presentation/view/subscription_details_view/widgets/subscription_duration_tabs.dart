import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SubscriptionDurationTabs extends StatelessWidget {
  const SubscriptionDurationTabs({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SubscriptiondetailsCubit.get(context);

    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => SizedBox(
        height: 55.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomFilledTabBar(
              margin: EdgeInsets.zero,
              innerRadius: 12.r,
              outerRadius: 12.cr,
              controller: cubit.subscriptionDurationController,
              onTap: (v) {},
              tabs: List.generate(
                cubit.subscriptionDurationTabs.length,
                (index) {
                  bool isSelected =
                      cubit.subscriptionDurationController.index == index;
                  return Text(
                    cubit.subscriptionDurationTabs[index],
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: isSelected ? MainColors.background : MainColors.onPrimary,
                    ),
                  );
                },
              ),
            ),
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
    );
  }
}
