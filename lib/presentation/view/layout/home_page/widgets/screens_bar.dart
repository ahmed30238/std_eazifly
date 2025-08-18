import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/widgets/dummy_data.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ScreensBar extends StatelessWidget {
  const ScreensBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (index) => InkWell(
          onTap: () {
            if (index != 3) {
              Navigator.pushNamed(
                arguments: index == 0
                    ? {
                        "cubit": context.read<MyProgramsCubit>(),
                        "sessionId": 1,
                      }
                    : false,
                context,
                paths[index],
              );
            } else {
              delightfulToast(
                  message: "سيتم تفعيل هذه الخدمة لاحقا", context: context);
            }
          },
          child: Column(
            children: [
              IconsContainer(
                width: 48.w,
                height: 48.h,
                iconWidget: SvgPicture.asset(
                  iconsList[index],
                  colorFilter: index != 0
                      ? ColorFilter.mode(
                          MainColors.primary,
                          BlendMode.srcIn,
                        )
                      : null,
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
