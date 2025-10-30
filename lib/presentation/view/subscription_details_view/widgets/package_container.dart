import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PackageContainer extends StatelessWidget {
  final bool isSelected;
  const PackageContainer({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 217.h,
      width: 295.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? MainColors.primary : MainColors.onPrimary,
        ),
        color: isSelected ? MainColors.surface : MainColors.background,
        borderRadius: 12.cr,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,
          Text("إسم الباقة", style: MainTextStyle.boldTextStyle(fontSize: 14)),
          const CustomHorizontalDivider(),
          8.ph,
          Expanded(
            child: ListView.builder(
              // padding: ,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const PackageFeatureItem(
                text: "خر تطورات الإدارة والعلوادر موثوقة وحديثة",
              ),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class PackageFeatureItem extends StatelessWidget {
  final String text;
  final double? areaHeight;
  const PackageFeatureItem({super.key, this.areaHeight, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: areaHeight ?? 40.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.iconsCheckMark),
          8.pw,
          Expanded(
            child: Text(
              text,
              style: MainTextStyle.mediumTextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
