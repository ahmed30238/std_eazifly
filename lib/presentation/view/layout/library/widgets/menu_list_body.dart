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
        if (!cubit.getAllLibraryListsLoader) {
          var menuList = cubit.allLibraryListsEntity?.data;
          return ListView.separated(
            itemBuilder: (context, index) {
              var menuItem = menuList?[index];
              return LibraryMenuListItem(
                index: index,
                image: menuItem?.image ?? "",
                title: menuItem?.title ?? "",
              );
            },
            separatorBuilder: (context, index) => 12.ph,
            itemCount: menuList?.length ?? 0,
            physics: const BouncingScrollPhysics(),
          );
        }
        return const MenuListShimmer();
      },
    );
  }
}
