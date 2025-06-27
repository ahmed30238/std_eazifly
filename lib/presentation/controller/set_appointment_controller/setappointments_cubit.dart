// import 'dart:developer';

// import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
// import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_state.dart';
// import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/repeated_weekly_session.dart';
// import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart'
//     hide InitTabBarControllerState;

// class SetappointmentsCubit extends Cubit<SetappointmentsState> {
//   SetappointmentsCubit() : super(SetappointmentsInitial());
//   static SetappointmentsCubit get(BuildContext context) =>
//       BlocProvider.of<SetappointmentsCubit>(context);

//   TabController? fixedDateController;
//   void initFixedDateTabBarController(TickerProvider vsync) {
//     fixedDateController = TabController(length: tabs.length, vsync: vsync);
//     fixedDateController?.addListener(() {
//       if (fixedDateController!.indexIsChanging) {
//         fixedDateController?.animateTo(
//           fixedDateController!.index,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeIn,
//         );
//       }
//       emit(InitFixedTabBarControllerState());
//     });
//   }

//   String specifiedDay = "";
//   TextEditingController dayController = TextEditingController();
//   changeSpecifiedDay(String day) {
//     specifiedDay = day;
//     dayController.text = day;
//     emit(ChangeSpecifiedDayState());
//   }

//   int selectedLecturerIndex = 0;
//   changeLecturerIndex(int index) {
//     selectedLecturerIndex = index;
//     emit(ChangeLecturerIndexState());
//   }

//   late TabController controller;

//   final List<String> tabs = [
//     "مواعيد ثابتة",
//     'مواعيد مرنة',
//   ];

//   void initTabBarController(TickerProvider vsync) {
//     controller = TabController(length: tabs.length, vsync: vsync);
//     controller.addListener(() {
//       if (controller.indexIsChanging) {
//         controller.animateTo(
//           controller.index,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeIn,
//         );
//       }
//       emit(InitTabBarControllerState());
//     });
//   }

//   int tapbarIndex = 0;

//   void changeTapbarIndex(int index) {
//     tapbarIndex = index;
//     emit(ChangeTapBarIndexState());
//   }

//   List<bool> chosenDays = [];
//   int limit = 3;
//   void changeChosenDays(int index) {
//     // while (chosenDays.length <= limit) {
//     chosenDays[index] = !chosenDays[index];
//     // }
//     // chosenDays[index] = true;
//     emit(ChangeChosenDaysState());
//   }

//   var days = [
//     'السبت',
//     'الأحد',
//     'الإثنين',
//     'الثلاثاء',
//     'الأربعاء',
//     'الخميس',
//     'الجمعة',
//   ];
//   List<Widget> bodies({
//     required BuildContext context,
//     required SetappointmentsCubit cubit,
//     required GrouppackagemanagementCubit grouppackagemanagementCubit,
//   }) {
//     log("no of sessions ${grouppackagemanagementCubit.getOrderDetailsEntity?.data?.numberOfSessionPerWeek}");
//     return [
//       BlocProvider.value(
//         value: grouppackagemanagementCubit,
//         child: RepeatedWeeklySession(
//           numberOfSessionsPerWeek: int.tryParse(grouppackagemanagementCubit
//                       .getOrderDetailsEntity?.data?.numberOfSessionPerWeek ??
//                   "0") ??
//               0,
//         ),
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           16.ph,
//           Text(
//             "حصة ${0 + 1}",
//             style: MainTextStyle.boldTextStyle(
//               fontSize: 14,
//               color: MainColors.blueTextColor,
//             ),
//           ),
//           Row(
//             children: [
//               Text(
//                 "اليوم",
//                 style: MainTextStyle.boldTextStyle(
//                   fontSize: 12,
//                 ),
//               ),
//               16.pw,
//               Expanded(
//                 child: InkWell(
//                   onTap: () => showDatePicker(
//                     context: context,
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime(2030),
//                   ),
//                   child: CustomTextFormField(
//                     enabled: false,
//                     hintText: "اختر",
//                     suffixIconWidget: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16.w,
//                       ),
//                       child: SvgPicture.asset(
//                         Assets.iconsCalender,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           12.ph,
//           Row(
//             children: [
//               Text(
//                 "من",
//                 style: MainTextStyle.boldTextStyle(fontSize: 12),
//               ),
//               16.pw,
//               const Expanded(
//                 child: CustomTextFormField(
//                   keyboardType: TextInputType.datetime,
//                   hintText: "        aa / mm / hh",
//                 ),
//               ),
//               15.5.pw,
//               Text(
//                 "الي",
//                 style: MainTextStyle.boldTextStyle(fontSize: 12),
//               ),
//               16.pw,
//               const Expanded(
//                 child: CustomTextFormField(
//                   keyboardType: TextInputType.datetime,
//                   hintText: "        aa / mm / hh",
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ];
//   }
// }
