// import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
// import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_body_list_item_widget.dart';
// import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

// class AllSubBodyList extends StatelessWidget {
//   final bool inProgress;
//   final String courseTitle;
//   const AllSubBodyList({
//     super.key,
//     required this.courseTitle,
//     required this.inProgress,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var cubit = context.read<SubscriptionmanagementCubit>();
//     return ListView.separated(
//       padding: EdgeInsets.symmetric(horizontal: 15.w),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) => AllBodyListItemWidget(
//         onTap: () {
//           Navigator.pushNamed(
//             arguments: {
//               "cubit": cubit,
//             },
//             context,
//             RoutePaths.subscriptionPackageDetails,
//           );
//         },
//         courseTitle: courseTitle,
//         inProgress: inProgress,
//         daysLeft: "4",
//         expireDate: "12/5/2000",
//         noOfStudents: "3",
//         onRenewTap: () {},
//         progressPercent: .20,
//         subscriptionPrice: "1400",
//       ),
//       separatorBuilder: (context, index) => 10.ph,
//       itemCount: 4,
//     );
//   }
// }
