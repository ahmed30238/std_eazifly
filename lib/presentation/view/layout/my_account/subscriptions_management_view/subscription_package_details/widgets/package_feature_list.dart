import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PackageFeatureList extends StatelessWidget {
  const PackageFeatureList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 288.h,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        separatorBuilder: (context, index) => 8.ph,
        itemBuilder: (context, index) => PackageFeatureItem(
          text: "خر تطورات الإدارة والعلوم والتكنولوجيا من مصادر موثوقة وحديثة",
          areaHeight: 48.h,
        ),
        itemCount: 5,
      ),
    );
  }
}