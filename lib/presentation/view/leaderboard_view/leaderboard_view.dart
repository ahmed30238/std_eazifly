import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/notifications_view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeaderBoardView extends StatelessWidget {
  const LeaderBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.goals,
        leadingText: lang.back,
        isCenterTitle: true,
        customAction: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(MyImages.iconsVerticalDots),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SvgPicture.asset(MyImages.iconsGoldMedal),
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                MyImages.iconsGoldBoard,
              ),
              Image.asset(
                MyImages.imagesPngImage,
                height: 100.h,
                width: 100.w,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 564.h,
            width: double.infinity,
            color: MainColors.veryLightGrayFormField,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                12.ph,
                //! text + icon
                SizedBox(
                  height: 36.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lang.competitorsMenu,
                        style: MainTextStyle.boldTextStyle(fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                          showModalSheet(
                            isFixedSize: true,
                            minHeight: 146.h,
                            maxHeight: 146.h,
                            context,
                            widget: CustomBottomSheetDesign(
                              widget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      24.ph,
                                      SizedBox(
                                        height: 45.h,
                                        child: Text(
                                          lang.programLeader,
                                          style: MainTextStyle.boldTextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45.h,
                                        child: Text(
                                          lang.myStudent,
                                          style: MainTextStyle.boldTextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          MyImages.iconsFrame,
                        ),
                      ),
                    ],
                  ),
                ),
                8.ph,
                ListView.separated(
                  padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => PlayerItem(
                    index: index + 1,
                  ),
                  separatorBuilder: (context, index) => 8.ph,
                  itemCount: 8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PlayerItem extends StatelessWidget {
  final int index;
  const PlayerItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 64.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: MainColors.white,
        borderRadius: 12.cr,
      ),
      child: Row(
        children: [
          Text(
            "$index",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          8.pw,
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                MyImages.iconsStarImage,
              ),
              Image.asset(
                MyImages.imagesPngImage,
                height: 30.h,
                width: 30.w,
              ),
            ],
          ),
          4.pw,
          Text(
            "Name",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          const Spacer(),
          SvgPicture.asset(
            MyImages.iconsCoin,
          ),
          Text(
            "211",
            style: MainTextStyle.boldTextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
