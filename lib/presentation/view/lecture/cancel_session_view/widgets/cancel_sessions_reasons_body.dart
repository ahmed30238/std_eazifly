import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/texted_checkbox_loader.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CacnelSessionsReasonsBody extends StatelessWidget {
  const CacnelSessionsReasonsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CancelSessionCubit>();
    var lang = context.loc!;
    return Column(
      children: [
        32.ph,
        Text(
          "برجاء إختيار سبب الالغاء",
          style: MainTextStyle.boldTextStyle(
            fontSize: 14,
          ),
        ),
        20.ph,
        Expanded(
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (cubit.getCancelReasonsLoader) {
                return const TextedCheckboxLoaderList();
              }

              var reasons = cubit.getCancelReasonsEntity?.data;
              if (reasons == null || reasons.isEmpty) {
                return const Center(
                    child: Text("No cancellation reasons available"));
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  var reason = reasons[index];
                  bool isSelected = cubit.cancelSessionReasons[index] == true;
                  return TextedCheckBoxRow(
                    isSelcted: isSelected,
                    onChanged: (value) =>
                        cubit.chooseCancelReasons(index, value ?? false),
                    text: reason.title ?? "",
                    value: cubit.cancelSessionReasons[index],
                  );
                },
                separatorBuilder: (context, index) => 12.ph,
                itemCount: reasons.length,
              );
            },
          ),
        ),
        8.ph,
        CustomElevatedButton(
          text: lang.next,
          width: 343.w,
          radius: 16.r,
          color: MainColors.primary,
          onPressed: () {
            if (cubit.noChosenReason()) {
              customAdaptiveDialog(
                context,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                        "برجاء اختيار سبب الالغاء",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 15,
                          color: MainColors.onError,
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
