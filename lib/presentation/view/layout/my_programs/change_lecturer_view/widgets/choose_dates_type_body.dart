import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChooseDatesTypeBody extends StatelessWidget {
  const ChooseDatesTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChangelecturerCubit.get(context);
    var lang = context.loc!;
    return Column(
      children: [
        32.ph,
        Text(
          "أختر المواعيد المناسبة ",
          style: MainTextStyle.boldTextStyle(
              fontSize: 14, color: MainColors.checkBoxBorderGray),
        ),
        20.ph,
        Expanded(
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) => ListView.separated(
              itemBuilder: (context, index) {
                bool isSelcted = index == 0
                    ? cubit.sameDates == true
                    : cubit.newDates == true;
                return TextedCheckBoxRow(
                  isSelcted: isSelcted,
                  onChanged: (value) => index == 0
                      ? cubit.toggleSameDates()
                      : cubit.toggleNewDates(),
                  text: index == 0
                      ? "تحدد محاضر بنفس المواعيد القديمة"
                      : "إختيار مواعيد جديدة",
                  value: index == 0 ? cubit.sameDates : cubit.newDates,
                );
              },
              separatorBuilder: (context, index) => 12.ph,
              itemCount: 2,
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
            if (cubit.noDateTypeChosen()) {
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
                        "برجاء اختيار المواعيد المناسبة",
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
