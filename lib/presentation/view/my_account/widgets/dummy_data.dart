import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:flutter/material.dart';

List<String> settingsScreensPaths = [
  RoutePaths.accountDataPath,
  RoutePaths.workingSchedule,
  RoutePaths.financialTransactionPath,
  RoutePaths.studentManagement,
  RoutePaths.settingsPath,
  RoutePaths.settingsPath,
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
    SettingItemModel(icon: MyImages.profile, label: lang.accountData),
    SettingItemModel(icon: MyImages.profile, label: lang.settings),
    SettingItemModel(icon: MyImages.profile, label: lang.subscriptionManagement),
    SettingItemModel(icon: MyImages.profile, label: lang.studentManagement),
    SettingItemModel(icon: MyImages.profile, label: lang.couponsAndRewards),
    SettingItemModel(icon: MyImages.profile, label: lang.notifications),
    SettingItemModel(icon: MyImages.profile, label: lang.reportsAndComplaints),
    SettingItemModel(icon: MyImages.profile, label: lang.privacyPolicyAndUsage),
    SettingItemModel(icon: MyImages.profile, label: lang.aboutApp),

  ];
  return settingItemList;
  
}
