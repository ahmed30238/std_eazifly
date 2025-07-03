 import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/build_loading_container.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_data_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

  Widget buildLectureDataWithLoading(LectureCubit cubit, LectureState state) {
    var programData = cubit.showProgramDetailsEntity?.data;

    if (programData == null) {
      return buildLoadingContainer(width: 79.w, height: 80.h);
    }

    return LectureData(
      host: programData.host ?? "غير محدد",
    );
  }