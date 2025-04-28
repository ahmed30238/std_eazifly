
import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/enums/task_deliver_status.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveriesBodyWidgetTrailing extends StatelessWidget {
  final DeliverStatus state;
  final bool isDelivered;
  const DeliveriesBodyWidgetTrailing({
    super.key,
    this.isDelivered = false,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isDelivered
            ? Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  4.pw,
                  Text(
                    " 10 / 9 ",
                    style: MainTextStyle.boldTextStyle(fontSize: 14),
                  ),
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