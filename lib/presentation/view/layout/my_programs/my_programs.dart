import 'dart:convert';

import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/my_programs_loder.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/program_item.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/program_navigation.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class MyProgramsView extends StatefulWidget {
  const MyProgramsView({super.key});

  @override
  State<MyProgramsView> createState() => _MyProgramsViewState();
}

class _MyProgramsViewState extends State<MyProgramsView> {
  late MyProgramsCubit cubit;
  late DataModel loginData;

  GlobalKey keyReviewButton = GlobalKey();
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];

  @override
  void initState() {
    loginData = DataModel.fromJson(
      jsonDecode(GetStorage().read(StorageEnum.loginModel.name)),
    );
    cubit = context.read<MyProgramsCubit>();
    cubit.getMyPrograms();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showTutorial();
    });

    super.initState();
  }

  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      // context,
      targets: targets,
      textSkip: "تخطي",
      paddingFocus: 10,
      colorShadow: Colors.black.withOpacity(0.8),
      onFinish: () => print("تم الانتهاء من الشرح"),
    )..show(
      context: context,
    );
  }

  void initTargets() {
    targets.clear();
    targets.add(
      TargetFocus(
        identify: "review_button",
        keyTarget: keyReviewButton,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: const Text(
              "اضغط هنا لرؤية البرامج تحت المراجعة",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
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
            key: keyReviewButton,
            onTap: () => Navigator.pushNamed(
              context,
              RoutePaths.programsUnderReviewView,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                return const MyProgramsLoader();
              } else if (!cubit.getMyProgramsLoader) {
                var myPrograms = cubit.getMyProgramsEntity?.data;

                if (myPrograms == null || myPrograms.isEmpty) {
                  return const Center(
                    child: Text("No programs available"),
                  );
                }

                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = myPrograms[index];
                    bool started = item.currentSession?.status == "started";

                    String nextLec = "";
                    String formattedTimeDiff = "";

                    if (item.currentSession?.status != null) {
                      if (item.nextSession != null) {
                        int hour = item.nextSession!.hour;
                        int minute = item.nextSession!.minute;
                        nextLec = convertTo12HourFormat(hour, minute);
                        formattedTimeDiff = formatTimeDifference(item.nextSession);
                      } else {
                        nextLec = "بدأت بالفعل";
                        formattedTimeDiff = "جارية الآن";
                      }
                    } else {
                      if (item.nextSession != null) {
                        int hour = item.nextSession!.hour;
                        int minute = item.nextSession!.minute;
                        nextLec = convertTo12HourFormat(hour, minute);
                        formattedTimeDiff = formatTimeDifference(item.nextSession);
                      } else {
                        nextLec = "غير محدد";
                        formattedTimeDiff = "غير محدد";
                      }
                    }

                    return ProgramItem(
                      desc: item.description ?? "no desc",
                      duration: "${item.duration} دقيقة",
                      image: item.image ?? "",
                      nextLec: nextLec,
                      status: item.currentSession?.status ?? "tt",
                      title: item.title ?? "",
                      isRejoin: started,
                      timeDiff: formattedTimeDiff,
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
                      onTap: cubit.getAssignedChildrenLoader
                          ? () {}
                          : () async {
                              await cubit
                                  .getAssignedChildrenToProgram(
                                      programId: item.id ?? -1)
                                  .then((value) {
                                onMyProgramTap(
                                  context: context,
                                  cubit: cubit,
                                  item: item,
                                  loginData: loginData,
                                  programId: item.id ?? -1,
                                  noOfChildren: cubit
                                          .getAssignedChildrenToProgramEntity
                                          ?.data
                                          ?.length ??
                                      0,
                                );
                              });
                            },
                    );
                  },
                  separatorBuilder: (context, index) => 20.ph,
                  itemCount: myPrograms.length,
                );
              } else if (state is GetMyProgramsErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          20.ph,
          20.ph,
        ],
      ),
    );
  }
}
