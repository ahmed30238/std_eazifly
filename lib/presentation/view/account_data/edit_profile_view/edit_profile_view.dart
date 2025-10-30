import 'dart:developer';

import 'package:eazifly_student/core/component/custom_drop_down.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/core/enums/gender_enum.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/profile_image_widget.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/user_name_text.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
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
                          image: loginData?.image ?? "",
                          onEditTap: () {
                            cubit.pickProfileImageFroGallery();
                          },
                        );
                      },
                    ),
                  ),
                  18.ph,
                  UserNameText(
                    name: "${loginData?.firstName} ${loginData?.lastName}",
                  ),
                  32.ph,
                  TitledFormFieldItem(
                    controller: cubit.firstNameController,
                    validator: customValidation,

                    formfieldHintText: "محمد عصام المليجي",
                    titleText: "الاسم الاول",
                    iconWidget: 0.ph,
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "إسم العائلة",
                    validator: customValidation,
                    formfieldHintText: "",
                    controller: cubit.lastNameController,
                    // formfieldEnText: loginData.nameEn,
                    iconWidget: 12.ph,
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
                    titleText: "اسم المستخدم",
                    formfieldHintText: "",
                    controller: cubit.userNameController,
                    validator: customValidation,
                    iconWidget: 0.ph,
                  ),
                  16.ph,
                  // في EditProfile Widget - تعديل جزء الـ Gender Dropdown

                  // استبدل هذا الجزء في build method:
                  Text(
                    "النوع",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                      color: MainColors.onSecondary,
                    ),
                  ),
                  8.ph,
                  CustomizedDropdownWidget<GenderEnum>(
                    initialValue: cubit.gender,
                    onChanged: (val) {
                      cubit.onGenderChange(val ?? GenderEnum.male);
                      log("Selected gender: $val");
                    },
                    hintText: "اختر النوع",
                    items: GenderEnum.values
                        .map(
                          (e) => DropdownMenuItem<GenderEnum>(
                            value: e,
                            child: Text(
                              e.title,
                              style: MainTextStyle.boldTextStyle(fontSize: 14),
                            ),
                          ),
                        )
                        .toList(),
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
              color: MainColors.primary,
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
