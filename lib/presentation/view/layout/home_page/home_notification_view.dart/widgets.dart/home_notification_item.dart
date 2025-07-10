import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class HomeNotificationItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String message;
  final String createdAt;
  final bool isRead;
  final int index;

  const HomeNotificationItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.isRead,
    required this.message,
    required this.createdAt,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          if (!isRead)
            Container(
              height: 84.h,
              color: MainColors.lightGray,
              width: double.infinity,
            ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 84.h,
                child: SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconsContainer(
                        width: 40.w,
                        height: 40.h,
                        iconWidget: SvgPicture.asset(
                          Assets.iconsLiveBroadcasting,
                        ),
                      ),
                      8.pw,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 295.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    title,
                                    style: MainTextStyle.boldTextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    createdAt,
                                    style: MainTextStyle.mediumTextStyle(
                                      fontSize: 12,
                                      color: MainColors.blueTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            4.ph,
                            Text(
                              // overflow: TextOverflow.ellipsis,
                              message,
                              style: MainTextStyle.mediumTextStyle(
                                fontSize: 12,
                                color: MainColors.grayTextColors,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const CustomHorizontalDivider(
                thickness: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
