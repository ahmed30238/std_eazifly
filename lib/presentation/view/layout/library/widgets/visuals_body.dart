import 'dart:developer';

import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/audios_loader.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/most_popular_list.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class VisualsBody extends StatelessWidget {
  const VisualsBody({super.key});

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
        var visualListCategories = cubit.libraryCategoriesEntity?.data
            ?.where(
              (element) => element.type == "visuals",
            )
            .toList();
        log("$visualListCategories ${visualListCategories?.length}");
        return visualListCategories != null && visualListCategories.isNotEmpty
            ? ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        visualListCategories[index].title ?? "",
                        style: MainTextStyle.boldTextStyle(fontSize: 16),
                      ),
                    ),
                    8.ph,
                    MostPopularList(
                      voiceListCategories: visualListCategories[index],
                      onTap: () {},
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => 24.ph,
                itemCount: visualListCategories.length,
              )
            : const NoDataAnimatedImageWidget(message: "لا مرئيات متاحة");
      },
    );
  }
}

class VisualsBodyItem extends StatelessWidget {
  final int index;
  const VisualsBodyItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 127.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
        top: index != 0 ? 0 : 16.h,
        bottom: index == 3 ? 16.h : 0, // todo last item list length - 1
      ),
      width: 343.w,
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: 16.cr,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,
          Text(
            "مجموعة قصص مختارة ",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
          4.ph,
          Text(
            "مجموعة كتب مختارة لمذاكرة الرياضيات للصف السادس الابتدائي مثال :هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنكحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد ",
            style: MainTextStyle.boldTextStyle(
                fontSize: 12, color: MainColors.grayTextColors),
          ),
          16.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.iconsLibraryBook,
                        ),
                        4.pw,
                        Text(
                          "3566",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.blackText,
                          ),
                        ),
                      ],
                    ),
                    16.pw,
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.iconsHeart,
                        ),
                        4.pw,
                        Text(
                          "153",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.blackText,
                          ),
                        ),
                      ],
                    ),
                    16.pw,
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.iconsPeople,
                        ),
                        4.pw,
                        Text(
                          "344",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.blackText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomLowSizeButton(
                width: 112.w,
                fontSize: 12,
                borderRadius: 12.cr,
                btnColor: MainColors.lightblue,
                height: 26.h,
                // color:
                textColor: MainColors.blueTextColor,
                text: "أضف إلى مكتبتك",
                onTap: () {
                  Navigator.pushNamed(
                      context, RoutePaths.addToLibraryPackageDetailsView);
                },
              ),
            ],
          ),
          12.ph,
        ],
      ),
    );
  }
}
