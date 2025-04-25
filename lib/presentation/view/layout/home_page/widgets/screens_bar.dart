

import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/widgets/dummy_data.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ScreensBar extends StatelessWidget {
  const ScreensBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}