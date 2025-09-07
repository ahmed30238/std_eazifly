import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureViewLoader extends StatelessWidget {
  const LectureViewLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.ph,
            // LectureStates Loader
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                      (index) => Container(
                    height: 80.h,
                    width: 108.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: MainColors.inputFill,
                    ),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            titleText[index],
                            textAlign: TextAlign.center,
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 12.sp,
                              color: MainColors.onSurfaceSecondary,
                            ),
                          ),
                          ShimmerContainer(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            24.ph,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    width: 160.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: MainColors.inputFill,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "بيانات المحاضرة",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12.sp,
                            color: MainColors.onSurfaceSecondary,
                          ),
                        ),
                        8.ph,
                        ShimmerContainer(
                          height: 10.h,
                          width: 90.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    width: 160.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: MainColors.inputFill,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "الرابط",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12.sp,
                            color: MainColors.onSurfaceSecondary,
                          ),
                        ),
                        8.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ShimmerContainer(
                              width: 60.w,
                              height: 10.h,
                            ),
                            ShimmerContainer(
                              width: 60.w,
                              height: 10.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            8.ph,

            // Program Goals Section
            Container(
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: MainColors.inputFill,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "أهداف البرنامج",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12.sp,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                  8.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "نسبة الإنجاز",
                        style: MainTextStyle.boldTextStyle(fontSize: 11.sp),
                      ),
                      ShimmerContainer(width: 60.w, height: 16.h),
                    ],
                  ),
                  8.ph,
                  ShimmerContainer(
                    width: double.infinity,
                    height: 8.h,
                  ),
                ],
              ),
            ),
            20.ph,

            // Student Name Section
            Material(
              elevation: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                  color: MainColors.inputFill,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      Assets.iconsArrowRight,
                      width: 24.w,
                      height: 24.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "اسم الطالب",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 11.sp,
                            color: MainColors.onSurfaceSecondary,
                          ),
                        ),
                        4.ph,
                        ShimmerContainer(width: 100.w, height: 16.h),
                      ],
                    ),
                    SvgPicture.asset(
                      Assets.iconsArrowLeft,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ),
            8.ph,

            // Tab bar loader
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: ShimmerContainer(height: 40.h, width: double.infinity),
            ),
            8.ph,

            // Lectures List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: MainColors.inputFill,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "تاريخ المحاضرة",
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 11.sp,
                                color: MainColors.onSurfaceSecondary,
                              ),
                            ),
                            8.ph,
                            ShimmerContainer(width: 80.w, height: 16.h),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "وقت المحاضرة",
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 11.sp,
                                color: MainColors.onSurfaceSecondary,
                              ),
                            ),
                            8.ph,
                            ShimmerContainer(width: 80.w, height: 16.h),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      ShimmerContainer(width: 40.w, height: 40.h),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemCount: 3,
            ),
            20.ph,
          ],
        ),
      ),
    );
  }
}

var titleText = ["المحاضرة التالية", "مدة الجلسة", "حالة الجلسة"];

class ShimmerContainer extends StatelessWidget {
  final double? height;
  final double? width;

  const ShimmerContainer({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.r),
      ),
      height: height ?? 10.h,
      width: width,
      child: const ShimmerWidget(),
    );
  }
}