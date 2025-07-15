import 'dart:developer';

import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/library_menu_list_item.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/menus_loader.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class MenuListBody extends StatelessWidget {
  const MenuListBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LibraryCubit>();
    return BlocBuilder<LibraryCubit, LibraryState>(
      builder: (context, state) {
        if (state is AllLibraryListsErrorState) {
          return Text(state.errorMessage);
        }
        if (cubit.getAllLibraryListsLoader) {
          return const MenuListShimmer();
        }
        var menuList = cubit.allLibraryListsEntity?.data;
        if (menuList == null || menuList.isEmpty) {
          log("empty state");
          return Padding(
            padding: EdgeInsets.only(top: 48.h),
            child: const NoDataAnimatedImageWidget(
              message: "لا يوجد قوائم متاحة",
            ).center(),
          );
        }
        return ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemBuilder: (context, index) {
            var menuItem = menuList[index];

            return LibraryMenuListItem(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.audioPlayListView,
                  arguments: {
                    "cubit": cubit,
                    "listId": menuItem.id,
                  },
                );
              },
              index: index,
              image: menuItem.image ?? "",
              title: menuItem.title ?? "",
            );
          },
          separatorBuilder: (context, index) => 12.ph,
          itemCount: menuList.length,
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }
}
