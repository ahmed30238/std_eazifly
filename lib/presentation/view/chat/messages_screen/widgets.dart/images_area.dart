import 'dart:io';

import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ImagesArea extends StatelessWidget {
  const ImagesArea({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChatsCubit>();

    return SizedBox(
      height: 104.h,
      width: 261.w,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var pickedFile = (cubit.image);
          return Container(
            height: 84.h,
            width: 104.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.file(
              pickedFile ?? File("path"),
              height: 84.h,
              width: 104.w,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (context, index) => 8.pw,
        itemCount: 1,
      ),
    );
  }
}
