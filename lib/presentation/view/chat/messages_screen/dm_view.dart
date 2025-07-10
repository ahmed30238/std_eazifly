import 'dart:developer';

import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_cubit.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/dm_body.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/report_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DmView extends StatefulWidget {
  final bool isReport;
  final String? problemState;
  final int? orderId;
  final String chatId;

  const DmView({
    super.key,
    this.isReport = false,
    this.problemState,
    this.orderId,
    required this.chatId,
  }) : assert(
          // التأكد من أن orderId يُمرر فقط عندما isReport = true
          !isReport || orderId != null,
          'orderId is required when isReport is true',
        );

  @override
  State<DmView> createState() => _DmViewState();
}

class _DmViewState extends State<DmView> {
  // getter للحصول على orderId بشكل آمن
  int? get safeOrderId => widget.isReport ? widget.orderId : null;

  CreateOrderDataEntity? myOrder;
  late ChatsCubit cubit;
  @override
  void initState() {
    ChatsCubit.get(context).initializeRecordVars();
    log("orderId id ${widget.orderId}");

    log('Report Order ID: ${widget.orderId}');
    log('Chat ID: ${widget.chatId}');

    var programCubit = context.read<ProgramsUnderReviewCubit>();
    cubit = context.read<ChatsCubit>();
    cubit.getMessages(chatId: widget.chatId, isInitial: true, showLoader: true);
    cubit.initScorllController(widget.chatId);

    // تحميل الـ orders الأول
    programCubit.specificOrder(orderId: widget.orderId!);
    myOrder = programCubit.myOrder;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = .get(context);

    return Scaffold(
      appBar: widget.isReport
          ? CustomAppBar(
              context,
              mainTitle: "اسم المشكلة",
              leadingText: "البلاغات",
              isCenterTitle: true,
              customAction: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: widget.problemState == "جاري"
                      ? TextedContainer(
                          text: "جاري",
                          radius: 12.r,
                          containerColor: MainColors.lightgreenTeal,
                          textColor: MainColors.greenTeal,
                          width: 65.w,
                          height: 26.h,
                        )
                      : widget.problemState == "انتهت"
                          ? TextedContainer(
                              text: "انتهت",
                              radius: 12.r,
                              containerColor: MainColors.lightRed,
                              textColor: MainColors.red,
                              width: 65.w,
                              height: 26.h,
                            )
                          : const SizedBox(),
                ),
              ],
            )
          : CustomAppBar(
              context,
              onTitleTapped: () {
                log("message");
              },
              isDmView: true,
              isCenterTitle: true,
              mainTitle: "",
              dmTitle:
                  "${cubit.currentInstructor?.name} ${cubit.currentInstructor?.type}",
              dmImageUrl: cubit.currentInstructor?.image,
              leadingText: "الرسائل",
              leadingIcon: Icons.arrow_back_ios,
              customAction: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: IconsContainer(
                      width: 48.w,
                      containerColor: MainColors.white,
                      iconWidget: SvgPicture.asset(
                        Assets.iconsVerticalDots,
                        fit: BoxFit.scaleDown,
                      )),
                )
              ],
            ),
      body: widget.isReport
          ? ReportBodyView(
              order: myOrder!,
            )
          : DmBody(cubit: cubit, widget: widget),
    );
  }
}
