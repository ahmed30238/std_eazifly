import 'package:eazifly_student/core/enums/task_deliver_status.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class DeliveriesBodyWidgetTrailing extends StatelessWidget {
  final DeliverStatus state;
  final bool isDelivered;
  final String mark;
  const DeliveriesBodyWidgetTrailing({
    super.key,
    this.isDelivered = false,
    required this.state,
    required this.mark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isDelivered
            ? Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  4.pw,
                  Text(mark, style: MainTextStyle.boldTextStyle(fontSize: 14)),
                ],
              )
            : 0.ph,
        4.ph,
        TextedContainer(
          text: deliveryState(state).text,
          textColor: deliveryState(state).textColor,
          containerColor: deliveryState(state).color,
          height: 30.h,
          radius: 32.r,
        ),
      ],
    );
  }
}
