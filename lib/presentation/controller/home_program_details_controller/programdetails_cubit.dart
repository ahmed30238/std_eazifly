import 'package:eazifly_student/presentation/controller/home_program_details_controller/programdetails_state.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/widgets/lecturer_data_tab.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/widgets/previous_reviews.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/widgets/program_details_tab.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/widgets/program_feature_tab.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramDetailsCubit extends Cubit<ProgramdetailsState> {
  ProgramDetailsCubit() : super(ProgramdetailsInitial());
  static ProgramDetailsCubit get(context) => BlocProvider.of(context);

  late TabController controller;
  void initController(TickerProvider vsync) {
    controller = TabController(length: tabs.length, vsync: vsync)
      ..addListener(
        () {
          if (controller.indexIsChanging) {
            emit(TabIndexState());
          }
        },
      );
  }

  List<Widget> screens = [
    ProgramDetailsTap(),
    ProgramFeatureTab(),
    PreviousReviewsTab(),
    LecturerDataTab(),
  ];
  var tabs = [
    "تفاصيل البرنامج",
    "مزايا البرنامج",
    "تقييمات سابقة",
    "بيانات المعلم",
  ];
}
