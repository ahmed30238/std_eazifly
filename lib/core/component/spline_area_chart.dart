import 'package:syncfusion_flutter_charts/charts.dart';

import '../../presentation/view/subscription_details_view/widgets/imports.dart';

class SplineAreaChart extends StatelessWidget {
  const SplineAreaChart({super.key, required this.splineAreaChartData});

  final List<SplieChartData> splineAreaChartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800.w,
      height: 300.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            height: 300.h,
            width: 800.w,
            child: Row(
              children: [
                Expanded(
                  child: SfCartesianChart(
                    // isTransposed: true,
                    primaryYAxis: const CategoryAxis(
                      isVisible: false,
                      // interval: 0,
                    ),
                    primaryXAxis: CategoryAxis(
                      isInversed: true,
                      labelStyle: MainTextStyle.mediumTextStyle(fontSize: 12),
                    ),
                    series: <CartesianSeries>[
                      SplineAreaSeries<SplieChartData, String>(
                        gradient: gradientColors,
                        dataSource: splineAreaChartData,
                        xValueMapper: (SplieChartData data, _) => data.x,
                        yValueMapper: (SplieChartData data, _) => data.y,
                        color: MainColors.success,
                        markerSettings: const MarkerSettings(
                          isVisible: true,
                          shape: DataMarkerType.circle,
                          color: MainColors.success,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

LinearGradient gradientColors = LinearGradient(
  colors: [MainColors.gradient, MainColors.background],
  // stops: stops,
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

class SplieChartData {
  SplieChartData(this.x, this.y);
  final String x;
  final double? y;
}

final List<SplieChartData> splineAreaChartData = <SplieChartData>[
  SplieChartData('يناير', 40),
  SplieChartData('فبراير', 15),
  SplieChartData('مارس', 20),
  SplieChartData('ابريل', 18),
  SplieChartData('مايو', 14),
  SplieChartData('يونيو', 14),
  SplieChartData('يوليو', 15),
  SplieChartData('اغسطس', 16),
  SplieChartData('سبتمبر', 17),
  SplieChartData('اكتوبر', 18),
  SplieChartData('نوفمبر', 19),
  SplieChartData('ديسمبر', 20),
];
