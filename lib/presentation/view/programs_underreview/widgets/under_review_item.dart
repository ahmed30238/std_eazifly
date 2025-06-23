import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class UnderReviewItem extends StatelessWidget {
  final String state;
  final String image;
  const UnderReviewItem({
    super.key,
    required this.state,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: state == "success"
          ? () {
              Navigator.pushNamed(
                context,
                RoutePaths.groupPackageManagement,
              );
            }
          : state == "danger"
              ? () {
                  customAdaptiveDialog(
                    context,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 174.h,
                      width: 343.w,
                      decoration: BoxDecoration(
                        color: MainColors.white,
                        borderRadius: 20.cr,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          24.ph,
                          Text(
                            "نأسف لقد تم رفض طلبك",
                            style: MainTextStyle.boldTextStyle(fontSize: 16),
                          ),
                          8.ph,
                          Text(
                            "تم رفض طلب التسجيل الخاص بك بسبب :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص. ",
                            style: MainTextStyle.mediumTextStyle(
                              fontSize: 12,
                              color: MainColors.grayTextColors,
                            ),
                          ),
                          24.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomLowSizeButton(
                                textColor: MainColors.white,
                                height: 34.h,
                                text: "إعادة المحاولة",
                                btnColor: MainColors.blueTextColor,
                                borderRadius: 16.cr,
                                width: 128.5.w,
                                fontSize: 12,
                                onTap: () {
                                  Navigator.pushNamed(
                                    arguments: 0, //TODO itemId,
                                    context,
                                    RoutePaths.completePaymentProcessScreen,
                                  );
                                },
                              ),
                              16.pw,
                              CustomLowSizeButton(
                                text: "التواصل مع الإدارة",
                                textColor: MainColors.white,
                                height: 34.h,
                                btnColor: MainColors.blueTextColor,
                                fontSize: 12,
                                borderRadius: 16.cr,
                                width: 128.5.w,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutePaths.dmViewPath,
                                    arguments: {
                                      "cubit": ChatsCubit.get(context),
                                      "isReport": true,
                                      "problemState": "جاري"
                                    },
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              : null,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 238.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: MainColors.lightGray,
          ),
          borderRadius: 8.cr,
        ),
        child: Column(
          children: [
            StackDesignState(
              image: image,
              state: state,
            ),
            SizedBox(
              height: 74.h,
              child: ItemDetailsCard(
                titles: programTitles,
                values: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StackDesignState extends StatelessWidget {
  final String state;
  final String image;
  const StackDesignState({
    super.key,
    required this.state,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AvatarImage(
          imageUrl: image,
          height: 160.h,
          width: double.infinity,
        ),
        if (state != "success")
          Container(
            height: 160.h,
            color: MainColors.white.withOpacity(.2),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              state == "success"
                  ? Assets.iconsEnsureRequest
                  : state == "danger"
                      ? Assets.iconsRejectRequest
                      : Assets.iconsUnderReviewing,
            ),
            8.ph,
            Text(
              state == "success"
                  ? "تم تأكيد طلبك بنجاج"
                  : state == "primary"
                      ? "في مرحلة المراجعة "
                      : "تم رفض الطلب",
              style: MainTextStyle.boldTextStyle(
                fontSize: 15,
                color: state != "danger" ? MainColors.white : MainColors.red,
              ),
            ),
            4.ph,
            Text(
              state == "success"
                  ? "أضغط للتوجهة الي إعداد البرنامج"
                  : state == "primary"
                      ? "سيتم إخطارك بإشعار عند تاكيد الطلب"
                      : "برجاء التواصل مع الإدارة لاعادة الاشتراك في البرنامج",
              style: MainTextStyle.boldTextStyle(
                fontSize: 15,
                color: state == "success" ? MainColors.black : MainColors.white,
              ),
            ),
            8.ph,
            if (state == "success")
              CustomLowSizeButton(
                text: "توجهه",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.groupPackageManagement,
                  );
                },
                textColor: MainColors.white,
                btnColor: MainColors.blueTextColor,
                width: 99.w,
                height: 29.h,
              ),
          ],
        ),
      ],
    );
  }
}
