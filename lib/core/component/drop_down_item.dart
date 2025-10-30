// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:quick_rev/core/text_styles.dart/styles.dart';

// class DropDownItem extends StatelessWidget {
//   final String itemTitle;
//   final List<DropdownMenuItem<String>>? items;
//   final String hintText;
//   final Function(String?)? onChanged;
//   final Widget? prefixIconWidget;
//   final String? Function(String?)? validator;

//   const DropDownItem({
//     super.key,
//     required this.dropDownList,
//     required this.itemTitle,
//     required this.items,
//     required this.hintText,
//     this.onChanged,
//     this.prefixIconWidget,
//     this.validator,
//   });

//   final List<String> dropDownList;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           itemTitle,
//           style: MainTextStyle.boldTextSytle(fontSize: 17.sp),
//         ),
//         CustomizedDropdownWidget(
//           validator: validator,
//           borderColor:Colors.grey,
//           hintText: hintText,
//           items: items,
//           onChanged: onChanged,
//           prefixIconWidget: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: prefixIconWidget,
//           ),
//         ),
//       ],
//     );
//   }
// }
