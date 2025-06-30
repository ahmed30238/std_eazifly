import 'dart:developer';

import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/enums/mesage_type_enum.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_cubit.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/report_body.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/widgets.dart/message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DmView extends StatefulWidget {
  final bool isReport;
  final String? problemState;
  final int? orderId;

  const DmView({
    super.key,
    this.isReport = false,
    this.problemState,
    this.orderId,
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

  @override
  void initState() {
    ChatsCubit.get(context).initializeRecordVars();
    log("orderId id ${widget.orderId}");

    log('Report Order ID: ${widget.orderId}');

    var programCubit = context.read<ProgramsUnderReviewCubit>();

    // تحميل الـ orders الأول
    programCubit.specificOrder(orderId: widget.orderId!);
    myOrder = programCubit.myOrder;
    // programCubit.getUserOrders().then((_) {
    //   // بعد ما الداتا تتحمل، دور على الـ order المحدد
    //   log('Report Order title is : ${programCubit.myOrder?.orderNotes?.last.title}');
    // });
    // if (widget.isReport && widget.orderId != null) {}

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = ChatsCubit.get(context);

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
              onTitleTapped: () {},
              isDmView: true,
              isCenterTitle: true,
              mainTitle: "ياسر  محمود",
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
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const Divider(
                        thickness: 1,
                        color: MainColors.lightGray,
                      ),
                      40.ph,
                      TextMessageItem(
                        messageSenderAvatar: "",
                        messageModel: Message(
                            content: "",
                            isSender: true,
                            type: MessageTypeEnum.text,
                            createdAt: ""),
                        isLastMesage: true,
                        isThereImages: cubit.images.isNotEmpty,
                      ),
                      24.ph,
                      TextMessageItem(
                        messageSenderAvatar: "",
                        messageModel: Message(
                            content: "",
                            isSender: true,
                            type: MessageTypeEnum.text,
                            createdAt: ""),
                        isLastMesage: true,
                        isThereImages: cubit.images.isNotEmpty,
                      ),
                      TextMessageItem(
                        messageSenderAvatar: "",
                        messageModel: Message(
                            createdAt: "",
                            content: "",
                            isSender: true,
                            type: MessageTypeEnum.text),
                        isLastMesage: true,
                        isThereImages: cubit.images.isNotEmpty,
                      ),
                      TextMessageItem(
                        messageSenderAvatar: "",
                        messageModel: Message(
                            createdAt: "",
                            content: "",
                            isSender: true,
                            type: MessageTypeEnum.text),
                        isLastMesage: true,
                        isThereImages: cubit.images.isNotEmpty,
                      ),
                      10.ph,
                      BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) => cubit.isRecording
                            ? const Text("recording...")
                            : const Text("stopped"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cubit.isPlaying
                              ? cubit.stopAudio()
                              : cubit.playAudio();
                        },
                        child: BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) => Text(
                            cubit.isPlaying ? "playing ..." : "Not Playing",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ChatsCubit, ChatsState>(
                  bloc: cubit,
                  builder: (context, state) {
                    return Container(
                      color: MainColors.veryLightGrayFormField,
                      padding: EdgeInsets.only(bottom: 20.h, top: 8.h),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                cubit.isRecording
                                    ? cubit.stopRecording()
                                    : cubit.startRecording();
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color: cubit.isRecording
                                      ? MainColors.red.withOpacity(0.1)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: SvgPicture.asset(
                                  Assets.iconsMicrophone,
                                  fit: BoxFit.scaleDown,
                                  colorFilter: cubit.isRecording
                                      ? const ColorFilter.mode(
                                          MainColors.red,
                                          BlendMode.srcIn,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                            8.pw,
                            const Expanded(
                              child: CustomTextFormField(
                                filledColor: MainColors.white,
                                hintText: "أكتب رسالتك",
                              ),
                            ),
                            8.pw,
                            InkWell(
                              onTap: () => cubit.pickImages(),
                              child: SizedBox(
                                height: 40.h,
                                width: 40.w,
                                child: SvgPicture.asset(
                                  Assets.iconsGallery,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (cubit.isRecording)
                  Container(
                    color: MainColors.red.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fiber_manual_record,
                          color: MainColors.red,
                          size: 12.sp,
                        ),
                        8.pw,
                        Text(
                          "جاري التسجيل...",
                          style: TextStyle(
                            color: MainColors.red,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }

  // دالة مساعدة لاستخدام orderId بشكل آمن في أي مكان
  void handleReportAction() {
    if (widget.isReport && widget.orderId != null) {
      // استخدام orderId هنا
      print('Processing report with ID: ${widget.orderId}');
      // مثال: إرسال تقرير أو تحديث حالة
    }
  }
}
