import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesItem extends StatelessWidget {
  final int? id;
  final bool? isRead;
  final VoidCallback onTap;
  final String maker;
  final String feedback;
  final String date;
  // final GetUserFeedbackEntities model;
  final String image;
  const NotesItem({
    super.key,
    this.isRead = false,
    required this.onTap,
    this.id,
    required this.image,
    required this.date,
    required this.maker,
    required this.feedback,
    // required this.model,
  });

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: MainColors.background,
            foregroundColor: MainColors.primary,
            label: 'مقروءة',
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          color: isRead! ? MainColors.error : Colors.white,
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
                        imageUrl: image,
                        height: 20.h,
                        width: 20.w,
                      ),
                      4.pw,
                      Text(
                        "أ/$maker",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.onSurfaceSecondary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    date,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                ],
              ),
              8.ph,
              Text(feedback, style: MainTextStyle.boldTextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
