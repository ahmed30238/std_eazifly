import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/lecture_view.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/app_bar_bottom_sheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LectureViewAppBar({
    super.key,
    required this.cubit,
    required this.widget,
    required this.btnKey,
  });

  final LectureCubit cubit;
  final LectureView widget;
  final GlobalKey btnKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        String title =
            cubit.showProgramDetailsEntity?.data?.title ?? "البرنامج";
        return CustomAppBar(
          context,
          mainTitle: title,
          leadingText: "المواعيد",
          isCenterTitle: true,
          leadingCustomWidth: 80.w,
          onLeadinTap: () => Navigator.pop(context),
          customAction: [
            InkWell(
              key: btnKey,
              onTap: () => lectureAppBarModalSheet(
                context,
                widget.programId,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SvgPicture.asset(
                  Assets.iconsVerticalDots,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
