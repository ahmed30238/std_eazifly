import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentCounterWidget extends StatelessWidget {
  final ProgramSubscriptionPlanCubit cubit;

  const StudentCounterWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Container(
      height: 53.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lang.studentsCount,
            textAlign: TextAlign.center,
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
              color: MainColors.onSurfaceSecondary,
            ),
          ),
          const Spacer(),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => GestureDetector(
              onTap: cubit.decrementCount,
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: cubit.studentCount > 1
                      ? MainColors.surface
                      : Colors.grey[100],
                  borderRadius: 12.cr,
                ),
                child: Icon(
                  Icons.remove,
                  size: 20.r,
                  color: cubit.studentCount > 1
                      ? MainColors.primary
                      : Colors.grey[400],
                ).center(),
              ),
            ),
          ),

          // Student count display
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                '${cubit.studentCount}',
                textAlign: TextAlign.center,
                style: MainTextStyle.boldTextStyle(
                  fontSize: 18,
                  color: MainColors.onPrimary,
                ),
              ),
            ),
          ),

          // Increase button
          GestureDetector(
            onTap: cubit.incrementCount,
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: MainColors.surface,
                borderRadius: 12.cr,
              ),
              child: Icon(
                size: 20.r,
                Icons.add,
                color: MainColors.primary,
              ).center(),
            ),
          ),
        ],
      ),
    );
  }
}
