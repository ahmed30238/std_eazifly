import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Future<dynamic> childrenModalSheet(BuildContext context) {
  return showModalSheet(
    minHeight: 100.h, // 260.h,
    maxHeight: 100.h, // 261.h,
    isFixedSize: true,
    context,
    widget: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 100.h, // 260.h,
      width: 375.w,
      decoration: BoxDecoration(
        borderRadius: 12.cr,
        color: MainColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.ph,
          // InkWell(
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       RoutePaths.lectureView,
          //       arguments: {
          //         "programId" : 1 // TODO
          //       },
          //     );
          //   },
          //   child: SizedBox(
          //     height: 45.h,
          //     child: Text(
          //       "عرض باقي البيانات",
          //       style: MainTextStyle.boldTextStyle(fontSize: 14),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: SizedBox(
          //     height: 45.h,
          //     child: Text(
          //       "تعديل بيانات الطالب",
          //       style: MainTextStyle.boldTextStyle(fontSize: 14),
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 45.h,
              child: Text(
                "حذف الطالب",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       RoutePaths.lectureHistoryView,
          //     );
          //   },
          //   child: SizedBox(
          //     height: 45.h,
          //     child: Text(
          //       "تاريخ المحاضرات ",
          //       style: MainTextStyle.boldTextStyle(fontSize: 14),
          //     ),
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SvgPicture.asset(MyImages.iconsProfile),
          //     8.pw,
          //     Text(
          //       "تعديل",
          //       style:
          //           MainTextStyle.boldTextStyle(fontSize: 14),
          //     ),
          //   ],
          // )
        ],
      ),
    ),
  );
}
