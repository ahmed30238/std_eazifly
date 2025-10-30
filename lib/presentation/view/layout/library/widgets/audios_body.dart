import 'dart:developer';

import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/audios_loader.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/category_card.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AudiosBody extends StatelessWidget {
  const AudiosBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LibraryCubit>();
    var lang = context.loc!;

    return BlocBuilder<LibraryCubit, LibraryState>(
      builder: (context, state) {
        if (state is LibraryCategoriesErrorState) {
          return Text(state.errorMessage);
        }
        if (cubit.getLibraryCategoriesLoader) {
          return const AudioShimmerList();
        }
        var voiceListCategories = cubit.libraryCategoriesEntity?.data
            ?.where((element) => element.type == "voice")
            .toList();
        if (voiceListCategories == null || voiceListCategories.isEmpty) {
          log("empty state");
          return Padding(
            padding: EdgeInsets.only(top: 48.h),
            child: NoDataAnimatedImageWidget(message: lang.noAudios).center(),
          );
        }
        log("$voiceListCategories ${voiceListCategories.length}");
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  voiceListCategories[index].title ?? "",
                  style: MainTextStyle.boldTextStyle(fontSize: 16),
                ),
              ),
              8.ph,
              CategoryCard(
                voiceListCategories: voiceListCategories[index],
                onTap: () {},
              ),
            ],
          ),
          separatorBuilder: (context, index) => 24.ph,
          itemCount: voiceListCategories.length,
        );
      },
    );

    // ListView(
    //   physics: const BouncingScrollPhysics(),
    //   children: [
    //     24.ph,

    // 24.ph,
    // Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 16.w),
    //   child: Text(
    //     voiceListCategories?.first.title ?? "",
    //     style: MainTextStyle.boldTextStyle(fontSize: 16),
    //   ),
    // ),
    // 8.ph,
    // 24.ph,
    // Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 16.w),
    //   child: Text(
    //     lang.forYou,
    //     style: MainTextStyle.boldTextStyle(fontSize: 16),
    //   ),
    // ),
    // 8.ph,
    // const ForYouList(),
    // 24.ph,
    // Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 16.w),
    //   child: Text(
    //     lang.mostSellers,
    //     style: MainTextStyle.boldTextStyle(fontSize: 16),
    //   ),
    // ),
    // 8.ph,
    // const BestSellersList(),
    // 16.ph,
    //   ],
    // );
  }
}
