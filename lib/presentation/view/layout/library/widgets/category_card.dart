import 'package:eazifly_student/data/models/library/get_library_categories_model.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CategoryCard extends StatelessWidget {
  final LibraryCategoryDatumModel? voiceListCategories;
  final VoidCallback onTap;
  const CategoryCard({
    super.key,
    required this.voiceListCategories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LibraryCubit>();
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 220.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var listItem = voiceListCategories?.lists?[index];
            return ProgramWithStatsContainer(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.audioPlayListView,
                  arguments: {"cubit": cubit, "listId": listItem?.id},
                );
              },
              image: listItem?.image ?? "",
              likes: "2",
              noOfSubscription: "1",
              title: listItem?.title ?? "",
              views: "3",
            );
          },
          separatorBuilder: (context, index) => 12.pw,
          itemCount: voiceListCategories?.lists?.length ?? 0,
        ),
      ),
    );
  }
}
