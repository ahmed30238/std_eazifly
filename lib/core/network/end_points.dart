class EndPoints {
  EndPoints._();
  static const login = "login";
  static const getPrograms = "programs";
  static const assignProgramReview = "add/program/review";
  static const filterPlan = "program/plan";
  static const createOrder = "create/order";
  static const checkCopoun = "check-coupon";
  static const getUserOrders = "orders";
  static const storeFavouriteList = "store/favorite/list";
  static const getFavouriteList = "favorite/list";
  static String getFavouriteListItemsUsingListId({required int listId}) =>
      "favorite/list/items/$listId";
  static String getLibraryCategories({String? type}) => type != null
      ? "get/library/categories?type=$type"
      : "get/library/categories";
  static String getProgramDetails({required int programId}) =>
      "program/details/$programId";
  static const getAllLibraryLists = "all/list";
  static String getPlansWithDetails({required int planId}) =>
      "program/plans/details/$planId";
  static String getPlans({required int programId}) => "plans/$programId";
  static String getProgramPaymentMethods({required int programId}) =>
      "get/program/payment/method/$programId";
  static String getPaymentMethodDetails(
          {required int programId, required int methodId}) =>
      "show/payment/method/$programId/$methodId";
}
