import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/core/enums/task_deliver_status.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/custom_list_tile.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/deliveries_body_widget_trailing.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class DeliveriesBodyWidget extends StatelessWidget {
  const DeliveriesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = StudentsCubit.get(context);
    // var assignment = cubit.getStudentAssignmentEntities?.data;

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          RoutePaths.corrcectedAssignmentDetailsView,
        ),
        child: CustomListTile(
          title: "واجب الراضيات - المعادلات الرقمية",
          subTitle: "12-2-2025   8:10 PM ",
          iconContainerColor: MainColors.white,
          trailing: DeliveriesBodyWidgetTrailing(
            state: index == 0
                ? DeliverStatus.deliverDone
                : index == 1
                    ? DeliverStatus.deliverUnderReview
                    : DeliverStatus.notDelivered,
            isDelivered: index == 0 ? true : false,
          ),
          icon: Assets.iconsLectAssignmentIcon,
        ),
      ),
      separatorBuilder: (context, index) => const SeparatedWidget(
        isThereNotes: true,
      ),
      itemCount: 2,
    );
  }
}
