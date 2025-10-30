import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StepProgressView extends StatelessWidget {
  final double _width;
  final List<String> _icons;
  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = Colors.grey.shade300;
  final double liidth = 8.h;
  StepProgressView({
    required Key key,
    required List<String> icons,
    required int curStep,
    List<String>? titles,
    required double width,
    required Color color,
  }) : _icons = icons,
       _titles = titles ?? [],
       _curStep = curStep,
       _width = width,
       _activeColor = color,
       assert(curStep > 0 == true && curStep <= icons.length),
       assert(width > 0),
       super(key: key);
  @override
  Widget build(BuildContext context) {
    int curStep = _curStep;
    List<Widget> iconViews() {
      List<Widget> list = <Widget>[];
      _icons.asMap().forEach((i, icon) {
        //colors according to state
        var circleColor = (i == 0 || curStep > i + 1)
            ? _activeColor
            : _inactiveColor;

        var lineColor = curStep > i + 1 ? _activeColor : _inactiveColor;
        var beforeLineColor = curStep > i ? _activeColor : _inactiveColor;

        var iconColor = (i == 0 || curStep > i + 1)
            ? _inactiveColor
            : _activeColor;

        if (i != _icons.length - 1) {
          list.add(
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  borderRadius: i != _icons.length - 1
                      ? BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        )
                      : null,
                  color: beforeLineColor,
                ),
                height: liidth,
              ),
            ),
          );
        }
        list.add(
          //dot with icon view
          Container(
            width: 32.0.w,
            height: 32.0.h,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor,
              // borderRadius: 25.cr,
              // border: Border.all(
              //   color: _activeColor,
              //   width: 2.0.w,
              // ),
            ),
            child: SvgPicture.asset(
              fit: BoxFit.scaleDown,
              icon,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              height: 15.h,
              width: 15.w,
            ),
          ),
        );
        //  if (i != _icons.length - 1) {
        list.add(
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: i == _icons.length - 1
                    ? BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
                      )
                    : null,
                color: lineColor,
              ),
              height: liidth,
            ),
          ),
        );
        // }

        //line between icons
      });

      return list;
    }

    List<Widget> titleViews() {
      var list = <Widget>[];
      _titles.asMap().forEach((i, text) {
        list.add(
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              text,
              style: MainTextStyle.boldTextStyle(
                fontSize: 11,
                color: _activeColor,
              ),
            ),
          ),
        );
      });
      return list;
    }

    return SizedBox(
      // padding: EdgeInsets.only(
      //   top: 32.0.h,
      //   left: 24.0.w,
      //   right: 24.0.w,
      // ),
      width: _width,
      child: Column(
        children: [
          Row(children: iconViews()),
          4.ph,
          if (_titles.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: titleViews(),
            ),
        ],
      ),
    );
  }
}
