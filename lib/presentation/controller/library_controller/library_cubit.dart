

import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/audios_body.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/favourite_body.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/menu_list_body.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/visuals_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryInitial());
  static LibraryCubit get(context) => BlocProvider.of(context);
  initTabController(TickerProvider vsync) {
    tabController = TabController(length: 4, vsync: vsync)
      ..addListener(() {
        if (tabController.indexIsChanging) {
          tabController.animateTo(tabController.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
        emit(InitTabControllerState());
      });
  }

  late TabController tabController;

  List<String> tabTexts = [
    'صوتيات',
    'مرئيات',
    'القوائم',
    'المفضلة',
  ];
  List<Widget> libraryBodies = [
    const AudiosBody(),
    const VisualsBody(),
    const MenuListBody(),
    const FavouriteBody(),
  ];
}
