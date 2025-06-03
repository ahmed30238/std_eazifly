import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
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
    LibraryCubit.get(context).storeFavouriteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.library,
        leadingText: "",
        leadingCustomWidth: 10.w,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppbarIconWidget(
              iconColor: MainColors.blueTextColor,
              onTap: () => showModalSheet(
                maxHeight: 609.h,
                minHeight: 608.h,
                isFixedSize: true,
                isDismissed: true,
                context,
                widget: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MainColors.white,
                    borderRadius: 16.cr,
                  ),
                  child: Column(
                    children: [
                      36.ph,
                      Text(
                        "اكتب اسم القائمة هنا",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 14,
                        ),
                      ),
                      32.ph,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomTextFormField(
                          hintText: "اكتب هنا",
                          controller: cubit.favouriteListController,
                        ),
                      ),
                      32.ph,
                      CustomElevatedButton(
                        text: "انشاء",
                        color: MainColors.blueTextColor,
                        height: 48.h,
                        width: 241.w,
                        radius: 16.r,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
