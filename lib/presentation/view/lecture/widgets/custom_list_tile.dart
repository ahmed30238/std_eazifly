import 'package:eazifly_student/core/component/icons_container.dart';

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
  final double? iconHeight;
  final double? iconWidth;

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
    this.iconHeight = 40,
    this.iconWidth = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          IconsContainer(
            height: iconHeight ?? 40.h,
            width: iconWidth ?? 40.w,
            iconWidget: SvgPicture.asset(
              height: iconHeight ?? 40.h,
              fit: BoxFit.scaleDown,
              width: iconWidth ?? 40.w,
              icon ?? "",
            ),
            containerColor: iconContainerColor ?? MainColors.lightblue,
          ),
          16.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 161.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        title ?? "",
                        style: MainTextStyle.boldTextStyle(fontSize: 14),
                      ),
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
          ),
          // const Spacer(),
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
