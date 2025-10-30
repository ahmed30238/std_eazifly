import 'package:eazifly_student/core/component/spline_area_chart.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/custom_list_tile.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatsArea extends StatelessWidget {
  const StatsArea({
    super.key,
    required this.chartData,
    required this.gradientColors,
  });

  final List<ChartData> chartData;
  final LinearGradient gradientColors;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h, right: 16.w, bottom: 8.h),
          child: Text(
            "مؤشر مستوي التقدم",
            style: MainTextStyle.mediumTextStyle(fontSize: 12),
          ),
        ),
        SplineAreaChart(splineAreaChartData: splineAreaChartData),
        36.ph,
        const CustomListTile(
          icon: Assets.iconsProfile,
          subTitle: "52 % من الإجمالي",
          title: "الإختبار 6",
          trailingText: "16 إختبار",
        ),
        8.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: LinearPercentIndicator(
            width: 340.w,
            lineHeight: 6.0.w,
            percent: 0.52,
            backgroundColor: MainColors.surfaceVariant,
            isRTL: true,
            progressColor: MainColors.primary,
            alignment: MainAxisAlignment.start,
            barRadius: Radius.circular(10.r),
          ),
        ),
        32.ph,
      ],
    );
  }
}

final List<ChartData> chartData = [
  ChartData(2010, 35),
  ChartData(2011, 28),
  ChartData(2012, 34),
  ChartData(2013, 32),
  ChartData(2014, 40),
];

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}
