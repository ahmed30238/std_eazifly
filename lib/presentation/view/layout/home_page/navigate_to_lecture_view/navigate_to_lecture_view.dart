import 'package:eazifly_student/core/component/nested_avatar_container.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigateToLectureView extends StatefulWidget {
  final int sessionId;
  const NavigateToLectureView({
    super.key,
    required this.sessionId,
  });

  @override
  State<NavigateToLectureView> createState() => _NavigateToLectureViewState();
}

class _NavigateToLectureViewState extends State<NavigateToLectureView> {
  late MyProgramsCubit cubit;
  @override
  void initState() {
    cubit = context.read<MyProgramsCubit>();
    super.initState();
    cubit.getSessionDetails(sessionId: widget.sessionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.w),
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            String title =
                cubit.getSessionDetailsEntity?.data?.programTitle ?? "";
            return CustomAppBar(
              context,
              mainTitle: title,
              leadingText: "المواعيد",
              isCenterTitle: true,
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                String title =
                    cubit.getSessionDetailsEntity?.data?.programTitle ?? "";
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 78.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: 12.cr,
                    color: MainColors.inputFill,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: SizedBox(
                      width: 216.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "إسم البرنامج",
                            style: MainTextStyle.boldTextStyle(
                                fontSize: 11, color: MainColors.onSurfaceSecondary),
                          ),
                          10.5.ph,
                          Text(
                            title,
                            style: MainTextStyle.boldTextStyle(
                                fontSize: 12, color: MainColors.onSecondary),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            8.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                var item = cubit.getSessionDetailsEntity?.data;
                return LectureStats(
                  horizontalPadding: 0,
                  status: item?.status == "started"
                      ? LectureStatesEnum.ongoing
                      : item?.status == "finished"
                          ? LectureStatesEnum.finished
                          : LectureStatesEnum.dated,
                  reJoin: item?.status == "started",
                  onRejoinTap: () {
                    // كود إعادة الدخول
                  },
                  // nextLecture: nextLec, // الوقت المنسق من الدالة السابقة
                  duration: "${item?.duration} دقيقة",
                  // timeDiff: formattedTimeDiff, // الوقت المنسق من الدالة السابقة
                  titleText: const [
                    "المحاضرة التالية",
                    "مدة الجلسة",
                    "حالة الجلسة"
                  ], // اختياري
                );
              },
            ),
            8.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: index == 1 ? 7.w : 0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: index == 2 ? 12.w : 0,
                      ),
                      height: 78.h,
                      width: 109.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: MainColors.inputFill,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: index == 2
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          Text(
                            stdTitleList[index],
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 12,
                              color: MainColors.onSurfaceSecondary,
                            ),
                          ),
                          index == 0
                              ? NestedAvatarContainer(
                                noOfItems: 0,
                                  alignment: MainAxisAlignment.center,
                                  image: [
                                  ],
                                  number: "9",
                                  textColors: MainColors.onSecondary,
                                  areaHeigt: 26.h,
                                  areaWidth: 52.w,
                                  avatarHeigt: 24.h,
                                  avatarWidth: 24.w,
                                )
                              : index == 1
                                  ? Text(
                                      "عبر تطبيق زوم",
                                      style: MainTextStyle.boldTextStyle(
                                        fontSize: 12,
                                        color: MainColors.onSecondary,
                                      ),
                                    )
                                  : Text(
                                      "Zoom Link",
                                      style: GoogleFonts.inter(
                                          color: MainColors.primary,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              MainColors.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            24.ph,
            Row(
              children: [
                SvgPicture.asset(
                  height: 24.h,
                  width: 24.w,
                  Assets.iconsRejectRequest,
                  fit: BoxFit.scaleDown,
                ),
                4.pw,
                Expanded(
                  child: Text(
                    "انت متاخر  علي المحاضرة قم بالتوجة الي المحاضرة بالضغط علي الرابط المرفق",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onError,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                CustomElevatedButton(
                  height: 48.h,
                  width: 197.w,
                  color: MainColors.primary,
                  radius: 16.r,
                  text: "التوجهة الي المحاضرة",
                  onPressed: () {},
                ),
                8.pw,
                CustomElevatedButton(
                  height: 45.h,
                  width: 138.w,
                  color: MainColors.background,
                  textColor: MainColors.primary,
                  borderColor: MainColors.primary,
                  radius: 16.r,
                  text: "تواصل مع المعلم",
                  textSize: 14,
                  onPressed: () {},
                ),
              ],
            ),
            32.ph,
          ],
        ),
      ),
    );
  }
}

var stdTitleList = ["الطلاب الاخرين", "بينات المحاضرة", "الرابط"];
