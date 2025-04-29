import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/presentation/view/layout/programs/widgets/p_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramsView extends StatelessWidget {
  const ProgramsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.thePrograms,
        leadingText: "",
        leadingCustomWidth: 10.w,
        customAction: [
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              RoutePaths.chatsViewPath,
            ),
            child: AppbarIconWidget(
              iconWidget: SvgPicture.asset(
                Assets.iconsChatsIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          4.pw,
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              RoutePaths.homeNotification,
            ),
            child: AppbarIconWidget(
              iconWidget: SvgPicture.asset(
                Assets.iconsNotificationIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          16.pw,
        ],
      ),
      body: Column(
        children: [
          8.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextFormField(
              hintText: lang.search,
              prefixIconWidget: const PrefixSearchFormField(),
              suffixIconWidget: const SuffixMenuFormField(),
            ),
          ),
          16.ph,
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 16.h),
              itemBuilder: (context, index) => Item(
                onTap: () =>
                    Navigator.pushNamed(context, RoutePaths.programDetailsView),
              ),
              separatorBuilder: (context, index) => 16.ph,
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
