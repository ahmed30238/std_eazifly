import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_data_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Widget buildLectureDataWithLoading(String host) {
  // var programData = cubit.getAssignedChildrenToProgramEntity?.data?[index];

  // if (programData == null) {
  //   return buildLoadingContainer(width: 79.w, height: 80.h);
  // }

  return LectureData(host: host);
}
