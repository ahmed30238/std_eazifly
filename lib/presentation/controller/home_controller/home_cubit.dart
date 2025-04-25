import 'package:carousel_slider/carousel_controller.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  CarouselSliderController carouselSliderController =
      CarouselSliderController();
      // (){carouselSliderController.animateToPage()}
}
