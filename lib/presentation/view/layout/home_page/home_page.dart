import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/widgets/playing_program_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DataModel loginData;
  late bool isGuest;
  @override
  void initState() {
    loginData = DataModel.fromJson(
        jsonDecode(GetStorage().read(StorageEnum.loginModel.name)));
    isGuest = loginData.isGuest ?? true;
    log("${loginData.firstName}");
    log("login ${loginData.isGuest}");
    log("$isGuest");
    super.initState();
  }

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
                if (!isGuest) ...{
                  20.ph,
                  const ScreensBar(),
                  32.ph,
                  const CategoryRowWidget(
                    title: "المحاضرات القادمة",
                  ),
                  12.ph,
                  const NextLectureList(),
                },
                // if (!isGuest) ...{
                // },
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
          if (!isGuest) ...{
            32.ph,
            const PlayingProgramContainer(),
            8.ph,
          }
        ],
      ),
    );
  }
}
