import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/controller/copoun_history/copounhistory_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/widgets/code_details.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/widgets/point_balance_container.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/widgets/points_dialog_design.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CopounsAndDiscountsView extends StatefulWidget {
  const CopounsAndDiscountsView({super.key});

  @override
  State<CopounsAndDiscountsView> createState() =>
      _CopounsAndDiscountsViewState();
}

class _CopounsAndDiscountsViewState extends State<CopounsAndDiscountsView> {
  late CopounHistoryCubit cubit;

  @override
  void initState() {
    cubit = context.read<CopounHistoryCubit>();
    super.initState();
    cubit.getCopounHistory();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.couponsAndRewards,
        leadingText: lang.back,
        isCenterTitle: true,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.explainPointsSystemView,
                );
              },
              child: TextedContainer(
                text: "شرح",
                height: 29.h,
                width: 64.w,
                radius: 12.r,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          24.ph,
          AvatarImage(
            height: 100.h,
            width: 100.w,
            imageUrl: loginData?.image,
            shape: BoxShape.circle,
          ),
          8.ph,
          Text(
            "${loginData?.firstName} ${loginData?.lastName}",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          4.ph,
          Text(
            "${loginData?.bonus ?? "0"} نقطة",
            style: MainTextStyle.boldTextStyle(
                fontSize: 14, color: MainColors.primary),
          ),
          24.ph,
          CodeDetails(
            code: loginData?.userCoupon ?? "",
          ),
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      shareApp(context: context);
                    },
                    child: Container(
                      height: 98.h,
                      decoration: BoxDecoration(
                        color: MainColors.inputFill,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.iconsShare,
                            colorFilter: const ColorFilter.mode(
                              MainColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          8.ph,
                          Text(
                            lang.inviteFriends,
                            style: MainTextStyle.boldTextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                16.pw,
                Expanded(
                  child: InkWell(
                    onTap: () => customAdaptiveDialog(
                      context,
                      child: PointsDialogDesign(
                        points: loginData?.bonus ?? "",
                      ),
                    ),
                    child: Container(
                      height: 98.h,
                      decoration: BoxDecoration(
                        color: MainColors.inputFill,
                        borderRadius: 10.cr,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.iconsTicketExpired,
                            colorFilter: const ColorFilter.mode(
                              MainColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          8.ph,
                          Text(
                            lang.redeemPoints,
                            style: MainTextStyle.boldTextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.ph,
          PointsBalanceContainer(
            cubit: cubit,
          )
        ],
      ),
    );
  }
}
