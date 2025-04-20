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
  RoutePaths.settingsPath,
  RoutePaths.settingsPath,
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
    SettingItemModel(icon: MyImages.iconsProfile, label: lang.accountData),
    SettingItemModel(icon: MyImages.iconsProfile, label: lang.settings),
    SettingItemModel(icon: MyImages.iconsProfile, label: lang.subscriptionManagement),
    SettingItemModel(icon: MyImages.iconsProfile, label: lang.studentManagement),
    SettingItemModel(icon: MyImages.iconsProfile, label: lang.couponsAndRewards),
    SettingItemModel(icon: MyImages.iconsProfile, label: lang.notifications),
    SettingItemModel(icon: MyImages.iconsProfile, label: lang.reportsAndComplaints),
    SettingItemModel(icon: MyImages.iconsProfile, label: lang.privacyPolicyAndUsage),
    SettingItemModel(icon: MyImages.iconsProfile, label: lang.aboutApp),

  ];
  return settingItemList;
}
