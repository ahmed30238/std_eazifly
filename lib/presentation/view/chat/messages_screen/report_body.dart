import 'dart:developer';

import 'package:eazifly_student/core/enums/mesage_type_enum.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_state.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/widgets.dart/message_item.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/widgets.dart/writing_message_area.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ReportBodyView extends StatelessWidget {
  final CreateOrderDataEntity order;
  const ReportBodyView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChatsCubit>();
    // var programsUnderReview = context.read<ProgramsUnderReviewCubit>();
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
               Divider(
                thickness: 1,
                color: MainColors.lightGray,
              ),
              40.ph,
              Expanded(
                child: BlocBuilder<ProgramsUnderReviewCubit,
                    ProgramsUnderReviewState>(
                  builder: (context, state) {
                    var notes = order.orderNotes;
                    return ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
                      controller: cubit.scrollController,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: notes?.length ?? 0,
                      itemBuilder: (context, index) {
                        if (index == notes?.length) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        bool isLastElement =
                            notes != null && index == notes.length - 1;
                        final note = notes?[index];
                        log("${note?.title}");

                        return TextMessageItem(
                          // messageStatus: ,
                          isLastMesage: isLastElement,
                          messageModel: Message(
                            type: getMessageType(
                                note?.image == null ? "text" : "image"),
                            content: note?.title ?? "",
                            isSender: note?.type == "user",
                            createdAt:
                                formatDate(note?.createdAt ?? DateTime.now())
                                    .substring(0, 10),
                          ),
                          messageSenderAvatar: note?.maker?.image ?? "",
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        WritingMessageArea(
          orderId: order.id ?? 0,
          isReport: true,
        ),
      ],
    );
  }
}

MessageTypeEnum getMessageType(String type) {
  switch (type) {
    case "text":
      return MessageTypeEnum.text;
    case "image":
      return MessageTypeEnum.image;

    case "voice_message":
      return MessageTypeEnum.text;

    default:
      return MessageTypeEnum.text;
  }
}
