import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/home_appbar.dart';
import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/widgets/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(     context,
        mainTitle: "Title",
        leadingText: "Text",
        isCenterTitle: true,
        customAction: [
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              RoutePaths.chatsViewPath,
            ),
            child: AppbarIconWidget(
              iconWidget: SvgPicture.asset(
                MyImages.iconsChatsIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, RoutePaths.homeNotification),
            child: AppbarIconWidget(
              iconWidget: SvgPicture.asset(
                MyImages.iconsBox,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => InkWell(
                onTap: () => Navigator.pushNamed(
                  arguments: false,
                  context,
                  paths[index],
                ),
                child: Column(
                  children: [
                    IconsContainer(
                      width: 48.w,
                      height: 48.h,
                      iconWidget: SvgPicture.asset(
                        iconsList[index],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    8.ph,
                    Text(
                      textList(context)[index],
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Center(
            child: Text('Welcome to the Home Page!'),
          ),
        ],
      ),
    );
  }
}

List<String> paths = [
  RoutePaths.lectureView,
  RoutePaths.assignments,
  RoutePaths.quizzes,
  RoutePaths.meetings,
];
