import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/notes_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NotesBodyWidget extends StatelessWidget {
  const NotesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRead = true;
    var cubit = context.read<LectureCubit>();
    var feedbacks = cubit.getUserFeedbacksEntity?.data;
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var feedback = feedbacks?[index];
        return NotesItem(
          index: index,
          date: feedback?.date.toString() ?? "",
          feedback: feedback?.feedback ?? "",
          instructorName: feedback?.instructor ?? "",
          onTap: () {
            isRead = !isRead;
          },
          id: index,
          isRead: isRead,
        );
      },
      separatorBuilder: (context, index) => const SeparatedWidget(),
      itemCount: feedbacks?.length ?? 0,
    );
  }
}
