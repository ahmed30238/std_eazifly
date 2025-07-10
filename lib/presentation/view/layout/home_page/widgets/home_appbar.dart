import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final DataModel loginData;
  final bool showBadge;

  const HomeAppbar({
    super.key,
    required this.loginData,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      context,
      mainTitle: "",
      leadingCustomWidth: 200.w,
      onLeadinTap: () => Navigator.pushNamed(
        context,
        RoutePaths.copounsAndDiscountsViewPath,
      ),
      customLeading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AvatarImage(
                  height: 20.h,
                  width: 20.w,
                  imageUrl: loginData.image,
                  shape: BoxShape.circle,
                ),
                4.pw,
                Expanded(
                  child: Text(
                    "${loginData.firstName} ${loginData.lastName}",
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
                  loginData.bonus ?? "",
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
          child: CustomNotificationIcon(
            showBadge: showBadge,
          ),
        ),
        16.pw,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
