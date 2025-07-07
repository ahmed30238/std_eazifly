import 'dart:developer';

import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/nested_avatar_container.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SubscribedStudentsSettingsView extends StatefulWidget {
  const SubscribedStudentsSettingsView({super.key});

  @override
  State<SubscribedStudentsSettingsView> createState() =>
      _SubscribedStudentsSettingsViewState();
}

class _SubscribedStudentsSettingsViewState
    extends State<SubscribedStudentsSettingsView> {
  late int programId;
  late LectureCubit lectureCubit;
  late MyProgramsCubit myProgramsCubit;

  @override
  void initState() {
    lectureCubit = context.read<LectureCubit>();
    myProgramsCubit = context.read<MyProgramsCubit>();
    programId = context.read<LectureCubit>().currentProgramId;
    log("$programId");

    myProgramsCubit.getAssignedChildrenToProgram(programId: programId);
    lectureCubit.showProgramDetails(programId: programId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "إعداد بيانات برنامج",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          16.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 78.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
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
                          fontSize: 11, color: MainColors.grayTextColors),
                    ),
                    10.5.ph,
                    Text(
                      lectureCubit.showProgramDetailsEntity?.data?.title ?? "",
                      style: MainTextStyle.boldTextStyle(
                          fontSize: 12, color: MainColors.blackText),
                    ),
                  ],
                ),
              ),
            ),
          ),
          8.ph,
          SizedBox(
            height: 78.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: 16.cr,
                    color: MainColors.veryLightGrayFormField,
                  ),
                  height: 78.h,
                  width: 176.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "عدد الطلاب المضافين",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.grayTextColors,
                        ),
                      ),
                      BlocBuilder(
                        bloc: myProgramsCubit,
                        builder: (context, state) {
                          var studentImages = myProgramsCubit
                              .getAssignedChildrenToProgramEntity?.data
                              ?.map((e) => e.image ?? '')
                              .toList();
                          int studentCount = myProgramsCubit
                                  .getAssignedChildrenToProgramEntity
                                  ?.data
                                  ?.length ??
                              0;
                          String show = studentCount > 1 ? "طلاب" : "طالب";
                          return NestedAvatarContainer(
                            image: studentImages ?? [],
                            number: "$studentCount $show",
                            avatarWidth: 24.w,
                            noOfItems: studentCount,
                            areaWidth: studentCount < 4 ? 40.w : 68.w,
                            areaHeigt: 26.h,
                            avatarHeigt: 24.h,
                            textColors: MainColors.blackText,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                21.pw,
                CustomLowSizeButton(
                  height: 29.h,
                  width: 133.w,
                  text: "إضافة طالب",
                  textColor: MainColors.white,
                  btnColor: MainColors.blueTextColor,
                  borderRadius: 16.cr,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.addNewStudentData,
                    );
                  },
                ),
              ],
            ),
          ),
          28.ph,
          BlocBuilder(
            bloc: myProgramsCubit,
            builder: (context, state) {
              var students =
                  myProgramsCubit.getAssignedChildrenToProgramEntity?.data;
              if (students == null) {
                return const Text("null");
              }
              return SizedBox(
                height: 145.h * students.length + 16.h * 6,
                child: ListView.separated(
                  padding: EdgeInsets.only(
                    right: 8.w,
                    left: 8.w,
                    top: 12.h,
                    bottom: 12.h,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var student = students[index];
                    return Container(
                    height: 145.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      borderRadius: 12.cr,
                      color: MainColors.veryLightGrayFormField,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //! image
                            AvatarImage(
                              shape: BoxShape.circle,
                              imageUrl: student.image,
                              height: 45.h,
                              width: 45.w,
                            ),
                            8.pw,
                            //! name and age
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${student.firstName} ${student.lastName}",
                                  style:
                                      MainTextStyle.boldTextStyle(fontSize: 14),
                                ),
                                8.ph,
                                Text(
                                  "${student.age} عام",
                                  style: MainTextStyle.boldTextStyle(
                                    fontSize: 12,
                                    color: MainColors.grayTextColors,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                studentMoreBottomSheet(context);
                              },
                              child: SvgPicture.asset(
                                Assets.iconsHorizontalDots,
                              ),
                            ),
                          ],
                        ),
                        8.ph,
                        const CustomHorizontalDivider(),
                        8.ph,
                        Row(
                          children: [
                            SizedBox(
                              width: 127.5.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "رقم التواصل",
                                    style: MainTextStyle.boldTextStyle(
                                      fontSize: 12,
                                      color: MainColors.grayTextColors,
                                    ),
                                  ),
                                  8.ph,
                                  Text(
                                    "01030837974",
                                    style: MainTextStyle.boldTextStyle(
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            32.pw,
                            SizedBox(
                              width: 127.5.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "المعلم",
                                    style: MainTextStyle.boldTextStyle(
                                      fontSize: 12,
                                      color: MainColors.grayTextColors,
                                    ),
                                  ),
                                  8.ph,
                                  Text(
                                    "احمد سلامة",
                                    style: MainTextStyle.boldTextStyle(
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                  },
                  separatorBuilder: (context, index) => 16.ph,
                  itemCount: students.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> studentMoreBottomSheet(BuildContext context) {
    return showModalSheet(
      minHeight: 260.h,
      maxHeight: 261.h,
      isFixedSize: true,
      context,
      widget: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 260.h,
        width: 375.w,
        decoration: BoxDecoration(
          borderRadius: 12.cr,
          color: MainColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.ph,
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.lectureView,
                  arguments: {
                    "programId": programId,
                  },
                );
              },
              child: SizedBox(
                height: 45.h,
                child: Text(
                  "عرض باقي البيانات",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 45.h,
                child: Text(
                  "تعديل بيانات الطالب",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 45.h,
                child: Text(
                  "حذف الطالب",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.lectureHistoryView,
                );
              },
              child: SizedBox(
                height: 45.h,
                child: Text(
                  "تاريخ المحاضرات ",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SvgPicture.asset(MyImages.iconsProfile),
            //     8.pw,
            //     Text(
            //       "تعديل",
            //       style:
            //           MainTextStyle.boldTextStyle(fontSize: 14),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
