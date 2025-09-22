import 'dart:developer';
import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/change_time_bottomsheet_design.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChooseNewDatesOptionsBody extends StatelessWidget {
  const ChooseNewDatesOptionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CancelSessionCubit>();
    var lang = context.loc!;
    return Column(
      children: [
        75.5.ph,
        Expanded(
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return Column(
                children: [
                  TextedCheckBoxRow(
                    isSelcted: cubit.chooseNewDateOption,
                    onChanged: (value) => cubit.toggleChooseNewDateOption(),
                    text: "تحديد موعد جديد للمحاضرة",
                    value: cubit.chooseNewDateOption,
                  ),
                  12.ph,
                  TextedCheckBoxRow(
                    isSelcted: cubit.cancelSession,
                    onChanged: (value) => cubit.toggleCancelSession(),
                    text: "الغاء المحاضرة",
                    value: cubit.cancelSession,
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    text: lang.next,
                    width: 343.w,
                    radius: 16.r,
                    color: MainColors.primary,
                    onPressed: cubit.postCancelSessionLoader
                        ? () {}
                        : () async {
                            if (!cubit.chooseNewDateOption &&
                                !cubit.cancelSession) {
                              customAdaptiveDialog(
                                context,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: 16.cr,
                                    color: MainColors.background,
                                  ),
                                  height: 160.h,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.iconsRejectRequest,
                                      ),
                                      8.ph,
                                      Text(
                                        "برجاء الاختيار احدي الخيارات المتاحة",
                                        style: MainTextStyle.boldTextStyle(
                                          fontSize: 15,
                                          color: MainColors.error,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else if (cubit.chooseNewDateOption) {
                              final sessionId =
                                  context
                                      .read<MyProgramsCubit>()
                                      .getAssignedChildrenToProgramEntity
                                      ?.data?[context
                                          .read<LectureCubit>()
                                          .currentUserIndex]
                                      .nextSession
                                      ?.id ??
                                  -1;

                              showModalSheet(
                                context,
                                isFixedSize: true,
                                maxHeight: 314.h,
                                minHeight: 312.h,
                                widget: ChangeTimeBottomSheetDesign(
                                  mainContext: context,
                                  // daysList: daysList,
                                  // cubit: cubit,
                                  sessionId: sessionId,
                                ),
                              );
                            } else {
                              cubit.postCancelSession(context);
                              log("Cancel Session");
                            }
                          },
                    child: cubit.postCancelSessionLoader
                        ? const CircularProgressIndicator.adaptive()
                        : null,
                  ),
                  32.ph,
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
