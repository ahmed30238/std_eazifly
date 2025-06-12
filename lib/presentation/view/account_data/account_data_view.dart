import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/home_appbar.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/profile_image_widget.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/user_name_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';

class AccountData extends StatefulWidget {
  const AccountData({super.key});

  @override
  State<AccountData> createState() => _AccountDataState();
}

class _AccountDataState extends State<AccountData> {
  late DataModel loginData;
  @override
  void initState() {
    loginData = DataModel.fromJson(
      jsonDecode(
        GetStorage().read(
          StorageEnum.loginModel.name,
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AccountdataCubit cubit = AccountdataCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context,
        // onLeadinTap: () => Navigator.pop(context),
        mainTitle: "معلومات الحساب",
        leadingText: "الاعدادات",
        isCenterTitle: true,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppbarIconWidget(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.editProfile,
                  arguments: cubit,
                );
              },
              iconWidget: const Icon(
                Icons.edit,
              ),
            ),
          )
        ],
        leadingIcon: Icons.arrow_back_ios,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                24.ph,
                BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) => ProfileImageWidget(
                    isEditable: false,
                    image: loginData.image ?? "",
                    onEditTap: () {
                      cubit.pickProfileImageFroGallery();
                    },
                  ),
                ),
                18.ph,
                UserNameText(
                    name: "${loginData.firstName} ${loginData.lastName}"),
                32.ph,
                TitledFormFieldItem(
                  enabled: false,
                  controller: TextEditingController(
                      text: "${loginData.firstName} ${loginData.lastName}"),
                  formfieldHintText: "",
                  titleText: "إسم المستخدم بالعربية",
                ),
                16.ph,
                TitledFormFieldItem(
                  iconWidget: 0.ph,
                  enabled: false,
                  titleText: "العنوان",
                  formfieldHintText: "",
                  controller: TextEditingController(
                      text: loginData.parentName ?? "No Address"),
                  // formfieldEnText: "loginData.address",
                ),
                16.ph,
                TitledFormFieldItem(
                  enabled: false,
                  titleText: "البريد الالكتروني",
                  formfieldHintText: "",
                  formfieldEnText: "${loginData.email}",
                  iconWidget: const Icon(
                    Icons.done_all_outlined,
                    color: MainColors.blueMoreTextColor,
                  ),
                ),
                // 16.ph,
                // const TitledFormFieldItem(
                //   enabled: false,
                //   titleText: "كلمة المرور",
                //   iconWidget: Icon(
                //     Icons.done_all_outlined,
                //     color: MainColors.blueMoreTextColor,
                //   ),
                //   formfieldHintText: "Ahmed@gmail.com",
                // ),
                32.ph,
                GestureDetector(
                  onTap: () {
                    log("message");
                  },
                  child: SizedBox(
                    width: 180.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          Assets.iconsDeleteBin,
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
              ],
            ),
          ),
          8.ph,
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
                          width: 110.w,
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
                          width: 110.w,
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
            height: 48.h,
            width: 343.w,
          ),
          48.ph,
        ],
      ),
    );
  }
}
