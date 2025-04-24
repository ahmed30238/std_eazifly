import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';


class PackageContainer extends StatelessWidget {
  final bool isSelected;
  const PackageContainer({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 217.h,
      width: 295.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? MainColors.blueTextColor : MainColors.black,
        ),
        color: isSelected ? MainColors.lightblue : MainColors.white,
        borderRadius: 12.cr,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,
          Text(
            "إسم الباقة",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
          const CustomHorizontalDivider(),
          8.ph,
          Expanded(
            child: ListView.builder(
              // padding: ,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const PackageFeature(),
              itemCount: 3,
            ),
          )
        ],
      ),
    );
  }
}

class PackageFeature extends StatelessWidget {
  const PackageFeature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(MyImages.iconsCheckMark),
          8.pw,
          Expanded(
            child: Text(
              "خر تطورات الإدارة والعلوادر موثوقة وحديثة",
              style: MainTextStyle.mediumTextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}