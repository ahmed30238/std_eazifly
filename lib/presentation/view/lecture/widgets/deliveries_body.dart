import 'dart:developer';

import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/core/enums/task_deliver_status.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/custom_list_tile.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/deliveries_body_widget_trailing.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:intl/intl.dart';

class DeliveriesBodyWidget extends StatelessWidget {
  const DeliveriesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LectureCubit>();
    var assignments = cubit.getProgramAssignmentsEntity?.data;

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var assignment = assignments?[index];
        var date = assignment?.createdAt;

        // تحويل الـ state من السيرفر إلى enum
        DeliverStatus deliverState = getDeliverStatusFromString(
          assignments?[index].status,
        );
        bool isDelivered = isAssignmentDelivered(assignments?[index].status);

        return CustomListTile(
          onTap: () {
            log("this is assignment id ${assignment?.id}");
            log("this is assignment id ${assignment?.isUploaded}");
            Navigator.pushNamed(
              arguments: assignment?.isUploaded ?? true
                  ? {
                      "assignmentId": assignment?.id,
                      "assignmentTitle": assignment?.title,
                    }
                  : {
                      "cubit": cubit,
                      "assignmentId": assignment?.id,
                      "assignmentTitle": assignment?.title,
                    },
              context,
              assignment?.isUploaded ?? true
                  ? RoutePaths.corrcectedAssignmentDetailsView
                  : RoutePaths.assignmentDetailsView,
            );
          },
          title: assignment?.title ?? "مهمة غير محددة",
          subTitle: formatDate(date?.toString()),
          iconContainerColor: MainColors.background,
          trailing: DeliveriesBodyWidgetTrailing(
            state: deliverState,
            isDelivered: isDelivered,
            mark: assignment?.mark ?? "لم يتم التسليم",
          ),
          icon: Assets.iconsLectAssignmentIcon,
        );
      },
      separatorBuilder: (context, index) => SeparatedWidget(
        isThereNotes: assignments?[index].instructorNote != null,
      ),
      itemCount: assignments?.length ?? 0,
    );
  }
}

// دالة لتحويل الـ state من String إلى DeliverStatus enum
DeliverStatus getDeliverStatusFromString(String? state) {
  if (state == null || state.isEmpty) {
    return DeliverStatus.notDelivered;
  }

  switch (state.toLowerCase()) {
    case 'corrected':
    case 'completed':
    case 'done':
      return DeliverStatus.deliverDone;

    case 'under_review':
    case 'pending':
    case 'reviewing':
    case 'submitted':
      return DeliverStatus.deliverUnderReview;

    case 'not_delivered':
    case 'not_submitted':
    case 'pending_delivery':
    case 'open':
      return DeliverStatus.notDelivered;

    default:
      // إذا جاءت حالة غير متوقعة، نعتبرها غير مسلمة
      return DeliverStatus.notDelivered;
  }
}

// دالة لتحديد إذا كانت المهمة مسلمة أم لا
bool isAssignmentDelivered(String? state) {
  if (state == null || state.isEmpty) {
    return false;
  }

  switch (state.toLowerCase()) {
    case 'corrected':
    case 'completed':
    case 'done':
    case 'under_review':
    case 'pending':
    case 'reviewing':
    case 'submitted':
      return true;

    case 'not_delivered':
    case 'not_submitted':
    case 'pending_delivery':
    case 'open':
      return false;

    default:
      return false;
  }
}

// دالة لتنسيق التاريخ
String formatDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return "غير محدد";
  }

  try {
    DateTime date = DateTime.parse(dateString);

    // تنسيق التاريخ والوقت
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    String formattedTime = DateFormat('hh:mm a').format(date);

    return "$formattedDate   $formattedTime";
  } catch (e) {
    // إذا فشل parsing التاريخ
    return dateString;
  }
}
