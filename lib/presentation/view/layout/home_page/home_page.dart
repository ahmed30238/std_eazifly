import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/home/get_home_library_model.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_state.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/audios_loader.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';

DataModel? loginData;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late DataModel loginData;
  late bool isGuest;
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<HomeCubit>();
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

    cubit.getHomeClosestSessions();
    cubit.getHomeLibrary();

    // Initialize all data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.initializeHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
        child: BlocBuilder<HomeNotificationCubit, HomeNotificationState>(
          builder: (context, state) {
            bool allNotificationsRead = HomeNotificationCubit.get(context)
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
                      title: "المحاضرات القادمة",
                      onViewAllTap: () => Navigator.pushNamed(
                        context,
                        RoutePaths.viewAllNextSessions,
                      ),
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
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is GetHomeClosestSessionsLoadingState ||
            current is GetHomeClosestSessionsSuccessState ||
            current is GetHomeClosestSessionsErrorState;
      },
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
          return _buildEmptyWidget(message: "لا توجد محاضرات قادمة");
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
          return _buildEmptyWidget(message: "لا توجد محتويات صوتية متاحة");
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, catIndex) => _buildCategoryItem(
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

  Widget _buildCategoryItem(
    GetHomeLibraryDatumModel category,
    int catIndex,
    List<GetHomeLibraryDatumModel> voiceListCategories,
  ) {
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
                "لا يوجد عناصر في هذه القائمة",
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
            child: const Text("إعادة المحاولة"),
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
