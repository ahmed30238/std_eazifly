import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubGoalsWidget extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final bool isDone; // إضافة المتغير الجديد
  final int lessonId; // إضافة معرف الدرس للـ API call

  const SubGoalsWidget({
    super.key,
    required this.index,
    required this.title,
    required this.description,
    required this.isDone, // مطلوب الآن
    required this.lessonId, // مطلوب للـ API call
  });

  @override
  Widget build(BuildContext context) {
    var cubit = LectureCubit.get(context);
    return Row(
      children: [
        Text("${index + 1}", style: MainTextStyle.boldTextStyle(fontSize: 14)),
        16.pw,
        InkWell(
          onTap: () => showDialog(
            barrierDismissible: true,
            builder: (context) => Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 178.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MainColors.background,
                  borderRadius: 20.cr,
                ),
                child: Column(
                  children: [
                    24.ph,
                    SizedBox(
                      height: 28.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: MainTextStyle.boldTextStyle(fontSize: 14),
                          ),
                          InkWell(
                            onTap: () => back(context),
                            child: Container(
                              height: 28.h,
                              width: 28.w,
                              decoration: BoxDecoration(
                                borderRadius: 13.4.cr,
                                color: MainColors.outline,
                              ),
                              child: Icon(size: 20.r, Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.ph,
                    Html(data: description),
                  ],
                ),
              ),
            ),
            context: context,
          ),
          child: Container(
            height: 53.h,
            width: 312.w,
            decoration: BoxDecoration(
              color: MainColors.surfaceContainerHighest,
              borderRadius: 8.cr,
            ),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(borderRadius: 5.cr),
                  // استخدام isDone بدلاً من cubit.isSelected[index]
                  value: isDone,
                  activeColor: MainColors.primary,
                  onChanged: (value) {
                    // إذا كان الدرس مكتمل، لا تسمح بإلغاء الاختيار
                    if (!isDone && value == true) {
                      // استدعاء API لإكمال الدرس
                      cubit.completeChapterLesson(
                        lessonId: lessonId,
                        userId: cubit.userId,
                      );
                    }
                    // يمكنك إضافة منطق إضافي هنا حسب احتياجاتك
                  },
                ),
                Expanded(
                  child: Text(
                    title,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                      // تغيير لون النص حسب حالة الإكمال
                      color: isDone
                          ? MainColors.onSurfaceSecondary
                          : MainColors.onPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
