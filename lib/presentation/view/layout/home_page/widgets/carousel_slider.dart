import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return CarouselSlider(
      carouselController: cubit.carouselSliderController,
      items: List.generate(
        4,
        (index) => AvatarImage(
          radius: 16.r,
          // image: Assets.imagesPersona,
        ),
      ),
      options: CarouselOptions(
        aspectRatio: 1,
        enlargeFactor: .8,
        pageSnapping: true,
        autoPlayCurve: Curves.easeInOut,
        height: 171.h,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enlargeCenterPage: true,
        disableCenter: true,
        onPageChanged: (index, reason) {},
        onScrolled: (value) {},
        viewportFraction: .95,
        // autoPlay: true,
        // padEnds: true,
      ),
    );
  }
}
