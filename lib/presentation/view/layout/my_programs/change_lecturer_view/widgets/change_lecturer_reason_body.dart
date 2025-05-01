import 'package:eazifly_student/core/component/texted_checkbox_row.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChangeLecturerReasonBody extends StatelessWidget {
  const ChangeLecturerReasonBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChangelecturerCubit.get(context);
    var lang = context.loc!;
    return Column(
      children: [
        32.ph,
        Text(
          "برجاء إختيار سبب لتغير المعلم",
          style: MainTextStyle.boldTextStyle(
            fontSize: 14,
          ),
        ),
        20.ph,
        Expanded(
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) => ListView.separated(
              itemBuilder: (context, index) {
                for (var i = 0; i < 4; i++) {
                  cubit.changeLecturerReason.add(false);
                }
                bool isSelcted = cubit.changeLecturerReason[index] == true;
                return TextedCheckBoxRow(
                  isSelcted: isSelcted,
                  onChanged: (value) =>
                      cubit.chooseLecturerReasons(index, value ?? false),
                  text: "سبب ${index + 1}",
                  value: cubit.changeLecturerReason[index],
                );
              },
              separatorBuilder: (context, index) => 12.ph,
              itemCount: 4,
            ),
          ),
        ),
  
        8.ph,
        CustomElevatedButton(
          text: lang.next,
          width: 343.w,
          radius: 16.r,
          color: MainColors.blueTextColor,
          onPressed: () {
            if (cubit.noChosenReason()) {
              customAdaptiveDialog(
                context,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: 16.cr,
                    color: MainColors.white,
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
                        "برجاء اختيار سبب تغيير المعلم",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 15,
                          color: MainColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              cubit.incrementBodyIndex();
            }
          },
        ),
        32.ph,
      ],
    );
  }
}
