import 'dart:convert';

import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_storage/get_storage.dart';

class NotesItem extends StatelessWidget {
  final int? id;
  final bool? isRead;
  final VoidCallback onTap;
  final String instructorName;
  final String feedback;
  final String date;
  // final GetUserFeedbackEntities model;
  final int index;
  const NotesItem({
    super.key,
    this.isRead = false,
    required this.onTap,
    this.id,
    required this.index,
    required this.date,
    required this.instructorName,
    required this.feedback,
    // required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var loginData = DataModel.fromJson(
      jsonDecode(
        GetStorage().read(
          StorageEnum.loginModel.name,
        ),
      ),
    );
    return Slidable(
      key: ValueKey(id ?? 0),
      closeOnScroll: true,
      direction: Axis.horizontal,
      useTextDirection: false,
      startActionPane: ActionPane(
        extentRatio: .20,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            autoClose: true,
            onPressed: (context) {},
            backgroundColor: MainColors.white,
            foregroundColor: MainColors.blueTextColor,
            label: 'مقروءة',
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          color: isRead! ? MainColors.lightRed : Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AvatarImage(
                        shape: BoxShape.circle,
                        imageUrl: loginData.image,
                        height: 20.h,
                        width: 20.w,
                      ),
                      4.pw,
                      Text(
                        "أ/$instructorName",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.grayTextColors,
                        ),
                      )
                    ],
                  ),
                  Text(
                    date,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                ],
              ),
              8.ph,
              Text(
                feedback,
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
