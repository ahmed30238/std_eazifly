import 'dart:developer';

import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    LibraryCubit.get(context).initTabController(this);
    LibraryCubit.get(context).getLibraryCategories();
    // LibraryCubit.get(context).storeFavouriteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) => CustomAppBar(
            context,
            mainTitle: lang.library,
            leadingText: "",
            leadingCustomWidth: 10.w,
            customAction: [
              cubit.tabController.index == 3
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: AppbarIconWidget(
                        iconColor: MainColors.blueTextColor,
                        onTap: () => showModalSheet(
                          maxHeight: 609.h,
                          minHeight: 608.h,
                          isFixedSize: true,
                          isDismissed: true,
                          context,
                          widget: StoreFavouriteListBottomSheet(cubit: cubit),
                        ),
                      ),
                    )
                  : 0.ph,
            ],
          ),
        ),
      ),
      body: Column(
        // padding:
        children: [
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextFormField(
              hintText: lang.search,
              prefixIconWidget: const PrefixSearchFormField(),
              suffixIconWidget: const SuffixMenuFormField(),
            ),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => CustomTabBar(
              controller: cubit.tabController,
              tabs: List.generate(
                cubit.tabController.length,
                (index) {
                  bool isSelected = index == cubit.tabController.index;
                  return Text(
                    cubit.tabTexts[index],
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? MainColors.blueTextColor
                          : MainColors.grayTextColors,
                    ),
                  );
                },
              ),
            ),
          ),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => Expanded(
              child: cubit.libraryBodies[cubit.tabController.index],
            ),
          ),
        ],
      ),
    );
  }
}

class StoreFavouriteListBottomSheet extends StatefulWidget {
  final LibraryCubit cubit;

  const StoreFavouriteListBottomSheet({super.key, required this.cubit});

  @override
  State<StoreFavouriteListBottomSheet> createState() =>
      _StoreFavouriteListBottomSheetState();
}

class _StoreFavouriteListBottomSheetState
    extends State<StoreFavouriteListBottomSheet> {
  // StreamSubscription? cubitSubscription;

  void onTapInsideBottomSheet() {
    if (widget.cubit.formKey.currentState?.validate() == false) {
      return;
    }
    // 1. إغلاق البوتوم شيت الحالية
    Navigator.pop(context);

    // // 2. إظهار شيت اللودينغ
    // showModalSheet(
    //   context,
    //   maxHeight: 120.h,
    //   minHeight: 110.h,
    //   widget: const Center(child: CircularProgressIndicator.adaptive()),
    //   isDismissed: false,
    // );

    // 3. طلب الداتا
    widget.cubit.getAllItems();
    showModalSheet(
      context,
      maxHeight: 609.h,
      minHeight: 608.h,
      isFixedSize: true,
      widget: BlocProvider.value(
        value: widget.cubit,
        child: const AllItemsBottomSheet(),
      ), // عرض البيانات
    );

    // 4. الاستماع للتغيرات
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.cubit,
      builder: (context, state) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MainColors.white,
          borderRadius: 16.cr,
        ),
        child: Form(
          key: widget.cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              36.ph,
              Container(
                height: 143.h,
                width: 343.w,
                decoration: BoxDecoration(
                  borderRadius: 8.cr,
                  color: MainColors.lightGray,
                ),
                child: widget.cubit.favListImage != null
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: 8.cr,
                            child: Image.file(
                              widget.cubit.favListImage!,
                              fit: BoxFit.cover,
                              width: 343.w,
                              height: 143.h,
                            ),
                          ),
                          IconButton(
                            color: MainColors.white,
                            onPressed: () {
                              widget.cubit.clearImages();
                            },
                            icon: const Icon(
                              Icons.delete,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            fit: BoxFit.cover,
                            width: 343.w,
                            height: 110.h,
                            Assets.iconsMusic,
                          ),
                          CustomLowSizeButton(
                            btnColor: MainColors.white,
                            width: 127.w,
                            text: "اضغط لتحديد الصورة",
                            onTap: () {
                              widget.cubit.pickFavImageImageFroGallery();
                            },
                          ),
                        ],
                      ),
              ),
              16.ph,
              Text(
                "اسم القائمة",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 14,
                ),
              ),
              8.ph,
              CustomTextFormField(
                hintText: "اكتب هنا",
                controller: widget.cubit.favouriteListController,
                validator: customValidation,
              ),
              32.ph,
              Align(
                alignment: Alignment.center,
                child: CustomElevatedButton(
                  text: "انشاء",
                  color: MainColors.blueTextColor,
                  height: 48.h,
                  width: 241.w,
                  radius: 16.r,
                  onPressed: onTapInsideBottomSheet,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllItemsBottomSheet extends StatelessWidget {
  const AllItemsBottomSheet({
    super.key,
  });

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
              text: "انشاء",
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

class PossibleFavItemsContainer extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onAddTap;
  final bool isAlreadyAdded;
  const PossibleFavItemsContainer({
    super.key,
    required this.title,
    required this.onAddTap,
    required this.image,
    required this.isAlreadyAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AvatarImage(
              height: 60.h,
              width: 60.w,
              imageUrl: image,
              shape: BoxShape.rectangle,
            ),
            SvgPicture.asset(
              colorFilter: const ColorFilter.mode(
                MainColors.white,
                BlendMode.srcIn,
              ),
              Assets.iconsPlay,
            ),
          ],
        ),
        8.pw,
        Text(
          title,
          style: MainTextStyle.boldTextStyle(fontSize: 14),
        ),
        const Spacer(),
        BlocBuilder<LibraryCubit, LibraryState>(
          builder: (context, state) {
            return AppbarIconWidget(
              backgroundColor: MainColors.lightblue,
              iconColor: MainColors.blueTextColor,
              iconWidget: isAlreadyAdded
                  ? const Icon(
                      Icons.remove,
                      color: MainColors.blueTextColor,
                    )
                  : null,
              onTap: onAddTap,
            );
          },
        ),
      ],
    );
  }
}
