import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
class PossibleFavItemsContainer extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onAddTap;
  final bool isAlreadyAdded;
  const PossibleFavItemsContainer({
    super.key,
    required this.title,
    required this.onAddTap,
    required this.image,
    required this.isAlreadyAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AvatarImage(
              height: 60.h,
              width: 60.w,
              imageUrl: image,
              shape: BoxShape.rectangle,
            ),
            SvgPicture.asset(
              colorFilter:  ColorFilter.mode(
                MainColors.white,
                BlendMode.srcIn,
              ),
              Assets.iconsPlay,
            ),
          ],
        ),
        8.pw,
        Text(
          title,
          style: MainTextStyle.boldTextStyle(fontSize: 14),
        ),
        const Spacer(),
        BlocBuilder<LibraryCubit, LibraryState>(
          builder: (context, state) {
            return AppbarIconWidget(
              backgroundColor: MainColors.lightblue,
              iconColor: MainColors.blueTextColor,
              iconWidget: isAlreadyAdded
                  ?  Icon(
                      Icons.remove,
                      color: MainColors.blueTextColor,
                    )
                  : null,
              onTap: onAddTap,
            );
          },
        ),
      ],
    );
  }
}