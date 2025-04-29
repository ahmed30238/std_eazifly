import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DmView extends StatefulWidget {
  final bool isReport;
  final String? problemState;
  const DmView({
    super.key,
    this.isReport = false,
    this.problemState,
  });

  @override
  State<DmView> createState() => _DmViewState();
}

class _DmViewState extends State<DmView> {
  @override
  void initState() {
    ChatsCubit.get(context).initializeRecordVars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = ChatsCubit.get(context);
    // bool isReport = false;
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
              // onLeadinTap: () => Navigator.pop(context),
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const Divider(
                  thickness: 1,
                  color: MainColors.lightGray,
                ),
                40.ph,
                const TextMessageItem(
                  isSentText: true,
                ),
                24.ph,
                const TextMessageItem(
                  isSentText: true,
                  isLastMesage: true,
                  isRecord: true,
                ),
                const TextMessageItem(
                  isSentText: false,
                  isLastMesage: false,
                  isRecord: true,
                ),
                TextMessageItem(
                  isSentText: false,
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
                // if (!cubit.isRecording && cubit.recordPath != null)
                ElevatedButton(
                  onPressed: () {
                    cubit.isPlaying ? cubit.stopAudio() : cubit.playAudio();
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
                        child: SizedBox(
                          height: 40.h,
                          width: 40.w,
                          child: SvgPicture.asset(
                            Assets.iconsMicrophone,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: CustomTextFormField(
                          filledColor: MainColors.white,
                          hintText: "أكتب رسالتك",
                        ),
                      ),
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
        ],
      ),
    );
  }
}
