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
    SettingItemModel(icon: Assets.iconsProfile, label: lang.settings),
    SettingItemModel(icon: Assets.iconsProfile, label: lang.subscriptionManagement),
    SettingItemModel(icon: Assets.iconsProfile, label: lang.studentManagement),
    SettingItemModel(icon: Assets.iconsProfile, label: lang.couponsAndRewards),
    SettingItemModel(icon: Assets.iconsProfile, label: lang.notifications),
    SettingItemModel(icon: Assets.iconsProfile, label: lang.reportsAndComplaints),
    SettingItemModel(icon: Assets.iconsProfile, label: lang.privacyPolicyAndUsage),
    SettingItemModel(icon: Assets.iconsProfile, label: lang.aboutApp),

  ];
  return settingItemList;
}
