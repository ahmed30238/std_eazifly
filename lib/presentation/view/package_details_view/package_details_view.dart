import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PackageDetailsView extends StatelessWidget {
  const PackageDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var ddd = ["عدد البرامج", "سعر المجموعة", "تاريخ البدء"];
    var eee = ["4 برامج", "1200 ج.م", "12-2-2025"];
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.packageDetails,
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  16.ph,
                  StudentStats(
                    horizontalPadding: 0,
                    titleText: ddd,
                    descText: eee,
                  ),
                  24.ph,
                  Text(
                    "مشتملات المجموعة",
                    style: MainTextStyle.boldTextStyle(fontSize: 12),
                  ),
                  16.ph,
                  Expanded(
                    // height: (12 * 241) + 16,
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 16.h),
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          PackageContentsItem(index: index),
                      separatorBuilder: (context, index) => 16.ph,
                      itemCount: 12,
                    ),
                  ),
                ],
              ),
            ),
            8.ph,
            ButtonWithPrice(onPressed: () {}),
            32.ph,
          ],
        ),
      ),
    );
  }
}
