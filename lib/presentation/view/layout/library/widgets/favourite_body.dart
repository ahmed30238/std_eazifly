import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/library_fav_list_item_shimmer.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/library_favourite_list_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LibraryCubit>();
    var lang = context.loc!;
    return BlocBuilder<LibraryCubit, LibraryState>(
      builder: (context, state) {
        if (cubit.getFavouriteListLoader) {
          return const FavItemShimmerList();
        }

        if (state is FavouriteListErrorState) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }

        // Default/loaded state
        var favouriteList = cubit.allFavourites;
        if (favouriteList.isEmpty) {
          return Column(
            children: [
              50.ph,
              NoDataAnimatedImageWidget(message: lang.noFavs).center(),
            ],
          );
        }
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          itemBuilder: (context, index) {
            var item = favouriteList[index];
            return LibraryFavouriteListItem(
              onTap: () => Navigator.pushNamed(
                context,
                arguments: {
                  "playlistName": item.title ?? "",
                  "playlistImage": item.image ?? "",
                  "playlistId": item.id,
                  "cubit": cubit,
                },
                RoutePaths.favPlaylistDetails,
              ),
              index: index,
              image: item.image ?? "",
              likes: "2",
              title: item.title ?? "",
              views: "45",
              isPaid: false,
            );
          },
          separatorBuilder: (context, index) => 12.ph,
          itemCount: favouriteList.length,
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }
}
