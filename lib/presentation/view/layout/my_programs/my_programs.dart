import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/program_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class MyProgramsView extends StatefulWidget {
  const MyProgramsView({super.key});

  @override
  State<MyProgramsView> createState() => _MyProgramsViewState();
}

class _MyProgramsViewState extends State<MyProgramsView> {
  late MyProgramsCubit cubit;
  @override
  void initState() {
    cubit = context.read<MyProgramsCubit>();
    cubit.getMyPrograms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.myPrograms,
        leadingText: "",
        leadingCustomWidth: 10.w,
        customAction: [
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              RoutePaths.programsUnderReviewView,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: SvgPicture.asset(Assets.iconsMyProgramAppbar),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          16.ph,
          CustomTextFormField(
            prefixIconWidget: const PrefixSearchFormField(),
            controller: TextEditingController(),
            hintText: lang.search,
            suffixIconWidget: const SuffixMenuFormField(),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              var myPrograms = cubit.getMyProgramsEntity?.data;
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = myPrograms?[index];
                  return ProgramItem(
                    desc: item?.description ?? "no desc",
                    duration: item?.duration ?? "0",
                    image: item?.image ?? "",
                    nextLec: item?.nextSession?.toIso8601String()??"",
                    title: item?.title ?? "",
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutePaths.navigateToLectureView);
                    },
                  );
                },
                separatorBuilder: (context, index) => 20.ph,
                itemCount: myPrograms?.length ?? 0,
              );
            },
          ),
          // ProgramItem(
          //   onTap: () =>
          // ),
          20.ph,
          // InkWell(
          //   onTap: () => Navigator.pushNamed(
          //     context,
          //     RoutePaths.selectionOfEducationalCoursesView,
          //   ),
          //   child: const CollectionSessionList(),
          // ),
          20.ph,
        ],
      ),
    );
  }
}
