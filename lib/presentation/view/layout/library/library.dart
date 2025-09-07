import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/store_fav_list_bottom_sheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView>
    with SingleTickerProviderStateMixin {
  // @override
  // void initState() {
  //
  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    LibraryCubit.get(context).initTabController(this, context);
    LibraryCubit.get(context).getLibraryCategories();
    super.didChangeDependencies();
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
              cubit.tabController.index == 2
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: AppbarIconWidget(
                        iconColor: MainColors.primary,
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
                    cubit.tabTexts(context)[index],
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? MainColors.primary
                          : MainColors.onSurfaceSecondary,
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
