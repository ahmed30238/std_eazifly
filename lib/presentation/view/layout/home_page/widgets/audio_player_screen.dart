import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetDesign(
      height: MediaQuery.sizeOf(context).height,
      widget: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const AvatarImage(width: double.infinity, height: double.infinity),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 238.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: MainColors.background.withOpacity(.5),
              borderRadius: 8.cr,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.ph,
                Text(
                  "مجموعة قصص مختارة",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
                12.ph,
                Row(
                  children: [
                    Text(
                      "4:40",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
                    ),
                    8.pw,
                    Expanded(
                      child: CustomLinearPercentIndicator(
                        width: 250.w,
                        alignment: MainAxisAlignment.start,
                        percent: .45,
                      ),
                    ),
                    8.pw,
                    Text(
                      "-1:40",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
                    ),
                  ],
                ),
                16.ph,
                CustomTextFormField(
                  hintText: "اكتب تعليق",
                  suffixIconWidget: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SvgPicture.asset(Assets.iconsSend2),
                  ),
                ),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.iconsOutlineHeart),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.iconsPlayNext),
                    ),
                    FloatingActionButton(
                      backgroundColor: MainColors.background,
                      shape: const CircleBorder(),
                      onPressed: () {},
                      child: SvgPicture.asset(Assets.iconsPause),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.iconsPlayPrevious),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.iconsMusicFilter),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
