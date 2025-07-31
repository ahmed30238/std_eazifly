import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class WritingMessageArea extends StatefulWidget {
  final int orderId;
  final bool isReport;
  const WritingMessageArea({
    super.key,
    required this.orderId,
    this.isReport = false,
  });

  @override
  State<WritingMessageArea> createState() => _WritingMessageAreaState();
}

class _WritingMessageAreaState extends State<WritingMessageArea> {
  @override
  void initState() {
    ChatsCubit.get(context).initMessageListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = ChatsCubit.get(context);
    return BlocBuilder<ChatsCubit, ChatsState>(
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
                  onTap: cubit.isMessageNotEmpty
                      ? () {
                          if (widget.isReport) {
                            cubit.addNote(
                              orderId: widget.orderId.toString(),
                              context: context,
                            );
                          } else {
                            cubit.sendMessages(
                                receiverId: cubit.currentInstructor?.id ?? "");
                          }
                          // if (cubit.messageController.text.isNotEmpty) {
                          // }
                        }
                      : () {
                          // cubit.isRecording
                          //     ? cubit.stopRecording()
                          //     : cubit.startRecording();
                        },
                  child: SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: SvgPicture.asset(
                      cubit.isMessageNotEmpty
                          ? Assets.iconsSend2
                          : Assets.iconsMicrophone,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomTextFormField(
                    filledColor: MainColors.white,
                    controller: cubit.messageController,
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
    );
  }
}
