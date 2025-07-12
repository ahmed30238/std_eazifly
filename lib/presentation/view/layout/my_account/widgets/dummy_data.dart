import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:flutter/material.dart';

List<String> settingsScreensPaths = [
  RoutePaths.accountDataPath,
  RoutePaths.workingSchedule,
  RoutePaths.subscriptionManagmentPath,
  RoutePaths.studentManagement,
  RoutePaths.copounsAndDiscountsViewPath,
  RoutePaths.notificationPath,
  RoutePaths.reportsAndComplaintsViewPath,
  RoutePaths.privacyPolicyAndUsage,
  RoutePaths.aboutAppPath,
];

class SettingItemModel {
  final String icon;
  final String label;

  SettingItemModel({required this.icon, required this.label});
}
List<SettingItemModel>  settingsItemsList(BuildContext context) {
  var lang = context.loc!;

  List<SettingItemModel> settingItemList = [
    SettingItemModel(icon: Assets.iconsProfile, label: lang.accountData),
    SettingItemModel(icon: Assets.iconsSettigns, label: lang.settings),
    SettingItemModel(icon: Assets.iconsSubsManage, label: lang.subscriptionManagement),
    SettingItemModel(icon: Assets.iconsStdManage, label: lang.studentManagement),
    SettingItemModel(icon: Assets.iconsCopouns, label: lang.couponsAndRewards),
    SettingItemModel(icon: Assets.iconsNotification, label: lang.notifications),
    SettingItemModel(icon: Assets.iconsRadar, label: lang.reportsAndComplaints),
    SettingItemModel(icon: Assets.iconsAboutApp, label: lang.privacyPolicyAndUsage),
    SettingItemModel(icon: Assets.iconsAboutApp, label: lang.aboutApp),

  ];
  return settingItemList;
}
