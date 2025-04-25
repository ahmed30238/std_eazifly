import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetDesign(
      height: MediaQuery.sizeOf(context).height,
      widget: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const ImageContainer(
            containerWidth: double.infinity,
            containerHeight: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 238.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: MainColors.white.withOpacity(.5),
              borderRadius: 8.cr,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.ph,
                Text(
                  "مجموعة قصص مختارة",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                  ),
                ),
                12.ph,
                Row(
                  children: [
                    Text(
                      "4:40",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                      ),
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
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                16.ph,
                CustomTextFormField(
                  hintText: "اكتب تعليق",
                  suffixIconWidget: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SvgPicture.asset(
                      MyImages.iconsSend2,
                    ),
                  ),
                ),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        MyImages.iconsOutlineHeart,
                      ),
                    ),
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(MyImages.iconsPlayNext)),
                    FloatingActionButton(
                      backgroundColor: MainColors.white,
                      shape: const CircleBorder(),
                      onPressed: () {},
                      child: SvgPicture.asset(
                        MyImages.iconsPause,
                      ),
                    ),
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(MyImages.iconsPlayPrevious)),
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(MyImages.iconsMusicFilter)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
