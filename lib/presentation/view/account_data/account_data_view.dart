import 'dart:developer';

import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/home_appbar.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/profile_image_widget.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/user_name_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AccountData extends StatefulWidget {
  const AccountData({super.key});

  @override
  State<AccountData> createState() => _AccountDataState();
}

class _AccountDataState extends State<AccountData> {
  // late LoginDataModel loginData;
  // @override
  // void initState() {
  //   loginData = LoginDataModel.fromJson(
  //     jsonDecode(
  //       GetStorage().read(StorageEnum.loginModel.name),
  //     ),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    AccountdataCubit cubit = AccountdataCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onLeadinTap: () => Navigator.pop(context),
        mainTitle: "معلومات الحساب",
        leadingText: "الاعدادات",
        isCenterTitle: true,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const AppbarIconWidget(
              iconWidget: Icon(
                Icons.edit,
              ),
            ),
          )
        ],
        leadingIcon: Icons.arrow_back_ios,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          24.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => ProfileImageWidget(
              decorationImage: DecorationImage(
                fit: BoxFit.cover,
                image: cubit.profileImage != null
                    ? FileImage(
                        cubit.profileImage!,
                      )
                    : const NetworkImage(
                        "loginData.image",
                      ),
              ),
              onEditTap: () {
                cubit.pickProfileImageFroGallery();
              },
            ),
          ),
          18.ph,
          const UserNameText(name: "loginData.nameEn ?? " ""),
          32.ph,
          TitledFormFieldItem(
            enabled: false,
            controller: TextEditingController(text: " loginData.nameAr"),
            formfieldHintText: "محمد عصام المليجي",
            titleText: "إسم المستخدم بالعربية",
          ),
          16.ph,
          TitledFormFieldItem(
            iconWidget: 0.ph,
            enabled: false,
            titleText: "العنوان",
            formfieldHintText: "",
            controller: TextEditingController(text: "loginData.address"),
            // formfieldEnText: "loginData.address",
          ),
          16.ph,
          const TitledFormFieldItem(
            enabled: false,
            titleText: "البريد الالكتروني",
            formfieldHintText: "",
            formfieldEnText: "{loginData.phone}",
            iconWidget: Icon(
              Icons.done_all_outlined,
              color: MainColors.blueMoreTextColor,
            ),
          ),
          16.ph,
          const TitledFormFieldItem(
            enabled: false,
            titleText: "كلمة المرور",
            iconWidget: Icon(
              Icons.done_all_outlined,
              color: MainColors.blueMoreTextColor,
            ),
            formfieldHintText: "Ahmed@gmail.com",
          ),
          32.ph,
          GestureDetector(
            onTap: () {log("message");},
            child: SizedBox(
              width: 180.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    MyImages.deleteBin,
                  ),
                  4.pw,
                  Text(
                    "حذف الحساب",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          20.ph,
          CustomElevatedButton(
            text: "تسجيل خروج",
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog.adaptive(
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                          text: "نعم",
                          color: MainColors.red,
                          elevatedButtonWidth: 110.w,
                          radius: 16.r,
                          onPressed: () async {
                            await TokenUtil.clearToken().then(
                              (value) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RoutePaths.loginPath,
                                  (route) => false,
                                );
                              },
                            );
                          },
                        ),
                        CustomElevatedButton(
                          radius: 16.r,
                          text: "لا",
                          elevatedButtonWidth: 110.w,
                          color: MainColors.greenTeal,
                          onPressed: () {
                            back(context);
                          },
                        ),
                      ],
                    ),
                  ],
                  title: Text(
                    "هل انت متاكد من تسجيل الخروج",
                    style: MainTextStyle.boldTextStyle(fontSize: 18),
                  ),
                ),
              );
            },
            color: MainColors.blueTextColor,
            radius: 16.r,
            elevatedButtonheight: 48.h,
            elevatedButtonWidth: 343.w,
          ),
          48.ph,
        ],
      ),
    );
  }
}
