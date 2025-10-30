import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Widget buildLoadingContainer({double? width, double? height}) {
  return Container(
    width: width,
    height: height,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Center(child: CircularProgressIndicator()),
  );
}
