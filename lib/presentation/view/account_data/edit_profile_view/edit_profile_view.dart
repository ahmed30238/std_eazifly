import 'dart:convert';

import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/profile_image_widget.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/user_name_text.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late DataModel loginData;
  @override
  void initState() {
    loginData = DataModel.fromJson(
      jsonDecode(
        GetStorage().read(StorageEnum.loginModel.name),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AccountdataCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context,
        onLeadinTap: () => Navigator.pop(context),
        mainTitle: "معلومات الحساب",
        leadingText: "الاعدادات",
        isCenterTitle: true,
        leadingIcon: Icons.arrow_back_ios,
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: cubit.formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  24.ph,
                  Center(
                    child: BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        if (cubit.profileImage != null) {
                          return GestureDetector(
                            onTap: () {
                              cubit.pickProfileImageFroGallery();
                            },
                            child: Container(
                              width: 100.w,
                              height: 100.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 2.w,
                                ),
                              ),
                              child: Image.file(
                                cubit.profileImage!,
                                fit: BoxFit.cover,
                                width: 100.w,
                                height: 100.h,
                              ),
                            ),
                          );
                        }
                        return ProfileImageWidget(
                          image: loginData.image ?? "",
                          onEditTap: () {
                            cubit.pickProfileImageFroGallery();
                          },
                        );
                      },
                    ),
                  ),
                  18.ph,
                  UserNameText(name: loginData.lastName ?? ""),
                  32.ph,
                  TitledFormFieldItem(
                    controller: cubit.nameArController,
                    validator: customValidation,
                    formfieldHintText: "محمد عصام المليجي",
                    titleText: "إسم المستخدم بالعربية",
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "إسم المستخدم بالإنجليزية",
                    validator: customValidation,
                    formfieldHintText: "",
                    controller: cubit.nameEnController,
                    // formfieldEnText: loginData.nameEn,
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "رقم التليفون",
                    controller: cubit.phoneController,
                    validator: customValidation,
                    formfieldHintText: "",
                    // formfieldEnText: "${loginData.phone}",
                    iconWidget: 0.ph,
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "whats app",
                    controller: cubit.whatsAppController,
                    validator: customValidation,
                    formfieldHintText: "",
                    // formfieldEnText: "${loginData.phone}",
                    iconWidget: 0.ph,
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "age",
                    formfieldHintText: "",
                    controller: cubit.ageController,
                    validator: customValidation,
                    // formfieldEnText: "${loginData.phone}",
                    iconWidget: 0.ph,
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "email",
                    formfieldHintText: "",
                    controller: cubit.emailController,
                    validator: customValidation,
                    iconWidget: 0.ph,
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "reason",
                    formfieldHintText: "",
                    controller: cubit.reasonController,
                    validator: customValidation,
                    iconWidget: 0.ph,
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "address",
                    validator: customValidation,
                    formfieldHintText: "",
                    controller: cubit.addressController,
                    iconWidget: 0.ph,
                  ),
                ],
              ),
            ),
          ),
          40.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => CustomElevatedButton(
              text: "تعديل",
              onPressed: cubit.updateProfileLoader
                  ? () {}
                  : () {
                      cubit.updateProfile();
                    },
              color: MainColors.blueTextColor,
              radius: 16.r,
              height: 48.h,
              width: 343.w,
              child: cubit.updateProfileLoader
                  ? const CircularProgressIndicator.adaptive()
                  : null,
            ),
          ),
          32.ph,
        ],
      ),
    );
  }
}
