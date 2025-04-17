import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/library_menu_list_item.dart';
import 'package:flutter/material.dart';

class MenuListBody extends StatelessWidget {
  const MenuListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => LibraryMenuListItem(
        index: index,
      ),
      separatorBuilder: (context, index) => 12.ph,
      itemCount: 6,
      physics: const BouncingScrollPhysics(),
    );
  }
}