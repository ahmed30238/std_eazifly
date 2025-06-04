import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/possile_fav_item_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AddSingleIemBottomSheet extends StatefulWidget {
  final int? favListId;
  final BuildContext parentContext;
  const AddSingleIemBottomSheet({
    super.key,
    this.favListId,
    required this.parentContext,
  });

  @override
  State<AddSingleIemBottomSheet> createState() =>
      _AddSingleIemBottomSheetState();
}

class _AddSingleIemBottomSheetState extends State<AddSingleIemBottomSheet> {
  @override
  void initState() {
    LibraryCubit.get(context).getAllItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = context.read<LibraryCubit>();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      width: double.infinity,
      child: Column(
        children: [
          54.ph,
          Text(
            "اختر المقاطع الصوتية التي تود اضافتها لقائمتك المفضضلة",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          16.ph,
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "اختر المقاطع الصوتية",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.grayTextColors,
              ),
            ),
          ),
          12.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              // Handle loading state
              if (cubit.getAllItemsLoader || cubit.getAllItemsEntity == null) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }

              // Handle error state
              if (state is GetAllItemsErrorState) {
                return Center(
                  child: Text('Error: ${state.errorMessage}'),
                );
              }

              // Handle empty state
              if (cubit.getAllItemsEntity?.data?.isEmpty ?? true) {
                return const Center(child: Text('No items found'));
              }

              // Success state - show list
              return Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  itemBuilder: (context, index) {
                    final item = cubit.getAllItemsEntity!.data![index];
                    return PossibleFavItemsContainer(
                      isAlreadyAdded: cubit
                          .getFavouriteListItemsUsingListIdEntity!.data!
                          .map((e) => e.id)
                          .contains(item.id),
                      image: item.image ?? "",
                      onAddTap: () {
                        // var favPlaylistItems = cubit.getFavouriteListItemsUsingListIdEntity?.data?[0].id;
                        if (cubit.getFavouriteListItemsUsingListIdEntity!.data!
                            .map((e) => e.id)
                            .contains(item.id)) {
                          delightfulToast(
                            message: "العنصر الذي تود اضافته موجود بالفعل",
                            context: widget.parentContext,
                          );
                          ScaffoldMessenger.of(widget.parentContext)
                              .showSnackBar(
                            const SnackBar(
                              content:
                                  Text("العنصر الذي تود اضافته موجود بالفعل"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          cubit.addSingleItemToFavList(
                            favouriteListId: widget.favListId ?? -1,
                            libraryItemId: item.id ?? -1,
                          );
                        }
                      },
                      title: item.title ?? "",
                    );
                  },
                  separatorBuilder: (context, index) => 16.ph,
                  itemCount: cubit.getAllItemsEntity?.data?.length ?? 0,
                ),
              );
            },
          ),
          if (cubit.getAllItemsLoader) const Spacer(),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => CustomElevatedButton(
              text: "تخطي",
              radius: 16.r,
              color: MainColors.blueTextColor,
              width: 127.w,
              onPressed: cubit.storeFavouriteListLoader
                  ? () {}
                  : () async {
                      // await cubit.addSingleItemToFavList(
                      //     favouriteListId: widget.favListId ?? -1,
                      //    );
                      back(context);
                    },
              child: cubit.storeFavouriteListLoader
                  ? const CircularProgressIndicator.adaptive()
                  : null,
            ),
          ),
          16.ph,
        ],
      ),
    );
  }
}
