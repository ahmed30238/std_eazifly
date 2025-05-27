import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/stars_widget.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PreviousReviewsTab extends StatelessWidget {
  final GetProgramsProgramEntity programEntity;

  const PreviousReviewsTab({
    super.key,
    required this.programEntity,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var review = programEntity.reviews?[index];
        return Container(
          padding: EdgeInsets.all(8.r),
          constraints: BoxConstraints(minHeight: 72.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AvatarImage(
                    height: 20.h,
                    width: 20.w,
                    shape: BoxShape.circle,
                    imageUrl: review?.userImage ?? "",
                  ),
                  8.pw,
                  Text(
                    review?.user ?? "",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  StarsWidget(
                    rating: double.tryParse(review?.rating ?? "0") ?? 0,
                    starSize: 15.r,
                  )
                ],
              ),
              Text(
                review?.review ?? "",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 11,
                  color: MainColors.grayTextColors,
                ),
              )
            ],
          ),
        );
      },
      itemCount: programEntity.reviews?.length ?? 0,
    );
  }
}
