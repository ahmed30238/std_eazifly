// users_section_widget.dart
import 'package:eazifly_student/core/component/nested_avatar_container.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/domain/entities/home/get_home_current_session_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersSectionWidget extends StatelessWidget {
  final GetHomeCurrentSessionData sessionData;

  const UsersSectionWidget({
    super.key,
    required this.sessionData,
  });

  @override
  Widget build(BuildContext context) {
    final users = sessionData.users;
    final hasMultipleUsers = users != null && users.length > 1;
    
    if (hasMultipleUsers) {
      return _buildMultipleUsersView(users);
    } else {
      return _buildSingleUserView(users);
    }
  }

  Widget _buildMultipleUsersView(List<GetHomeCurrentSessionUser> users) {
    return NestedAvatarContainer(
      noOfItems: users.length,
      alignment: MainAxisAlignment.center,
      image: users.map<String>((e) => e.userImage ?? "").toList(),
      number: users.length.toString(),
      textColors: MainColors.onSecondary,
      areaHeigt: 26.h,
      areaWidth: 52.w,
      avatarHeigt: 24.h,
      avatarWidth: 24.w,
    );
  }

  Widget _buildSingleUserView(List<GetHomeCurrentSessionUser>? users) {
    return SizedBox(
      width: 100.w,
      child: Text(
        users?.first.userName ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: MainTextStyle.boldTextStyle(
          fontSize: 10,
          plusJakartaSans: true,
        ),
      ),
    );
  }
}