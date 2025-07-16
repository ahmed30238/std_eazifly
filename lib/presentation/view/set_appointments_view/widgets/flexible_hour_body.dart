// import 'package:eazifly_student/core/component/titled_form_field.dart';
// import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
// import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
// import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
// import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
// import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/chosen_day_bottom_sheet.dart';
// import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/lecturer_item.dart';
// import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/specified_hour_row.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

class FlexibleHourBody extends StatelessWidget {
  const FlexibleHourBody({super.key});

  @override
  Widget build(BuildContext context) {
    // var lang = context.loc!;
    // var cubit = context.read<GrouppackagemanagementCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "هذه الخدمة غير متاحة في الوقت الحالي",
          style: MainTextStyle.boldTextStyle(
            fontSize: 14,
          ),
        ),
        10.ph,
        Text(
          "سيتم توفير الخدمه في اقرب وقت",
          style: MainTextStyle.boldTextStyle(
            fontSize: 14,
            color: MainColors.blueTextColor,
          ),
        ),
        //   32.ph,
        //   GestureDetector(
        //     onTap: () {
        //       showModalSheet(
        //         isFixedSize: true,
        //         context,
        //         minHeight: 495.h,
        //         maxHeight: 496.h,
        //         isDismissed: true,
        //         widget: BlocProvider.value(
        //           value: cubit,
        //           child: const ChosenDaysBottomSheet(),
        //         ),
        //       );
        //     },
        //     child: TitledFormFieldItem(
        //       verticalSpace: 8.ph,
        //       enabled: false,
        //       suffIcon: Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 16.w),
        //         child: SvgPicture.asset(Assets.iconsArrowDown),
        //       ),
        //       iconWidget: 0.ph,
        //       titleText: lang.days,
        //       formfieldHintText: lang.choose,
        //     ),
        //   ),
        //   32.ph,
        //   const SpecifiedHourRow(),
        //   32.ph,
        //   Text(
        //     lang.chooseAppropriateLecturer,
        //     style: MainTextStyle.boldTextStyle(
        //       fontSize: 12,
        //     ),
        //   ),
        //   8.ph,
        //   SizedBox(
        //     height: 48.h,
        //     child: BlocBuilder(
        //       bloc: cubit,
        //       builder: (context, state) => ListView.separated(
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (context, index) {
        //           bool isSelected = cubit.selectedLecturerIndex == index;
        //           return InkWell(
        //             onTap: () {
        //               cubit.changeLecturerIndex(index);
        //             },
        //             child: LecturerItem(
        //               image:"" ,
        //               instructorName: "",
        //               isSelected: isSelected,
        //             ),
        //           );
        //         },
        //         separatorBuilder: (context, index) => 8.pw,
        //         itemCount: 4,
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
