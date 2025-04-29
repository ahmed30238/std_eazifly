import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/component/prefix_search_form_field.dart';
import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/view/chat/widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    ChatsCubit.get(context).initController(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    ChatsCubit cubit = ChatsCubit.get(context);
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.messages,
        leadingText: lang.home,
        leadingIcon: Icons.arrow_back_ios,
        // onLeadinTap: () => Navigator.pop(context),
        isCenterTitle: true,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: IconsContainer(
              iconWidget: SvgPicture.asset(
                fit: BoxFit.scaleDown,
                Assets.iconsAddSquare,
              ),
            ),
          ),
        ],
        leadingCustomWidth: 100.w,
      ),
      body: ListView(
        children: [
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextFormField(
              hintText: lang.search,
              prefixIconWidget: const PrefixSearchFormField(),
              suffixIconWidget: const SuffixMenuFormField(),
            ),
          ),
          16.ph,
          BlocBuilder<ChatsCubit, ChatsState>(
            builder: (BuildContext context, ChatsState state) {
              return CustomTabBar(
                controller: cubit.controller,
                tabs: List.generate(
                  cubit.tabs(context: context).length,
                  (index) {
                    bool isSelected = index == cubit.controller.index;
                    return Text(
                      cubit.tabs(context: context)[index],
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? MainColors.blueTextColor
                            : MainColors.grayTextColors,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          4.ph,
          SizedBox(
              height: 600.h,
              child: TabBarView(
                controller: cubit.controller,
                children: [
                  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 8,
                    separatorBuilder: (context, index) => SeparatedWidget(
                      dividerColor: MainColors.lightGray,
                      verticalPadding: 8.h,
                    ),
                    itemBuilder: (context, index) => ChatItem(
                      onTap: () => Navigator.pushNamed(
                        arguments: {
                          "cubit": cubit,
                          "isReport": false,
                          "problemState": "",
                        },
                        context,
                        RoutePaths.dmViewPath,
                      ),
                    ),
                  ),
                  const Text("data"),
                ],
              ))
        ],
      ),
    );
  }
}
