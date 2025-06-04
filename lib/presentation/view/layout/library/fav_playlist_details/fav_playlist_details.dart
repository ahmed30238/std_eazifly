import 'dart:developer';
import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/fav_playlist_details/widgets/add_single_item_bottom_sheet.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/library_favourite_list_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class FavouritePlaylistDetails extends StatefulWidget {
  final int playlistId;
  final String playlistName;
  final String playlistImage;
  const FavouritePlaylistDetails({
    super.key,
    required this.playlistId,
    required this.playlistName,
    required this.playlistImage,
  });

  @override
  State<FavouritePlaylistDetails> createState() =>
      _FavouritePlaylistDetailsState();
}

class _FavouritePlaylistDetailsState extends State<FavouritePlaylistDetails> {
  late LibraryCubit cubit;
  @override
  void initState() {
    log("${widget.playlistId}");
    cubit = context.read<LibraryCubit>();
    cubit.getFavouriteListItemsUsingListId(listId: widget.playlistId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "",
        leadingText: lang.library,
        leadingCustomWidth: 110.w,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppbarIconWidget(
              width: 87.w,
              iconWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.iconsShare2,
                  ),
                  8.pw,
                  Text(
                    "مشاركة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 180.h,
            width: 343.w,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: MainColors.lightGray,
              borderRadius: 8.cr,
            ),
            child: AvatarImage(
              imageUrl: widget.playlistImage,
            ),
          ),
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              widget.playlistName,
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            ),
          ),
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomElevatedButton(
                  text: "إضافة",
                  textSize: 12,
                  color: MainColors.lightblue,
                  textColor: MainColors.blueTextColor,
                  height: 32.h,
                  radius: 8.r,
                  width: 99.w,
                  onPressed: () {
                    showModalSheet(
                      maxHeight: 609.h,
                      minHeight: 608.h,
                      isFixedSize: true,
                      context,
                      widget: BlocProvider.value(
                        value: cubit,
                        child: AddSingleIemBottomSheet(
                          favListId: widget.playlistId,
                          parentContext: context,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.iconsAdd,
                        fit: BoxFit.scaleDown,
                      ),
                      4.pw,
                      Text(
                        "إضافة",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.blueTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                8.pw,
                CustomElevatedButton(
                  text: "تعديل",
                  radius: 8.r,
                  textSize: 12,
                  color: MainColors.lightblue,
                  textColor: MainColors.blueTextColor,
                  height: 32.h,
                  width: 99.w,
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.iconsEdit,
                      ),
                      4.pw,
                      Text(
                        "تعديل",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.blueTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 16.ph,
          BlocBuilder<LibraryCubit, LibraryState>(
            builder: (context, state) {
              if (cubit.getFavouriteListItemsLoader) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (state is FavouriteListItemsUsingListIdErrorState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.errorMessage}'),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () => cubit.getFavouriteListItemsUsingListId(
                          listId: widget.playlistId,
                        ),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              if (cubit.getFavouriteListItemsUsingListIdEntity?.data?.isEmpty ??
                  true) {
                return const Center(
                  child: Text('No items in this playlist'),
                );
              }

              // Success state with data
              return Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  itemBuilder: (context, index) {
                    final playlistItem = cubit
                        .getFavouriteListItemsUsingListIdEntity!.data![index];
                    return LibraryFavouriteListItem(
                      image: playlistItem.image ?? "",
                      index: index,
                      likes: "21",
                      onTap: () {},
                      title: playlistItem.title ?? "Untitled",
                      views: "0",
                    );
                  },
                  separatorBuilder: (context, index) => 10.ph,
                  itemCount: cubit
                      .getFavouriteListItemsUsingListIdEntity!.data!.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
