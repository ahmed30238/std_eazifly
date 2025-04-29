import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class TimlineItem extends StatelessWidget {
  final Widget child;
  final Widget? indicator;
  final bool isFirst;
  final bool isLast;
  // final int index;

  const TimlineItem({
    super.key,
    this.isFirst = false,
    this.indicator,
    this.isLast = false,
    // required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        indicatorXY: .3,
        width: 32.w,
        height: 32.h,
        padding: EdgeInsets.symmetric(vertical: 2.h),
        color: MainColors.timeLineColor,
        indicator: indicator,
      ),
      lineXY: .1,
      alignment: TimelineAlign.manual,
      afterLineStyle:
          const LineStyle(thickness: 2, color: MainColors.timeLineColor),
      beforeLineStyle:
          const LineStyle(thickness: 2, color: MainColors.timeLineColor),
      endChild: child,
    );
  }
}
