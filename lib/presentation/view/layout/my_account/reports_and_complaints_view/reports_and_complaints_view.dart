import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/reports_and_complaints_view/widgets/report_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ReportsAndComplaintsView extends StatelessWidget {
  const ReportsAndComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.reportsAndComplaints,
        leadingText: lang.back,
        isCenterTitle: true,
        onLeadinTap: () => back(context),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: 16.h),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            RoutePaths.dmViewPath,
            arguments: {
              "isReport": true,
              "cubit": ChatsCubit.get(context),
              "problemState": index == 0
                  ? "جاري"
                  : index == 1
                      ? ""
                      : "انتهت",
            },
          ),
          child: ReportsAndComplaintsWidget(
            state: index == 0
                ? "جاري"
                : index == 1
                    ? ""
                    : "انتهت",
          ),
        ),
        separatorBuilder: (context, index) => const CustomHorizontalDivider(
          thickness: 1,
        ),
        itemCount: 3,
      ),
    );
  }
}
