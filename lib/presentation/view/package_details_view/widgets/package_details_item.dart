import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PackageContentsItem extends StatelessWidget {
  final int index;
  const PackageContentsItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 12.w,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              "${index + 1}",
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        12.pw,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: MainColors.blueTextColor,
                  width: 4.w,
                ),
              ),
            ),
            height: 240.h,
            width: 322.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.r),
                    bottomLeft: Radius.circular(4.r),
                  )),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    MyImages.imagesPersona,
                    height: 127.h,
                    width: 322.w,
                  ),
                ),
                8.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "دروس تعليمية في التجويد",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                4.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "احصلوا على استشارات تربوية متخصصة تساعدكم في توجيه أولادكم نحو التعلم الفعّال. نقدم نصائح حول كيفية دمج التعلم القرآني في الروتين اليومي.",
                    style: MainTextStyle.mediumTextStyle(
                      color: MainColors.grayTextColors,
                      fontSize: 12,
                    ).copyWith(
                      height: 2.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
