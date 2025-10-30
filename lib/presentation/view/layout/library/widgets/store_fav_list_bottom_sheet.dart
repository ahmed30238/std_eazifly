import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/all_items_bottom_sheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StoreFavouriteListBottomSheet extends StatelessWidget {
  final LibraryCubit cubit;

  const StoreFavouriteListBottomSheet({super.key, required this.cubit});

  // StreamSubscription? cubitSubscription;
  void onTapInsideBottomSheet(context) {
    if (cubit.formKey.currentState?.validate() == false) {
      return;
    }
    // 1. إغلاق البوتوم شيت الحالية
    Navigator.pop(context);

    // // 2. إظهار شيت اللودينغ
    // showModalSheet(
    //   context,
    //   maxHeight: 120.h,
    //   minHeight: 110.h,
    //   widget: const Center(child: CircularProgressIndicator.adaptive()),
    //   isDismissed: false,
    // );

    // 3. طلب الداتا

    showModalSheet(
      context,
      maxHeight: 609.h,
      minHeight: 608.h,
      isFixedSize: true,
      widget: BlocProvider.value(
        value: cubit,
        child: const AllItemsBottomSheet(),
      ), // عرض البيانات
    );

    // 4. الاستماع للتغيرات
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MainColors.background,
          borderRadius: 16.cr,
        ),
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              36.ph,
              Container(
                height: 143.h,
                width: 343.w,
                decoration: BoxDecoration(
                  borderRadius: 8.cr,
                  color: MainColors.surfaceVariant,
                ),
                child: cubit.favListImage != null
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: 8.cr,
                            child: Image.file(
                              cubit.favListImage!,
                              fit: BoxFit.cover,
                              width: 343.w,
                              height: 143.h,
                            ),
                          ),
                          IconButton(
                            color: MainColors.background,
                            onPressed: () {
                              cubit.clearImages();
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            fit: BoxFit.cover,
                            width: 343.w,
                            height: 110.h,
                            Assets.iconsMusic,
                          ),
                          CustomLowSizeButton(
                            btnColor: MainColors.background,
                            width: 127.w,
                            text: "اضغط لتحديد الصورة",
                            onTap: () {
                              cubit.pickFavImageImageFroGallery();
                            },
                          ),
                        ],
                      ),
              ),
              16.ph,
              Text(
                "اسم القائمة",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
              8.ph,
              CustomTextFormField(
                hintText: "اكتب هنا",
                controller: cubit.favouriteListController,
                validator: customValidation,
              ),
              32.ph,
              Align(
                alignment: Alignment.center,
                child: CustomElevatedButton(
                  text: "انشاء",
                  color: MainColors.primary,
                  height: 48.h,
                  width: 241.w,
                  radius: 16.r,
                  onPressed: () => onTapInsideBottomSheet(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
