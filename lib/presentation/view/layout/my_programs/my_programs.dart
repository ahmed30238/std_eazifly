import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/my_programs_loder.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/program_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';

class MyProgramsView extends StatefulWidget {
  const MyProgramsView({super.key});

  @override
  State<MyProgramsView> createState() => _MyProgramsViewState();
}

class _MyProgramsViewState extends State<MyProgramsView> {
  late MyProgramsCubit cubit;
  late DataModel loginData;
  @override
  void initState() {
    loginData = DataModel.fromJson(
      jsonDecode(GetStorage().read(StorageEnum.loginModel.name)),
    );
    cubit = context.read<MyProgramsCubit>();
    cubit.getMyPrograms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.myPrograms,
        leadingText: "",
        leadingCustomWidth: 10.w,
        customAction: [
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              RoutePaths.programsUnderReviewView,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: SvgPicture.asset(Assets.iconsMyProgramAppbar),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          16.ph,
          CustomTextFormField(
            prefixIconWidget: const PrefixSearchFormField(),
            controller: TextEditingController(),
            hintText: lang.search,
            suffixIconWidget: const SuffixMenuFormField(),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (cubit.getMyProgramsLoader) {
                // Show loader while data is loading
                return const MyProgramsLoader();
              } else if (!cubit.getMyProgramsLoader) {
                // Show content when data is loaded
                var myPrograms = cubit.getMyProgramsEntity?.data;

                if (myPrograms == null || myPrograms.isEmpty) {
                  return const Center(
                    child: Text("No programs available"),
                  );
                }

                // تحديث كود ListView.separated
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = myPrograms[index];
                    bool started = item.currentSession?.status == "started";

                    String nextLec = "";
                    String formattedTimeDiff = "";

                    // إصلاح منطق تحديد nextLec مع تحويل لصيغة 12 ساعة
                    if (item.currentSession?.status != null) {
                      // إذا كان هناك جلسة حالية، استخدم بيانات الجلسة التالية
                      if (item.nextSession != null) {
                        int hour = item.nextSession!.hour;
                        int minute = item.nextSession!.minute;
                        nextLec = convertTo12HourFormat(hour, minute);

                        // تنسيق الوقت المتبقي
                        formattedTimeDiff =
                            formatTimeDifference(item.nextSession);
                      } else {
                        nextLec = "بدأت بالفعل";
                        formattedTimeDiff = "جارية الآن";
                      }
                    } else {
                      // إذا لم تبدأ بعد، استخدم تاريخ البداية
                      if (item.nextSession != null) {
                        int hour = item.nextSession!.hour;
                        int minute = item.nextSession!.minute;
                        nextLec = convertTo12HourFormat(hour, minute);

                        // تنسيق الوقت المتبقي
                        formattedTimeDiff =
                            formatTimeDifference(item.nextSession);
                      } else {
                        nextLec = "غير محدد";
                        formattedTimeDiff = "غير محدد";
                      }
                    }

                    return ProgramItem(
                      desc: item.description ?? "no desc",
                      duration: item.duration ?? "5",
                      image: item.image ?? "",
                      nextLec: nextLec,
                      status: item.currentSession?.status ?? "tt",
                      title: item.title ?? "",
                      isRejoin: started,
                      timeDiff: formattedTimeDiff, // استخدام الوقت المنسق
                      onRejoinTap: () async {
                        await cubit.joinSession(
                          sessionId: item.currentSession?.id ?? -1,
                        );
                        Navigator.pushNamed(
                          context,
                          arguments: {
                            "cubit": cubit,
                            "sessionId": item.currentSession?.id ?? -1,
                          },
                          RoutePaths.navigateToLectureView,
                        );
                      },
                      onTap: () {
                        if (item.currentSession?.status != null) {
                          if (item.currentSession?.status == "started") {
                            Navigator.pushNamed(
                              context,
                              arguments: {
                                "cubit": cubit,
                                "sessionId": item.currentSession?.id ?? -1,
                              },
                              RoutePaths.navigateToLectureView,
                            );
                          } else if (item.currentSession?.status !=
                              "started" /*TODO this is parent account */) {
                            log("modal Sheet");
                          } else {
                            log("details screen direct");
                          }
                        } else {
                          Navigator.pushNamed(
                              context,
                              arguments: {
                                "cubit": cubit,
                                "sessionId": item.currentSession?.id ?? -1,
                              },
                              RoutePaths.navigateToLectureView,
                            );
                          // Navigator.pushNamed(
                          //   context,
                          //   RoutePaths.lectureView,
                          //   arguments: false,
                          // );
                        }

                        // ?
                        // : print("rwerwer");
                      },
                    );
                  },
                  separatorBuilder: (context, index) => 20.ph,
                  itemCount: myPrograms.length,
                );
              } else if (state is GetMyProgramsErrorState) {
                // Show error message if something went wrong
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                // Default case
                return const SizedBox();
              }
            },
          ),
          // ProgramItem(
          //   onTap: () =>
          // ),
          20.ph,
          // InkWell(
          //   onTap: () => Navigator.pushNamed(
          //     context,
          //     RoutePaths.selectionOfEducationalCoursesView,
          //   ),
          //   child: const CollectionSessionList(),
          // ),
          20.ph,
        ],
      ),
    );
  }
}

String convertTo12HourFormat(int hour, int minute) {
  String period = hour >= 12 ? 'PM' : 'AM';
  int displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
  String formattedMinute = minute.toString().padLeft(2, '0');

  return '$displayHour:$formattedMinute $period';
}
