import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_body_list_item_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AllSubBodyList extends StatelessWidget {
  final bool inProgress;
  final String courseTitle;
  const AllSubBodyList({
    super.key,
    required this.courseTitle,
    required this.inProgress,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          RoutePaths.subscriptionPackageDetails,
        ),
        child: AllBodyListItemWidget(
          courseTitle: courseTitle,
          inProgress: inProgress,
        ),
      ),
      separatorBuilder: (context, index) => 10.ph,
      itemCount: 4,
    );
  }
}
