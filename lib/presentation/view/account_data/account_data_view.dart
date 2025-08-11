import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/home_appbar.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/profile_image_widget.dart';
import 'package:eazifly_student/presentation/view/account_data/widgets/user_name_text.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
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
                    image: loginData?.image ?? "",
                    onEditTap: () {
                      cubit.pickProfileImageFroGallery();
                    },
                  ),
                ),
                18.ph,
                UserNameText(
                    name: "${loginData?.firstName} ${loginData?.lastName}"),
                32.ph,
                TitledFormFieldItem(
                  enabled: false,
                  iconWidget: 0.ph,
                  controller:
                      TextEditingController(text: "${loginData?.userName}"),
                  formfieldHintText: "",
                  titleText: "اسم المستخدم",
                ),
                16.ph,
                TitledFormFieldItem(
                  iconWidget: 0.ph,
                  enabled: false,
                  titleText: "الهاتف",
                  formfieldHintText: "",
                  controller: TextEditingController(
                      text: loginData?.phone ?? "No Address"),
                  // formfieldEnText: "loginData?.address",
                ),
                16.ph,
                TitledFormFieldItem(
                  enabled: false,
                  titleText: "البريد الالكتروني",
                  formfieldHintText: "",
                  formfieldEnText: "${loginData?.email}",
                  iconWidget: Icon(
                    Icons.done_all_outlined,
                    color: MainColors.secondaryDark,
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
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog.adaptive(
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder(
                                bloc: cubit,
                                builder: (context, state) =>
                                    CustomElevatedButton(
                                  text: "نعم",
                                  color: MainColors.onError,
                                  width: 110.w,
                                  radius: 16.r,
                                  onPressed: cubit.deleteAccountLoader
                                      ? () {}
                                      : () async {
                                          // هنا يمكنك إضافة منطق حذف الحساب
                                          await cubit.deleteAccount(context);
                                        },
                                  child: cubit.deleteAccountLoader
                                      ? const CircularProgressIndicator
                                          .adaptive()
                                      : null,
                                ),
                              ),
                              CustomElevatedButton(
                                radius: 16.r,
                                text: "لا",
                                width: 110.w,
                                color: MainColors.success,
                                onPressed: () {
                                  back(context);
                                },
                              ),
                            ],
                          ),
                        ],
                        title: Text(
                          "هل أنت متأكد من حذف الحساب؟",
                          style: MainTextStyle.boldTextStyle(fontSize: 18),
                        ),
                        content: Text(
                          "سيتم حذف جميع بياناتك نهائياً ولا يمكن التراجع عن هذا الإجراء",
                          style: MainTextStyle.regularTextStyle(
                            fontSize: 14,
                            color: MainColors.surfaceVariant,
                          ),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 180.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          Assets.iconsDeleteBin,
                          colorFilter: const ColorFilter.mode(
                            MainColors.error,
                            BlendMode.srcIn,
                          ),
                        ),
                        4.pw,
                        Text(
                          "حذف الحساب",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.error,
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
                        BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) => CustomElevatedButton(
                            text: "نعم",
                            color: MainColors.error,
                            width: 110.w,
                            radius: 16.r,
                            onPressed: cubit.logoutLoader
                                ? () {}
                                : () async {
                                    await cubit.logout(context);
                                  },
                            child: cubit.logoutLoader
                                ? const CircularProgressIndicator.adaptive()
                                : null,
                          ),
                        ),
                        CustomElevatedButton(
                          radius: 16.r,
                          text: "لا",
                          width: 110.w,
                          color: MainColors.success,
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
            color: MainColors.primary,
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
