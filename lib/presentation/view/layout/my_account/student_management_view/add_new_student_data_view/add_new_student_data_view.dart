import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AddNewStudentDataView extends StatelessWidget {
  const AddNewStudentDataView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AddNewStudentDataToProgramCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "أضافة بيانات طالب لبرنامج",
        isCenterTitle: true,
        leadingText: lang.back,
        onLeadinTap: () => cubit.decrementScreenIndex(context),
      ),
      body: Column(
        children: [
          8.ph,
          BlocBuilder<AddNewStudentDataToProgramCubit,
              AddNewStudentDataToProgramState>(
            builder: (context, state) {
              return CustomLinearPercentIndicator(
                percent: cubit.linearIndicatorPercent,
                alignment: MainAxisAlignment.center,
              );
            },
          ),
          Expanded(child: BlocBuilder<AddNewStudentDataToProgramCubit,
              AddNewStudentDataToProgramState>(
            builder: (context, state) {
              return cubit.bodies[cubit.screenIndex];
            },
          ))
        ],
      ),
    );
  }
}
