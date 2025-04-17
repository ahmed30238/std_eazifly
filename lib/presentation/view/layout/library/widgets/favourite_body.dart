import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/library_favourite_list_item.dart';
import 'package:flutter/material.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => LibraryFavouriteListItem(
        index: index,
      ),
      separatorBuilder: (context, index) => 12.ph,
      itemCount: 6,
      physics: const BouncingScrollPhysics(),
    );
  }
}