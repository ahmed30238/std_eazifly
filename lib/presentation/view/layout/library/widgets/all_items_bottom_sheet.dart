import 'dart:developer';

import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/possile_fav_item_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AllItemsBottomSheet extends StatefulWidget {
  final int? itemId;
  final int? favListId;
  const AllItemsBottomSheet({
    super.key,
    this.favListId,
    this.itemId,
  });

  @override
  State<AllItemsBottomSheet> createState() => _AllItemsBottomSheetState();
}

class _AllItemsBottomSheetState extends State<AllItemsBottomSheet> {
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
                    log("${cubit.itemsToAddToFvouriteWhenCreatingPlayList} ${cubit.itemsToAddToFvouriteWhenCreatingPlayList.length}");
                    return PossibleFavItemsContainer(
                      isAlreadyAdded: cubit
                          .itemsToAddToFvouriteWhenCreatingPlayList
                          .contains(item.id),
                      image: item.image ?? "",
                      onAddTap: () {
                        cubit.toggleAddingRemoving(item.id ?? -1);
                      },
                      title: item.title ?? "",
                    );
                  },
                  separatorBuilder: (context, index) => 16.ph,
                  itemCount: cubit.getAllItemsEntity!.data!.length,
                ),
              );
            },
          ),
          if (cubit.getAllItemsLoader) const Spacer(),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => CustomElevatedButton(
              text:  "إنشاء",
              radius: 16.r,
              color: MainColors.blueTextColor,
              width: 127.w,
              onPressed: cubit.storeFavouriteListLoader
                  ? () {}
                  : () async {
                      await cubit.storeFavouriteList();
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
