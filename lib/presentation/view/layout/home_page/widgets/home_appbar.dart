import 'package:eazifly_student/core/component/home_appbar.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      context,
      mainTitle: "",
      leadingCustomWidth: 120.w,
      customLeading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageContainer(
                  containerHeight: 20.h,
                  containerWidth: 20.w,
                  image: Assets.imagesPersona,
                  shape: BoxShape.circle,
                ),
                4.pw,
                Expanded(
                  child: Text(
                    "أحمد سلامة",
                    style: MainTextStyle.boldTextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            4.ph,
            Row(
              children: [
                SvgPicture.asset(
                  height: 20.h,
                  width: 20.w,
                  Assets.iconsCoin,
                ),
                Text(
                  "211",
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
      leadingText: '',
      customAction: [
        InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            RoutePaths.chatsViewPath,
          ),
          child: AppbarIconWidget(
            iconWidget: SvgPicture.asset(
              Assets.iconsChatsIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        4.pw,
        InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            RoutePaths.homeNotification,
          ),
          child: AppbarIconWidget(
            iconWidget: SvgPicture.asset(
              Assets.iconsNotificationIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        16.pw,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}