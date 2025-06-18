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
  static const getAllItems = "get/all/items";
  static const addSingleToFavList = "add/item/to/favorite/list";
  static const createNewChild = "store";
  static const getPlanSubscriptionPeriod = "plan/subscription/period";
  static const libraryOrderAndSubscription = "library/order";
  static const getMyPrograms = "my/programs";
  static const joinSession = "update/session/status";
  static const changeSessionStatus = "update/session/status";
  // static const changeSessionStatus = "program/assignment/1?user_id=3";
  static String getAssignedChildrenToProgram({required int programId}) =>
      "get/assigned/children/in/program/$programId";
  static String showProgramDetails({required int programId}) =>
      "program/details/$programId";
  static String getProgramSessions({
    required int programId,
    required int userId,
  }) =>
      "get/program/sessions/$programId?user_id=$userId";
  static String getUserReports({
    required int userId,
  }) =>
      "get/user/reports/$userId";
  static String getProgramAssignments({
    required int programId,
    required int userId,
  }) =>
      "program/assignment/$programId?user_id=$userId";
  static String getSessionDetails({required int sessionId}) =>
      "get/session/details/$sessionId";
  static String getLibraryPlans({required int days}) =>
      "library/plan?days=$days";
  static String showLibraryItem({required int itemId}) =>
      "show/library/item/$itemId";
  static String getMyChildren({required bool childrensStatus}) =>
      "children/users?childrens=$childrensStatus";
  static String likeItem({required int itemId, required bool status}) =>
      "item/like/$itemId?status=$status";
  static String getListItemsUsingListId({required int listId}) =>
      "list/item/$listId";
  static String getFavouriteListItemsUsingListId({required int listId}) =>
      "favorite/list/items/$listId";
  static String getLibraryCategories({String? type}) => type != null
      ? "get/library/categories?type=$type"
      : "get/library/categories";
  static String getProgramDetails({required int programId}) =>
      "program/details/$programId";
  static const getAllLibraryLists = "all/list";
  static String getPlansWithDetails(
          {required int programId, required int days}) =>
      "program/plans/details/$programId?day=$days";
  static String getPlans({required int programId}) => "plans/$programId";
  static String getProgramPaymentMethods({required int programId}) =>
      "get/program/payment/method/$programId";
  static String getPaymentMethodDetails(
          {required int programId, required int methodId}) =>
      "show/payment/method/$programId/$methodId";
}
