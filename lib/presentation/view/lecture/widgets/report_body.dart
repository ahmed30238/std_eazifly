
import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/report_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => const ReportItem(
        
      ),
      separatorBuilder: (context, index) => const SeparatedWidget(),
      itemCount: 4,
    );
  }
}
