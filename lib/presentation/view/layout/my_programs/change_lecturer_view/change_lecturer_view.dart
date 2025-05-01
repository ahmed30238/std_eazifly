import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

List<String> weekDaysAr = [
  "السبت",
  "الاحد",
  "الاثنين",
  "الثلاثاء",
  "الاريعاء",
  "الخميس",
  "الجمعة",
];

class ChangeLecturerView extends StatelessWidget {
  const ChangeLecturerView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChangelecturerCubit.get(context);
    var lang = context.loc!;
    
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تغيير محاضر تابع لبرنامج",
        leadingText: lang.back,
        isCenterTitle: true,
        onLeadinTap: () => cubit.decrementBodyIndex(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            8.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) => CustomLinearPercentIndicator(
                percent: cubit.linearIndicatorPercent,
              ),
            ),
            Expanded(
              child: BlocBuilder(
                bloc: cubit,
                builder: (context, state) => cubit.bodies[cubit.bodyIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






