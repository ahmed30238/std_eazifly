import 'dart:developer';

import 'package:eazifly_student/core/component/nested_avatar_container.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/subscribed_students_settings_view/widgets/student_data_item.dart';
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
          // Program Name Container with Loader
          BlocBuilder(
            bloc: lectureCubit,
            builder: (context, state) {
              if (lectureCubit.showProgramDetailsLoader) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 78.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: 12.cr,
                    color: MainColors.veryLightGrayFormField,
                  ),
                  child:  Center(
                    child: CircularProgressIndicator(
                      color: MainColors.blueTextColor,
                    ),
                  ),
                );
              }

              return Container(
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
                      children: [
                        Text(
                          "إسم البرنامج",
                          style: MainTextStyle.boldTextStyle(
                              fontSize: 11, color: MainColors.grayTextColors),
                        ),
                        10.5.ph,
                        Text(
                          lectureCubit.showProgramDetailsEntity?.data?.title ??
                              "",
                          style: MainTextStyle.boldTextStyle(
                              fontSize: 12, color: MainColors.blackText),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          8.ph,
          // Student Count Container with Loader
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
                          if (myProgramsCubit.getAssignedChildrenLoader) {
                            return Expanded(
                              child: Center(
                                child: SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child:  CircularProgressIndicator(
                                    color: MainColors.blueTextColor,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            );
                          }

                          var studentImages = myProgramsCubit
                              .students
                              .map((e) => e.image ?? '')
                              .toList();
                          int studentCount = myProgramsCubit
                                  .getAssignedChildrenToProgramEntity
                                  ?.data
                                  ?.length ??
                              0;
                          String show = studentCount > 1 ? "طلاب" : "طالب";
                          return NestedAvatarContainer(
                            image: studentImages.cast<String>(),
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
          // Students List with Loader
          BlocBuilder(
            bloc: myProgramsCubit,
            builder: (context, state) {
              if (myProgramsCubit.getAssignedChildrenLoader) {
                return SizedBox(
                  height: 200.h,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         CircularProgressIndicator(
                          color: MainColors.blueTextColor,
                        ),
                        16.ph,
                        Text(
                          "جاري تحميل بيانات الطلاب...",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.grayTextColors,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (state is GetAssignedChildrenErrorState) {
                return SizedBox(
                  height: 200.h,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 48.h,
                        ),
                        16.ph,
                        Text(
                          "حدث خطأ في تحميل البيانات",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                        8.ph,
                        InkWell(
                          onTap: () {
                            myProgramsCubit.getAssignedChildrenToProgram(
                              programId: programId,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: 8.cr,
                              color: MainColors.blueTextColor,
                            ),
                            child: Text(
                              "إعادة المحاولة",
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 12,
                                color: MainColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              var students = myProgramsCubit.students;

              if (students.isEmpty) {
                return SizedBox(
                  height: 200.h,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: MainColors.grayTextColors,
                          size: 48.h,
                        ),
                        16.ph,
                        Text(
                          "لا يوجد طلاب مضافين للبرنامج",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.grayTextColors,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
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
                    return StudentDataItem(
                      student: student,
                      programId: programId,
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
}
