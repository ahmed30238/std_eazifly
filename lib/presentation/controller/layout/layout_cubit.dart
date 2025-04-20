

import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_state.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/layout/library/library.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/my_programs.dart';
import 'package:eazifly_student/presentation/view/layout/programs/programs_view.dart';
import 'package:eazifly_student/presentation/view/my_account/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int index = 0;
  void changeIndex(int inx) {
    index = inx;
    emit(ChangeIndexState());
  }

  List<Widget> screens = [
    const HomePage(),
    const ProgramsView(),
    const MyProgramsView(),
    BlocProvider(
      create: (context) => LibraryCubit(),
      child: const LibraryView(),
    ),
    const MyAccountView()
  ];

  List<BottomNavBarItemModel> bottomNavigationBarItemMethod(
      BuildContext context) {
    var lang = context.loc!;
    List<BottomNavBarItemModel> bottomNavigationBarItem = [
      BottomNavBarItemModel(
        icon: MyImages.iconsUnfilledHome,
        label: lang.main,
      ),
      BottomNavBarItemModel(
        icon: MyImages.iconsBriefcase,
        label: lang.thePrograms,
      ),
      BottomNavBarItemModel(
        icon: MyImages.iconsBox,
        label: lang.myPrograms,
      ),
      BottomNavBarItemModel(
        icon: MyImages.iconsVoiceCricle,
        label: lang.library,
      ),
      BottomNavBarItemModel(
        icon: MyImages.iconsProfile,
        label: lang.myAccount,
      ),
    ];
    return bottomNavigationBarItem;
  }
}

class BottomNavBarItemModel {
  final String icon;
  final String label;

  BottomNavBarItemModel({
    required this.icon,
    required this.label,
  });
}
