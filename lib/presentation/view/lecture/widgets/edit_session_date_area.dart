import 'dart:developer';

import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import 'change_time_bottomsheet_design.dart';

class EditSessionDateArea extends StatelessWidget {
  final BuildContext mainContext;

  const EditSessionDateArea({
    super.key,
    required this.sessionId,
    required this.index,
    required this.mainContext,
  });

  final int sessionId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        log("$sessionId");
        showModalSheet(
          isFixedSize: true,
          maxHeight: 323.h,
          minHeight: 322.h,

          context,
          widget: ChangeTimeBottomSheetDesign(
            sessionId: sessionId,
            mainContext: mainContext,
          ),
        );
      },
      child: Text(
        "تعديل الموعد",
        style: MainTextStyle.boldTextStyle(
          fontSize: 12,
          color: MainColors.primary,
        ),
      ),
    );
  }
}
