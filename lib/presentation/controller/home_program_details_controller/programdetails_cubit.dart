import 'package:eazifly_student/domain/entities/get_program_details_entities.dart';
import 'package:eazifly_student/domain/use_cases/get_program_details_usecase.dart';
import 'package:eazifly_student/presentation/controller/home_program_details_controller/programdetails_state.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/widgets/lecturer_data_tab.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/widgets/previous_reviews.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/widgets/program_details_tab.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/widgets/program_feature_tab.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramDetailsCubit extends Cubit<ProgramdetailsState> {
  ProgramDetailsCubit({
    required this.getProgramDetailsUsecase,
  }) : super(ProgramdetailsInitial());
  
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
  
  List<Widget> screens() {
    // التحقق من وجود البيانات قبل إنشاء الشاشات
    final programData = getProgramDetailsEntity?.data;
    
    if (programData == null) {
      // إرجاع شاشات فارغة أو loading widgets
      return List.generate(
        tabs.length, 
        (index) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    List<Widget> screens = [
      ProgramDetailsTap(
        programEntity: programData,
      ),
      ProgramFeatureTab(
        programEntity: programData,
      ),
      PreviousReviewsTab(
        programEntity: programData,
      ),
      LecturerDataTab(
        programEntity: programData,
      ),
    ];
    return screens;
  }
  
  var tabs = [
    "تفاصيل البرنامج",
    "مزايا البرنامج", 
    "تقييمات سابقة",
    "بيانات المعلم",
  ];
  
  bool getProgramDetailsLoading = false;
  GetProgramDetailsEntity? getProgramDetailsEntity;
  GetProgramDetailsUsecase getProgramDetailsUsecase;
  
  Future<void> getProgramDetails({required int programId}) async {
    getProgramDetailsLoading = true;
    emit(GetProgramDetailsLoadingState());
    
    final result = await getProgramDetailsUsecase.call(
      parameter: ProgramDetailsParameters(
        programId: programId,
      ),
    );
    
    result.fold(
      (l) {
        getProgramDetailsLoading = false;
        emit(GetProgramDetailsErrorState(errorMessage: l.message));
      },
      (r) {
        getProgramDetailsLoading = false;
        getProgramDetailsEntity = r;
        emit(GetProgramDetailsSuccessState());
      },
    );
  }
}