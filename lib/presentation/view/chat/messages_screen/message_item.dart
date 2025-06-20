import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/component/voice_message_widget.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextMessageItem extends StatefulWidget {
  final bool? isLastMesage;
  final bool? isThereImages;
  final bool? isRecord;
  final bool isSentText;
  const TextMessageItem({
    super.key,
    required this.isSentText,
    this.isLastMesage = true,
    this.isThereImages = false,
    this.isRecord = false,
  });

  @override
  State<TextMessageItem> createState() => _TextMessageItemState();
}

class _TextMessageItemState extends State<TextMessageItem> {
  @override
  Widget build(BuildContext context) {
    var cubit = ChatsCubit.get(context);
    return Directionality(
      textDirection: widget.isSentText ? TextDirection.rtl : TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageContainer(
            containerHeight: 28.h,
            containerWidth: 28.w,
            shape: BoxShape.circle,
          ),
          8.pw,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: 40.h,
                  minWidth: 100.w,
                ),
                decoration: BoxDecoration(
                  color: widget.isSentText
                      ? widget.isRecord!
                          ? MainColors.grayBorderColor
                          : MainColors.greenTeal
                      : MainColors.grayBorderColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.isSentText ? 16.r : 0),
                    topRight: Radius.circular(widget.isSentText ? 0.r : 16.r),
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: !widget.isRecord!
                        ? Text(
                            ' عليكم اخي برجاء التواصل معي بخصوص طلب ',
                            style: MainTextStyle.boldTextStyle(
                              color: widget.isSentText
                                  ? MainColors.white
                                  : MainColors.blackText,
                              fontSize: 12,
                            ),
                          )
                        : const VoiceMessageWidget(
                            backgroundColor: MainColors.transparentColor,
                            isFile: false,
                            audioSource: "",
                            duration: 55.0,
                          ),
                  ),
                ),
              ),
              8.ph,
              widget.isThereImages!
                  ? SizedBox(
                      height: 104.h,
                      width: 261.w,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var pickedFile = (cubit.images)[index];
                          return Container(
                            height: 84.h,
                            width: 104.w,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Image.file(
                              pickedFile,
                              height: 84.h,
                              width: 104.w,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => 8.pw,
                        itemCount: cubit.images.length,
                      ),
                    )
                  : 0.ph,
              8.ph,
              widget.isLastMesage!
                  ? Text(
                      '12/2/2024',
                      textAlign: TextAlign.center,
                      style: MainTextStyle.regularTextStyle(
                        color: MainColors.grayTextColors,
                        fontSize: 11,
                      ),
                    )
                  : 0.ph,
            ],
          )
        ],
      ),
    );
  }
}
