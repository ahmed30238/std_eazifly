import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/view/chat/widgets/instrutors-tap.dart';
import 'package:eazifly_student/presentation/view/chat/widgets/management_tap_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView>
    with SingleTickerProviderStateMixin {
  late final ChatsCubit cubit;
  bool _isInitialized = false;

  @override
  void initState() {
    cubit = ChatsCubit.get(context);
    cubit.getMyChats();
    super.initState();
  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
    if (!_isInitialized) {
      cubit.initController(this, context);
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabsList = _getTabs(context);
    var lang = context.loc!;

    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.messages,
        leadingText: lang.ourCommunity,
        leadingIcon: Icons.arrow_back_ios,
        onLeadinTap: () => Navigator.pop(context),
        isCenterTitle: true,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: IconsContainer(
              iconWidget: SvgPicture.asset(
                fit: BoxFit.scaleDown,
                Assets.iconsAdd,
                colorFilter: ColorFilter.mode(
                  MainColors.primary,
                  BlendMode.srcIn,
                ),
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
                controller: cubit.controller!,
                tabs: List.generate(tabsList.length, (index) {
                  bool isSelected = index == cubit.controller?.index;
                  return Text(
                    tabsList[index],
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? MainColors.primary
                          : MainColors.onSurfaceSecondary,
                    ),
                  );
                }),
              );
            },
          ),
          4.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => SizedBox(
              height: 600.h,
              child: TabBarView(
                controller: cubit.controller,
                children: [
                  InstructorsTapWidget(cubit: cubit),
                  ManagementTapWidget(cubit: cubit),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getTabs(BuildContext context) {
    var lang = context.loc!;
    return [lang.professors, lang.appManagement];
  }
}
