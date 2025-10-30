import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/profile_image_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PickingStudentProfile extends StatelessWidget {
  const PickingStudentProfile({super.key, required this.cubit});

  final AddNewStudentDataToProgramCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (cubit.profileImage != null) {
            return GestureDetector(
              onTap: () {
                cubit.pickProfileImageFroGallery();
              },
              child: Container(
                width: 80.w,
                height: 80.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 2.w),
                ),
                child: Image.file(
                  cubit.profileImage!,
                  fit: BoxFit.cover,
                  width: 80.w,
                  height: 80.h,
                ),
              ),
            );
          }
          return ProfileImageWidget(
            onTap: () {
              cubit.pickProfileImageFroGallery();
            },
            isEditable: false,
            width: 80.w,
            height: 80.h,
            image: Assets.iconsUserProfile,
            onEditTap: () {
              cubit.pickProfileImageFroGallery();
            },
          );
        },
      ),
    );
  }
}
