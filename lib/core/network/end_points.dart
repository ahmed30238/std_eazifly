class EndPoints {
  EndPoints._();
  static const login = "login";
  static const getPrograms = "programs";
  static const assignProgramReview = "add/program/review";
  static const filterPlan = "program/plan";
  static const createOrder = "create/order";
  static const checkCopoun = "check-coupon";
  static String getProgramDetails({required int programId}) =>
      "program/details/$programId";
  static String getPlansWithDetails({required int planId}) =>
      "program/plans/details/$planId";
  static String getPlans({required int programId}) => "plans/$programId";
}
