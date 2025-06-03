import 'dart:developer';

import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/audios_loader.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/most_popular_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudiosBody extends StatelessWidget {
  const AudiosBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LibraryCubit>();

    // var lang = context.loc!;
    return BlocBuilder<LibraryCubit, LibraryState>(
      builder: (context, state) {
        if (state is LibraryCategoriesErrorState) {
          return Text(state.errorMessage);
        }
        if (cubit.getLibraryCategoriesLoader) {
          return const AudioShimmerList();
        }
        var voiceListCategories = cubit.libraryCategoriesEntity?.data
            ?.where(
              (element) => element.type == "voice",
            )
            .toList();
        log("$voiceListCategories ${voiceListCategories?.length}");
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
                  voiceListCategories?[index].title ?? "",
                  style: MainTextStyle.boldTextStyle(fontSize: 16),
                ),
              ),
              8.ph,
              MostPopularList(
                voiceListCategories: voiceListCategories?[index],
              ),
            ],
          ),
          separatorBuilder: (context, index) => 24.ph,
          itemCount: voiceListCategories?.length ?? 0,
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
