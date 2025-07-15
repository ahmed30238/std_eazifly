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
  static const addNote = "order/add/note";
  static const getRemainingProgramSessions = "program/sessions/date";
  static const removeAssignedStudent = "remove/user/from/program";
  static const logout = "logout";
  static const requestToFindInstrcutor = "request/to/find/instructor";
  static String getLatestNotification(
          {required String type, required int offset}) =>
      "notifications?type=$type&offset=$offset";
  static String readNotification({required int notificationID}) =>
      "notifications/read/$notificationID";
  static String getMyChats({required String type}) => "get/chats?type=$type";
  static String updateProfile({required int userId}) =>
      "update/profile/$userId";
  static String getHomeCurrentSession({required int userId}) =>
      "home/current/session/$userId";
  static const getHomeLibrary = "library/category/with/items";
  static const updateFcmToken = "update/fcm";

  static String getHomeClosestSessions({required int userId}) =>
      "home/program/sessions/$userId";
  static String getUserSubscriptionData(
          {required int userId, required int programId}) =>
      "subscription/data?program_id=$programId&user_id=$userId";
  static const changeInstructor = "change/instructor";
  static String getOrderDetails({required int orderId}) =>
      "order/details/$orderId";
  static String getHomeQuizzes({required int userId}) =>
      "get/quizzes?user_id=$userId";
  static String getHomeAssignments({required int userId}) =>
      "program/assignment?user_id=$userId";
  static const createMeetingSession = "create/meeting/session";
  static const getChangeInstructorReasons = "reason/change/instructor";
  static const getInstructors = "get/program/availabilities-instructors";
  static const addWeeklyAppointments = "add/weekly/appointments";
  static const getFavouriteList = "favorite/list";
  static const getAllItems = "get/all/items";
  static const addSingleToFavList = "add/item/to/favorite/list";
  static const createNewChild = "store";
  static const getPlanSubscriptionPeriod = "plan/subscription/period";
  static const libraryOrderAndSubscription = "library/order";
  static const getMyPrograms = "my/programs";
  static const joinSession = "update/session/status";
  static const changeSessionStatus = "update/session/status";
  static const getProgramSubscriptions = "user/subscriptions";
  static const getLibrarySubscriptions = "library/subscription";
  static const renewOrder = "renew/order";
  static const upgradeOrder = "upgrade/order";
  static const getReasons = "reason/cancel/session?type=user";
  static const cancelSession = "cancel/session";
  static const checkChat = "check/chat";
  static String changeSessionDate({required int sessionId}) =>
      "change/session/date/$sessionId";
  static String getInstructorAvailablities(
          {required int duration, required int instructorId}) =>
      "session/availabilities/time/$instructorId?duration=$duration";
  static String cancelSubscription({required int mainId}) =>
      "cancel/subscription/$mainId";
  static String showPlan({required int planId}) => "plan/show/$planId";
  static String getMessages({required int chatId, required int offset}) =>
      "chat/get-message/?offset=$offset&chat_id=$chatId";
  static const sendMessages = "chat/send-message";
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
  static String completeChapterLesson({
    required int lessonId,
  }) =>
      "complete/lesson/$lessonId";
  static String getUserFeedbacks({
    required int userId,
  }) =>
      "feedback/$userId";
  static String getChapterLessons({
    required int chapterId,
  }) =>
      "get/chapter/lessons/$chapterId";
  static String getContentChapter({
    required int userId,
  }) =>
      "get/content/chapters/$userId";
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
  static String getProgramContent({required int programId}) =>
      "program/content/$programId";
  static const getAllLibraryLists = "all/list";
  static String getPlansWithDetails(
          {required int programId, required int days}) =>
      "program/plans/details/$programId?days=$days";
  static String getPlans({required int programId}) => "plans/$programId";
  static String getProgramPaymentMethods({required int programId}) =>
      "get/program/payment/method/$programId";
  static String getPaymentMethodDetails(
          {required int programId, required int methodId}) =>
      "show/payment/method/$programId/$methodId";
  static String getUserQuizzes({required int programId, required int userId}) =>
      "get/quizzes?user_id=$userId&program_id=$programId";
  static String getQuizQuestions({
    required int programId,
    required int userId,
    required int quizId,
  }) =>
      "get/quizzes/questions?user_id=$userId&program_id=$programId&quiz_id=$quizId";
  static const submitQuiz = "submit/quiz";
  static String getAssignmntDetails(
          {required int userId, required int assignmentId}) =>
      "show/assignment/$assignmentId?user_id=$userId";
  static const postAssignment = "upload/assignment";

  static String getReportQuestions({
    required String reportMakerType,
    required String reportForType,
    required int reportMakerId,
    required int reportForId,
    required int meetingSessionId,
  }) =>
      "report/questions?report_maker_type=$reportMakerType&report_for_type=$reportForType&report_maker_id=$reportMakerId&report_for_id=$reportForId&meeting_session_id=$meetingSessionId";

  static String deleteAccount({required int userId}) =>
      "delete/account/$userId";
}
