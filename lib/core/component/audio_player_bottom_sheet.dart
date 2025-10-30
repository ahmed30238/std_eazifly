import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

void showAudioPlayerBottomSheet(
  BuildContext context,
  String title,
  LibraryCubit cubit,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) => BlocProvider.value(
      value: cubit,
      // create: (context) => SubjectCubit(),
      child: Container(
        padding: EdgeInsets.all(20.w),
        height: 250.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // عنوان الملف
            Text(
              title,
              style: MainTextStyle.boldTextStyle(fontSize: 16),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            20.ph,

            // شريط التقدم
            BlocBuilder<LibraryCubit, LibraryState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Slider(
                      value: cubit.totalDuration.inSeconds > 0
                          ? cubit.currentPosition.inSeconds.toDouble()
                          : 0.0,
                      max: cubit.totalDuration.inSeconds.toDouble(),
                      onChanged: (value) {
                        cubit.audioPlayer.seek(
                          Duration(seconds: value.toInt()),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatDuration(cubit.currentPosition)),
                        Text(formatDuration(cubit.totalDuration)),
                      ],
                    ),
                  ],
                );
              },
            ),

            20.ph,

            // أزرار التحكم
            BlocBuilder<LibraryCubit, LibraryState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // زر الترجيع 10 ثواني
                    IconButton(
                      onPressed: () => cubit.seekBackward(),
                      icon: Icon(Icons.replay_10, size: 30.w),
                    ),

                    // زر التشغيل/الإيقاف
                    Container(
                      decoration: const BoxDecoration(
                        color: MainColors.success,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => cubit.togglePlayPause(),
                        icon: Icon(
                          cubit.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 35.w,
                        ),
                      ),
                    ),

                    // زر التقديم 10 ثواني
                    IconButton(
                      onPressed: () => cubit.seekForward(),
                      icon: Icon(Icons.forward_10, size: 30.w),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
