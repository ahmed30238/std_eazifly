import 'package:eazifly_student/presentation/view/layout/home_page/widgets/playing_program_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    // var cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: const HomeAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                16.ph,
                CustomTextFormField(
                  hintText: lang.search,
                  prefixIconWidget: const PrefixSearchFormField(),
                ),
                16.ph,
                const HomeCarousel(),
                20.ph,
                const ScreensBar(),
                32.ph,
                const CategoryRowWidget(
                  title: "المحاضرات القادمة",
                ),
                12.ph,
                const NextLectureList(),
                24.ph,
                const CategoryRowWidget(
                  title: "الأكثر تداولا",
                ),
                8.ph,
                const HomeBestSellersList(),
                24.ph,
                const CategoryRowWidget(
                  title: "وصل حديثا",
                ),
                8.ph,
                const NewComingList(),
              ],
            ),
          ),
          32.ph,
          const PlayingProgramContainer(),
          8.ph,
        ],
      ),
    );
  }
}


