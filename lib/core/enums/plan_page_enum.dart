import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

enum PlanPageEnum {
  selectPlan,
  filterPlan,
}

// Extension لتحويل String إلى Enum
extension PlanPageExtension on PlanPageEnum {
  static PlanPageEnum? fromString(String value) {
    return switch (value) {
      "filter_plan" => PlanPageEnum.filterPlan,
      "select_plan" => PlanPageEnum.selectPlan,
      _ => null,
    };
  }

  // تحويل Enum إلى Route
  String get route {
    return switch (this) {
      PlanPageEnum.filterPlan => RoutePaths.subscriptionPackageDetails,
      PlanPageEnum.selectPlan => RoutePaths.programDetailsView,
    };
  }
}
