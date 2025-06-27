// import 'package:eazifly_student/core/component/custom_form_field.dart';
// import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
// import 'package:flutter/material.dart';

// class TimePickerWidget extends StatefulWidget {
//   const TimePickerWidget({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _TimePickerWidgetState createState() => _TimePickerWidgetState();
// }

// class _TimePickerWidgetState extends State<TimePickerWidget> {
//   String selectedTime = "24 ساعة";

//   Future<void> _showTimePicker() async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       builder: (BuildContext context, Widget? child) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
//           child: child!,
//         );
//       },
//     );

//     if (picked != null) {
//       setState(() {
//         // تحويل الوقت إلى صيغة 12 ساعة مع AM/PM
//         final hour = picked.hourOfPeriod == 0 ? 12 : picked.hourOfPeriod;
//         final minute = picked.minute.toString().padLeft(2, '0');
//         final period = picked.period == DayPeriod.am ? 'ص' : 'م';
//         selectedTime = '$hour:$minute $period';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           "الموعد",
//           style: MainTextStyle.boldTextStyle(fontSize: 12),
//         ),
//         const SizedBox(width: 8), // بدلاً من 8.pw
//         Expanded(
//           child: GestureDetector(
//             onTap: _showTimePicker,
//             child: AbsorbPointer(
//               // لمنع التفاعل مع الـ TextFormField مباشرة
//               child: CustomTextFormField(
//                 hintText: selectedTime,
//                 enabled: false, // تعطيل الحقل
//                 suffixIcon: Icons.access_time,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // إذا كنت تريد استخدام نفس الكود في مكانه الأصلي:
// class YourOriginalWidget extends StatefulWidget {
//   const YourOriginalWidget({super.key});

//   @override
//   _YourOriginalWidgetState createState() => _YourOriginalWidgetState();
// }

// class _YourOriginalWidgetState extends State<YourOriginalWidget> {
//   String selectedTime = "24 ساعة";

//   Future<void> _showTimePicker() async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       builder: (BuildContext context, Widget? child) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
//           child: child!,
//         );
//       },
//     );

//     if (picked != null) {
//       setState(() {
//         final hour = picked.hourOfPeriod == 0 ? 12 : picked.hourOfPeriod;
//         final minute = picked.minute.toString().padLeft(2, '0');
//         final period = picked.period == DayPeriod.am ? 'ص' : 'م';
//         selectedTime = '$hour:$minute $period';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           "الموعد",
//           style: MainTextStyle.boldTextStyle(fontSize: 12),
//         ),
//         const SizedBox(width: 8), // أو استخدم 8.pw إذا كان متاح
//         Expanded(
//           child: GestureDetector(
//             onTap: _showTimePicker,
//             child: AbsorbPointer(
//               child: CustomTextFormField(
//                 hintText: selectedTime,
//                 enabled: false,
//                 suffixIcon: Icons.access_time,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
