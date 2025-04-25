import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.index],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: MainColors.veryLightGrayFormField,
            unselectedItemColor: MainColors.grayTextColors,
            currentIndex: cubit.index,
            type: BottomNavigationBarType.fixed,
            onTap: cubit.changeIndex,
            selectedLabelStyle: MainTextStyle.mediumTextStyle(
              fontSize: 12,
            ),
            selectedItemColor: MainColors.blueTextColor,
            unselectedLabelStyle: MainTextStyle.mediumTextStyle(
              fontSize: 12,
            ),
            items: List.generate(
              5,
              (index) {
                bool isSelected = cubit.index == index;
                return BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    cubit
                        .bottomNavigationBarItemMethod(context,
                            isActive: isSelected)[index]
                        .icon,
                    colorFilter: ColorFilter.mode(
                      isSelected ? MainColors.blueTextColor : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: cubit
                      .bottomNavigationBarItemMethod(context,
                          isActive: isSelected)[index]
                      .label,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
