// import 'package:eazifly_student/core/component/titled_form_field.dart';
// import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
// import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_state.dart';
// import 'package:eazifly_student/presentation/view/account_data/widgets/profile_image_widget.dart';
// import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/widgets/picking_student_profile.dart';
// import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/widgets/student_gender_box.dart';
// import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

// class StudentDataBody extends StatelessWidget {
//   // final bool isAssignToProgram;
//   const StudentDataBody({
//     super.key,
//     // required this.isAssignToProgram,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var cubit = AddNewStudentDataToProgramCubit.get(context);

//     return Column(
//       children: [
//         Expanded(
//           child: Form(
//             key: cubit.formKey,
//             child: ListView(
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               children: [
//                 17.ph,
//                 PickingStudentProfile(cubit: cubit),
//                 24.ph,
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: TitledFormFieldItem(
//                         validator: customValidation,
//                         verticalSpace: 8.ph,
//                         iconWidget: 0.ph,
//                         titleText: "إسم المستخدم ",
//                         controller: cubit.userNameController,
//                         formfieldHintText: "مثال",
//                       ),
//                     ),
//                     16.pw,
//                     Expanded(
//                       child: TitledFormFieldItem(
//                         validator: customValidation,
//                         iconWidget: 0.ph,
//                         keyboardType: TextInputType.number,
//                         controller: cubit.ageController,
//                         titleText: "العمر",
//                         formfieldHintText: "مثال",
//                       ),
//                     ),
//                   ],
//                 ),
//                 24.ph,
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TitledFormFieldItem(
//                         validator: customValidation,
//                         verticalSpace: 8.ph,
//                         keyboardType: TextInputType.name,
//                         iconWidget: 0.ph,
//                         titleText: "الاسم الاول",
//                         controller: cubit.firstNameController,
//                         formfieldHintText: "مثال",
//                       ),
//                     ),
//                     16.pw,
//                     Expanded(
//                       child: TitledFormFieldItem(
//                         validator: customValidation,
//                         iconWidget: 0.ph,
//                         keyboardType: TextInputType.name,
//                         controller: cubit.lastNameController,
//                         titleText: "اسم العائلة",
//                         formfieldHintText: "مثال",
//                       ),
//                     ),
//                   ],
//                 ),
//                 16.ph,
//                 TitledFormFieldItem(
//                   validator: customValidation,
//                   iconWidget: 0.ph,
//                   keyboardType: TextInputType.number,
//                   titleText: "phone",
//                   formfieldHintText: "010****",
//                   controller: cubit.phoneController,
//                 ),
//                 16.ph,
//                 TitledFormFieldItem(
//                   validator: customValidation,
//                   keyboardType: TextInputType.number,
//                   iconWidget: 0.ph,
//                   titleText: "whatsapp",
//                   formfieldHintText: "010****",
//                   controller: cubit.whatsAppController,
//                 ),
//                 16.ph,
//                 Text(
//                   "النوع",
//                   style: MainTextStyle.boldTextStyle(
//                     fontSize: 14,
//                     color: MainColors.blackText,
//                   ),
//                 ),
//                 8.ph,
//                 BlocBuilder(
//                   bloc: cubit,
//                   builder: (context, state) => Row(
//                     children: List.generate(
//                       2,
//                       (index) {
//                         bool isSelected = cubit.genderIndex == index;
//                         return StudentGenderBox(
//                           isSelected: isSelected,
//                           onTap: () => cubit.changeGender(index),
//                           icon:
//                               index == 0 ? Assets.iconsMale : Assets.iconsFemal,
//                           type: index == 0 ? "ذكر" : "أنثى",
//                           padding: 8,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 16.ph,
//                 TitledFormFieldItem(
//                   validator: customValidation,
//                   iconWidget: 0.ph,
//                   maxLines: 4,
//                   titleText: "ملاحظات",
//                   formfieldHintText: "formfieldHintText",
//                 ),
//                 16.ph,
//                 TitledFormFieldItem(
//                   validator: customValidation,
//                   iconWidget: 0.ph,
//                   titleText: "أنشأ بريد إلكتروني",
//                   keyboardType: TextInputType.emailAddress,
//                   formfieldHintText: "email",
//                   controller: cubit.emailController,
//                 ),
//                 16.ph,
//                 BlocBuilder<AddNewStudentDataToProgramCubit,
//                     AddNewStudentDataToProgramState>(
//                   builder: (context, state) {
//                     return TitledFormFieldItem(
//                       maxLines: 1,
//                       suffIcon: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 12.w,
//                           vertical: 12.h,
//                         ),
//                         child: InkWell(
//                           onTap: () => cubit.changeConfirmPassisiblity(),
//                           child: Icon(
//                             cubit.confirmPassVisible
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                           ),
//                         ),
//                       ),
//                       validator: customValidation,
//                       isPassword: cubit.createPassVisible,
//                       iconWidget: 0.ph,
//                       keyboardType: TextInputType.visiblePassword,
//                       titleText: "أنشأ كلمة مرور",
//                       formfieldHintText: "**********",
//                       controller: cubit.passwordController,
//                     );
//                   },
//                 ),
//                 16.ph,
//                 BlocBuilder<AddNewStudentDataToProgramCubit,
//                     AddNewStudentDataToProgramState>(
//                   builder: (context, state) {
//                     return TitledFormFieldItem(
//                       maxLines: 1,
//                       suffIcon: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 12.w,
//                           vertical: 12.h,
//                         ),
//                         child: InkWell(
//                           onTap: () => cubit.changeConfirmPassisiblity(),
//                           child: Icon(
//                             cubit.confirmPassVisible
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                           ),
//                         ),
//                       ),
//                       validator: customValidation,
//                       isPassword: cubit.confirmPassVisible,
//                       iconWidget: 0.ph,
//                       titleText: "تاكيد كلمة مرور",
//                       keyboardType: TextInputType.visiblePassword,
//                       formfieldHintText: "**********",
//                       controller: cubit.confirmPasswordController,
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         8.ph,
//         BlocBuilder(
//           bloc: cubit,
//           builder: (context, state) => CustomElevatedButton(
//             text: "التالي",
//             width: 343.w,
//             color: MainColors.blueTextColor,
//             radius: 16.w,
//             onPressed: cubit.createNewChildLoader
//                 ? () {}
//                 : () async {
//                     cubit.isAssignToProgram
//                         ? Navigator.pushNamed(
//                             context,
//                             RoutePaths.studentManagement,
//                           )
//                         : Navigator.pushNamed(
//                             context,
//                             RoutePaths.groupPackageManagement,
//                             arguments: "1"// orderId,
//                           );

//                     // cubit.incrementScreenIndex();

//                     // await cubit.createNewChild(context);
//                   },
//             child: cubit.createNewChildLoader
//                 ? const CircularProgressIndicator.adaptive()
//                 : null,
//           ),
//         ),
//         32.ph,
//       ],
//     );
//   }
// }
