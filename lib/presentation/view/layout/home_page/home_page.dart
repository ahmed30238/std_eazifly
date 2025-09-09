import 'dart:convert';
import 'dart:developer';
import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/core/enums/geidea_keys.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/home/get_home_library_model.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_state.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/audios_loader.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:geideapay/geideapay.dart';
import 'package:get_storage/get_storage.dart';

DataModel? loginData;
String merchantKey = "";
String merchantSecret = "";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final plugin = GeideapayPlugin();

  // late DataModel loginData;
  late bool isGuest;
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<HomeCubit>();

    // Initialize Geidea keys first
    // _initializeGeideaKeys();

    loginData = DataModel.fromJson(
      jsonDecode(
        GetStorage().read(
          StorageEnum.loginModel.name,
        ),
      ),
    );
    context.read<LectureCubit>().fillUserId(loginData?.id ?? -1);
    isGuest = loginData?.isGuest ?? true;
    log("user id is ${loginData?.id}");

    // cubit.getHomeClosestSessions();
    // cubit.getHomeLibrary();

    // Initialize all data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.initializeHomeData();
    });
  }

// دالة منفصلة لتحميل قيم Geidea
//   Future<void> _initializeGeideaKeys() async {
//     try {
//       // احصل على merchant key
//       await cubit.getGeideaData(
//           key: GetGeideaValues.geideaApiMerchantKey.title);
//       if (cubit.getGeideaDataEntity?.data?.key ==
//           GetGeideaValues.geideaApiMerchantKey.title) {
//         merchantKey = cubit.getGeideaDataEntity?.data?.value ?? "";
//       }
//
//       // احصل على merchant secret
//       await cubit.getGeideaData(key: GetGeideaValues.geideaApiSecret.title);
//       if (cubit.getGeideaDataEntity?.data?.key ==
//           GetGeideaValues.geideaApiSecret.title) {
//         merchantSecret = cubit.getGeideaDataEntity?.data?.value ?? "";
//       }
//
//       log("Merchant Key: $merchantKey");
//       log("Merchant Secret: $merchantSecret");
//
//       // Initialize plugin after getting the keys
//       plugin.initialize(
//         serverEnvironment: ServerEnvironmentModel(
//           "title",
//           "apiBaseUrl",
//           "hppBaseUrl",
//         ),
//         publicKey: merchantKey,
//         apiPassword: merchantSecret,
//       );
//     } catch (e) {
//       log("Error initializing Geidea keys: $e");
//       // يمكنك استخدام قيم افتراضية أو إظهار رسالة خطأ
//     }
//   }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
        child: BlocBuilder<HomeNotificationCubit, HomeNotificationState>(
          builder: (context, state) {
            bool allNotificationsRead = HomeNotificationCubit
                .get(context)
                .isRead
                .every((element) => element);
            return HomeAppbar(
              loginData: loginData!,
              showBadge: !allNotificationsRead,
            );
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await cubit.refreshAllData();
        },
        child: Column(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     cubit.updateFcmToken(
            //         fcmToken: GetStorage().read(StorageEnum.fcmToken.name));
            //   },
            //   child: Text("data"),
            // ),
            // BlocBuilder<AppLanguageCubit, ApplanuageState>(
            //   builder: (context, state) {
            //     return GestureDetector(
            //       child: Text(lang.language),
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) =>
            //               BlocBuilder<AppLanguageCubit, ApplanuageState>(
            //                 builder: (context, state) {
            //                   var appLangCubit = context.read<AppLanguageCubit>();
            //                   if (state is! AppLanguageCurrentState) {
            //                     return const SizedBox();
            //                   }
            //                   return AlertDialog(
            //                     content: Container(
            //                       clipBehavior: Clip.antiAliasWithSaveLayer,
            //                       height: 130.h,
            //                       width: 150.w,
            //                       decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(25),
            //                       ),
            //                       child: Column(
            //                         mainAxisSize: MainAxisSize.min,
            //                         children: [
            //                           Expanded(
            //                             child: InkWell(
            //                               onTap: () {
            //                                 appLangCubit.storeLanguage(
            //                                     languageCode: 'ar');
            //                                 Navigator.pop(context);
            //                               },
            //                               child: IgnorePointer(
            //                                 child: Row(
            //                                   children: [
            //                                     Checkbox(
            //                                       autofocus: true,
            //                                       splashRadius: 20,
            //                                       tristate: true,
            //                                       shape: const CircleBorder(
            //                                           side: BorderSide(width: 2)),
            //                                       value: context.isArabicLanguage,
            //                                       activeColor: MainColors.primary,
            //                                       onChanged: (value) {},
            //                                     ),
            //                                     Text(
            //                                       lang.arabic,
            //                                       style:
            //                                       MainTextStyle.boldTextStyle(
            //                                           fontSize: 20,
            //                                           color:
            //                                           MainColors.primary),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                           // const HorizontalDivider(),
            //                           Expanded(
            //                             child: InkWell(
            //                               onTap: () {
            //                                 appLangCubit.storeLanguage(
            //                                     languageCode: 'en');
            //                                 Navigator.pop(context);
            //                               },
            //                               child: IgnorePointer(
            //                                 child: Row(
            //                                   children: [
            //                                     Checkbox(
            //                                       tristate: true,
            //                                       shape: const CircleBorder(
            //                                           eccentricity: 0),
            //                                       value: !context.isArabicLanguage,
            //                                       onChanged: (value) {},
            //                                     ),
            //                                     Text(
            //                                       lang.english,
            //                                       style:
            //                                       MainTextStyle.boldTextStyle(
            //                                           fontSize: 20,
            //                                           color:
            //                                           MainColors.primary),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   );
            //                 },
            //               ),
            //         );
            //       },
            //     );
            //   },
            // ),
            // Text("$merchantSecret"),
            // Text("$merchantKey"),
            // GestureDetector(
            //   onTap: () async {
            //     try {
            //       OrderApiResponse response = await plugin.checkout(
            //         context: context,
            //         checkoutOptions: GeideaService().checkoutOptions,
            //       );
            //       debugPrint('Response = $response');
            //
            //       // Payment successful, order returned in response
            //       // _updateStatus(response.detailedResponseMessage,
            //       //     truncate(response.toString()));
            //     } catch (e) {
            //       debugPrint("OrderApiResponse Error: $e");
            //       // An unexpected error due to improper SDK
            //       // integration or Plugin internal bug
            //       // _showMessage(e.toString());
            //     }
            //   },
            //   child: const Text(
            //     "geidea",
            //   ),
            // ),
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
                    CategoryRowWidget(
                      title: lang.upcomingLectures,
                      onViewAllTap: () {
                        if (cubit.getHomeClosestSessionsEntity?.data?.isEmpty ==
                            true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                lang.noUpcomingLectures,

                                style: MainTextStyle.boldTextStyle(
                                  fontSize: 12,
                                  color: MainColors.background,
                                ),
                              ),
                            ),
                          );
                          return;
                        }
                        Navigator.pushNamed(
                          context,
                          RoutePaths.viewAllNextSessions,
                        );
                      },
                    ),
                    12.ph,
                    // Next Lectures Section with loader
                    _buildNextLecturesSection(),
                  },
                  24.ph,
                  // Home Library Section with loader
                  _buildHomeLibrarySection(),
                ],
              ),
            ),
            // Current Session Section with loader
            if (!isGuest) _buildCurrentSessionSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNextLecturesSection() {
    var lang = context.loc!;
    return BlocBuilder<HomeCubit, HomeState>(
      // buildWhen: (previous, current) {
      //   return current is GetHomeClosestSessionsLoadingState ||
      //       current is GetHomeClosestSessionsSuccessState ||
      //       current is GetHomeClosestSessionsErrorState;
      // },
      builder: (context, state) {
        if (state is GetHomeClosestSessionsErrorState) {
          return _buildErrorWidget(
            message: state.errorMessage,
            onRetry: () => cubit.getHomeClosestSessions(),
          );
        }

        if (cubit.getHomeClosestSessionsLoader) {
          return _buildLoadingWidget(height: 200.h);
        }

        // Check if there's data to show
        if (cubit.getHomeClosestSessionsEntity?.data == null ||
            cubit.getHomeClosestSessionsEntity!.data!.isEmpty) {
          return _buildEmptyWidget(
              message: lang.noUpcomingLectures);
        }

        return const Hero(
          tag: "next_lectures_hero",
          child: Material(
            color: Colors.transparent,
            child: NextLectureList(),
          ),
        );
      },
    );
  }

  Widget _buildHomeLibrarySection() {
    var lang = context.loc!;
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is GetHomeLibraryLoadingState ||
            current is GetHomeLibrarySuccessState ||
            current is GetHomeLibraryErrorState;
      },
      builder: (context, state) {
        if (state is GetHomeLibraryErrorState) {
          return _buildErrorWidget(
            message: state.errorMessage,
            onRetry: () => cubit.getHomeLibrary(),
          );
        }

        if (cubit.getHomeLibraryLoader) {
          return const AudioShimmerList();
        }

        var voiceListCategories = cubit.getHomeLibraryEntity?.data
            ?.where((element) => element.type == "voice")
            .toList();

        log("$voiceListCategories ${voiceListCategories?.length}");

        if (voiceListCategories == null || voiceListCategories.isEmpty) {
          return _buildEmptyWidget(
              message: lang.noAudioContentAvailable);
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, catIndex) =>
              _buildCategoryItem(
                voiceListCategories[catIndex],
                catIndex,
                voiceListCategories,
              ),
          separatorBuilder: (context, index) => 24.ph,
          itemCount: voiceListCategories.length,
        );
      },
    );
  }

  Widget _buildCategoryItem(GetHomeLibraryDatumModel category,
      int catIndex,
      List<GetHomeLibraryDatumModel> voiceListCategories,) {
    var lang = context.loc!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            category.title ?? "",
            style: MainTextStyle.boldTextStyle(fontSize: 16),
          ),
        ),
        8.ph,
        (voiceListCategories[catIndex].items?.data == null ||
            voiceListCategories[catIndex].items!.data!.isEmpty)
            ? Text(
          lang.noItemsInThisList,
          style: MainTextStyle.boldTextStyle(fontSize: 12),
        )
            : SizedBox(
          height: 220.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var libraryCubit = context.read<LibraryCubit>();
              var listItem = voiceListCategories[catIndex];
              var item = listItem.items?.data?[index];

              return ProgramWithStatsContainer(
                onTap: libraryCubit.getLibraryItemsLoader
                    ? () {}
                    : () {
                  libraryCubit.showLibraryItem(
                    itemId: item?.id ?? 0,
                    context: context,
                  );
                },
                image: item?.image ?? "",
                likes: "2",
                noOfSubscription: "1",
                title: item?.title ?? "",
                views: "3",
              );
            },
            separatorBuilder: (context, index) => 12.pw,
            itemCount:
            voiceListCategories[catIndex].items?.data?.length ?? 0,
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentSessionSection() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is GetHomeCurrentSessionLoadingState ||
            current is GetHomeCurrentSessionSuccessState ||
            current is GetHomeCurrentSessionErrorState;
      },
      builder: (context, state) {
        if (state is GetHomeCurrentSessionErrorState) {
          return const SizedBox.shrink(); // Hide on error
        }

        // if (cubit.getHomeCurrentSessionLoader) {
        //   return Padding(
        //     padding: EdgeInsets.all(16.w),
        //     child: const Center(
        //       child: CircularProgressIndicator(),
        //     ),
        //   );
        // }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLoadingWidget({required double height}) {
    return SizedBox(
      height: height,
      child: const ShimmerWidget(),
    );
  }

  Widget _buildErrorWidget({
    required String message,
    required VoidCallback onRetry,
  }) {
    var lang = context.loc!;
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 48.w,
            color: Colors.red,
          ),
          8.ph,
          Text(
            message,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          8.ph,
          ElevatedButton(
            onPressed: onRetry,
            child: Text(lang.retry),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget({required String message}) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48.w,
            color: Colors.grey,
          ),
          8.ph,
          Text(
            message,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}