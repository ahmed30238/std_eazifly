import 'package:eazifly_student/core/component/hexagon.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PlacesWidget extends StatelessWidget {
  final double width;
  final double height;
  // final String board;
  final String medal;
  final String avatar;
  const PlacesWidget({
    super.key,
    required this.width,
    required this.height,
    required this.avatar,
    required this.medal,
    // required this.board,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + 15.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipBehavior: Clip.antiAlias,
            clipper: HexaGon(),
            child: Container(
              clipBehavior: Clip.antiAlias,
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    avatar,
                  ),
                ),
              ),
            ),
          ),
          // Image.asset(
          //   avatar,
          //   height: height,
          //   width: width,
          // ),
          Positioned(bottom: 0, child: SvgPicture.asset(medal)),
        ],
      ),
    );
  }
}
