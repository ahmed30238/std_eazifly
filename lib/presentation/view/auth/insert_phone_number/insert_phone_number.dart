// import 'package:eazifly_student/core/component/custom_appbar.dart';
// import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
// import 'package:eazifly_student/core/component/custom_form_field.dart';
// import 'package:eazifly_student/core/extensions/num_extentions.dart';
// import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
// import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
// import 'package:eazifly_student/core/images/my_images.dart';
// import 'package:eazifly_student/core/theme/colors/main_colors.dart';
// import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
// import 'package:eazifly_student/presentation/controller/auth/login/login_cubit.dart';
// import 'package:eazifly_student/presentation/controller/auth/login/login_state.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// class InsertPhoneNumber extends StatelessWidget {
//   InsertPhoneNumber({super.key});
//   final FocusNode focusNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         context,
//         mainTitle: "",
//         leadingText: "عودة",
//         leadingIcon: Icons.arrow_back_ios,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: ListView(
//           children: [
//             8.ph,
//             Align(
//               alignment: Alignment.topRight,
//               child: InkWell(
//                 onTap: () {},
//                 child: Container(
//                   height: 56.h,
//                   width: 56.w,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Color(0xffF4F4F4),
//                   ),
//                   child: SvgPicture.asset(
//                     fit: BoxFit.scaleDown,
//                     MyImages.directInbox,
//                   ),
//                 ),
//               ),
//             ),
//             12.ph,
//             Text(
//               "إدخال رقم الهاتف",
//               style: MainTextStyle.boldTextStyle(
//                 fontSize: 16,
//                 color: MainColors.blackText,
//               ),
//             ),
//             12.ph,
//             RichText(
//               text: TextSpan(
//                 text: "تم إرسال رمز التأكيد الي رقم الهاتف المسجل  ",
//                 style: MainTextStyle.mediumTextStyle(
//                   color: MainColors.grayTextColors,
//                   fontSize: 12,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: " 010069554824",
//                     style: MainTextStyle.boldTextStyle(
//                       fontSize: 14,
//                       color: MainColors.blackText,
//                     ),
//                     recognizer: TapGestureRecognizer()..onTap = () {},
//                   ),
//                 ],
//               ),
//             ),
//             24.ph,
//             InkWell(
//               onTap: () {
//                 // FocusManager.instance.primaryFocus?.focusInDirection(TraversalDirection.up);
//               },
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: MainColors.formFieldgrayfillColor,
//                   border: Border.all(
//                     color: MainColors.formFieldgraySecondBorderColor,
//                   ),
//                   borderRadius: BorderRadius.circular(
//                     12.r,
//                   ),
//                 ),
//                 height: 48.h,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(
//                     6,
//                     (index) => Container(
//                       height: 3.h,
//                       width: 15.w,
//                       color: MainColors.formFieldgraySecondBorderColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // const CustomTextFormField(hintText: "",filledColor: MainColors.lightGray,),
//             105.ph,
//             CustomElevatedButton(
//               color: MainColors.blueTextColor,
//               radius: 16.r,
//               text: "التالي",
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   RoutePaths.layoutPath,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
