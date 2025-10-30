import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Future<dynamic> lectureReportModelSheet(BuildContext context, int index) {
  return showModalSheet(
    isFixedSize: true,
    minHeight: 101.h,
    maxHeight: 102.h,
    context,
    widget: CustomBottomSheetDesign(
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.h),
        child: InkWell(
          onTap: () {
            //   Navigator.pushNamed(
            //   arguments: index,
            //   context,
            //   RoutePaths.lectureReportView,
            // );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            height: 45.h,
            child: Text(
              "تقرير المحاضرة",
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    ),
  );
}
