import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/component/texted_container.dart';

import '../../subscription_details_view/widgets/imports.dart';

class CustomListTile extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? secondTitle;
  final String? secondSubTitle;
  final String? subTitle;
  final String? trailingText;
  final Color? iconContainerColor;
  final Widget? trailing;
  final bool isDoubleText;
  final bool isDoubleSubTitle;
  final bool isFavourite;

  const CustomListTile({
    super.key,
    this.icon,
    this.subTitle,
    this.iconContainerColor,
    this.secondSubTitle,
    this.title,
    this.secondTitle,
    this.trailing,
    this.trailingText,
    this.isFavourite = false,
    this.isDoubleText = false,
    this.isDoubleSubTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          IconsContainer(
            height: 40.h,
            width: 40.w,
            iconWidget: SvgPicture.asset(
              icon ?? "",
            ),
            containerColor: iconContainerColor ?? MainColors.lightblue,
          ),
          16.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title ?? "",
                    style: MainTextStyle.boldTextStyle(fontSize: 14),
                  ),
                  8.pw,
                  if (isDoubleText)
                    Text(
                      secondTitle ?? "",
                      style: MainTextStyle.boldTextStyle(fontSize: 14),
                    ),
                  if (isFavourite)
                    TextedContainer(
                      text: "مفضل",
                      width: 46.w,
                    )
                ],
              ),
              4.ph,
              Row(
                children: [
                  Text(
                    subTitle ?? "",
                    style: MainTextStyle.mediumTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  8.pw,
                  if (isDoubleSubTitle)
                    Text(
                      secondSubTitle ?? "",
                      style: MainTextStyle.mediumTextStyle(
                        fontSize: 12,
                        color: MainColors.grayTextColors,
                      ),
                    ),
                ],
              ),
            ],
          ),
          const Spacer(),
          trailing ??
              Text(
                trailingText ?? "",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              )
        ],
      ),
    );
  }
}
