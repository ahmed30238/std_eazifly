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
    super.initState();

    // Initialize the cubit
    cubit = context.read<ChatsCubit>();

    // Initialize record variables
    cubit.initializeRecordVars();

    // Initialize scroll controller
    cubit.initScrollController(widget.chatId);

    // استدعاء getMessages عند دخول الشاشة
    _loadMessages();

    // إذا كان isReport = true، نحتاج لتحميل الـ order
    if (widget.isReport && widget.orderId != null) {
      _loadOrderData();
    }
  }

  // دالة منفصلة لتحميل الرسائل
  void _loadMessages() {
    log('Loading messages for chat ID: ${widget.chatId}');
    cubit.getMessages(chatId: widget.chatId, isInitial: true, showLoader: true);
  }

  // دالة منفصلة لتحميل بيانات الطلب (للتقارير)
  void _loadOrderData() {
    log('Loading order data for order ID: ${widget.orderId}');
    var programCubit = context.read<ProgramsUnderReviewCubit>();
    programCubit.specificOrder(orderId: widget.orderId!);
    myOrder = programCubit.myOrder;
  }

  @override
  Widget build(BuildContext context) {
    // String? getTitle() {
    //   if (cubit.controller?.index == 0) {
    //     return cubit.currentInstructor?.name ?? "";
    //   } else {
    //     return cubit.currentClient?.participant?.name ?? "";
    //   }
    // }
    //
    // String? getAvatar() {
    //   if (cubit.controller?.index == 0) {
    //     return cubit.currentInstructor?.image ?? "";
    //   } else {
    //     return cubit.currentClient?.participant?.image ?? "";
    //   }
    // }

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
                          containerColor: MainColors.onSuccess,
                          textColor: MainColors.success,
                          width: 65.w,
                          height: 26.h,
                        )
                      : widget.problemState == "انتهت"
                      ? TextedContainer(
                          text: "انتهت",
                          radius: 12.r,
                          containerColor: MainColors.error,
                          textColor: MainColors.onError,
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
              dmTitle: cubit.controller?.index == 0
                  ? cubit.currentInstructor?.name
                  : "إدارة التطبيق",
              // getTitle(),
              dmImageUrl: cubit.controller?.index == 0
                  ? cubit.currentInstructor?.image
                  : "",
              // getAvatar() ?? ,
              leadingText: "الرسائل",
              leadingIcon: Icons.arrow_back_ios,
              customAction: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: IconsContainer(
                    width: 48.w,
                    containerColor: MainColors.background,
                    iconWidget: SvgPicture.asset(
                      Assets.iconsVerticalDots,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
      body: widget.isReport
          ? ReportBodyView(order: myOrder!)
          : DmBody(cubit: cubit, widget: widget),
    );
  }
}
