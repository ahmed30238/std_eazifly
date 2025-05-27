import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/presentation/controller/programs_controller/programs_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_controller/programs_state.dart';
import 'package:eazifly_student/presentation/view/layout/programs/widgets/p_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramsView extends StatefulWidget {
  const ProgramsView({super.key});

  @override
  State<ProgramsView> createState() => _ProgramsViewState();
}

class _ProgramsViewState extends State<ProgramsView> {
  late ProgramsCubit cubit;
  @override
  void initState() {
    cubit = ProgramsCubit.get(context);
    cubit.getPrograms();
    super.initState();
  }

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
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              // Show loader if state is loading
              if (cubit.getProgramsLoading) {
                return const Center(
                  child: CircularProgressIndicator(), // TODO replace with shimmer 
                );
              }

              // Show error message if state is error
              if (state is GetProgramsErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }

              // Default case (LoadedState or similar)
              var programsList = cubit.getProgramsEntity?.data;

              return Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 16.h),
                  itemBuilder: (context, index) => ProgramItem(
                    programEntity: programsList?[index] ?? GetProgramsProgramEntity(),
                    onTap: () => Navigator.pushNamed(
                      arguments: {
                        "programId": programsList?[index].id,
                      },
                      context,
                      RoutePaths.programDetailsView,
                    ),
                  ),
                  separatorBuilder: (context, index) => 16.ph,
                  itemCount: programsList?.length ?? 0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
