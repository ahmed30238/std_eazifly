import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class UnderReviewItem extends StatelessWidget {
  final String state;
  const UnderReviewItem({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            state: state,
          ),
          SizedBox(
            height: 74.h,
            child: ItemDetailsCard(
              titles: programTitles,
            ),
          )
        ],
      ),
    );
  }
}

class StackDesignState extends StatelessWidget {
  final String state;
  const StackDesignState({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          fit: BoxFit.cover,
          Assets.imagesPersona,
          height: 160.h,
          width: double.infinity,
        ),
           if (state != "accepted")
              Container(
                height: 160.h,
                color: MainColors.white.withOpacity(.2),
              ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              state == "accepted"
                  ? Assets.iconsEnsureRequest
                  : state == "rejected"
                      ? Assets.iconsRejectRequest
                      : Assets.iconsUnderReviewing,
            ),
         
            8.ph,
            Text(
              state == "accepted"
                  ? "تم تأكيد طلبك بنجاج"
                  : state == "pending"
                      ? "في مرحلة المراجعة "
                      : "تم رفض الطلب",
              style: MainTextStyle.boldTextStyle(
                fontSize: 15,
                color: state != "rejected" ? MainColors.white : MainColors.red,
              ),
            ),
            4.ph,
            Text(
              state == "accepted"
                  ? "أضغط للتوجهة الي إعداد البرنامج"
                  : state == "pending"
                      ? "سيتم إخطارك بإشعار عند تاكيد الطلب"
                      : "برجاء التواصل مع الإدارة لاعادة الاشتراك في البرنامج",
              style: MainTextStyle.boldTextStyle(
                fontSize: 15,
                color:
                    state == "rejected" ? MainColors.black : MainColors.white,
              ),
            ),
            8.ph,
            if (state == "accepted")
              CustomLowSizeButton(
                text: "توجهه",
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.groupPackageManagement);
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
