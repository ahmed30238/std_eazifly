

import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/notes_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NotesBodyWidget extends StatelessWidget {
  const NotesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRead = true;
    // var cubit = StudentsCubit.get(context);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return NotesItem(
          index: index,
          // model: cubit.getUserFeedbackEntities!,
          onTap: () {
            // setState(() {
            isRead = !isRead;
            // });
          },
          id: index,
          isRead: isRead,
        );
      },
      separatorBuilder: (context, index) => const SeparatedWidget(),
      itemCount:4,
    );
  }
}
