import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/home_appbar.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
            onTap: () => Navigator.pushNamed(context, RoutePaths.homeNotification),
            child: AppbarIconWidget(
              iconWidget: SvgPicture.asset(
                MyImages.iconsBox,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: const Text('Welcome to the Home Page!'),
      ),
    );
  }
}
