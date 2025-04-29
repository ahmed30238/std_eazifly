import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/widgets/audio_player_screen.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PlayingProgramContainer extends StatelessWidget {
  const PlayingProgramContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalSheet(
        isFixedSize: true,
        context,
        widget: const AudioPlayerScreen(),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 100.h,
        width: 359.w,
        decoration: BoxDecoration(
          color: MainColors.white,
          border: Border.all(color: MainColors.lightGray, width: 1.w),
          borderRadius: 16.cr,
        ),
        child: Column(
          children: [
            12.ph,
            Row(
              children: [
                ImageContainer(
                  containerHeight: 40.h,
                  containerWidth: 40.w,
                  radius: 8.r,
                ),
                8.pw,
                Text(
                  "مجموعة قصص مختارة",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  Assets.iconsPause,
                ),
                8.pw,
              ],
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
          ],
        ),
      ),
    );
  }
}
