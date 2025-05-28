import 'package:eazifly_student/presentation/controller/add_to_library_package_details_controller/addtolibrarypackagedetails_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AddToLibraryPackageDetailsView extends StatefulWidget {
  const AddToLibraryPackageDetailsView({super.key});

  @override
  State<AddToLibraryPackageDetailsView> createState() =>
      _AddToLibraryPackageDetailsViewState();
}

class _AddToLibraryPackageDetailsViewState
    extends State<AddToLibraryPackageDetailsView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    AddtolibrarypackagedetailsCubit.get(context).initTabBarControllers(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    var cubit = context.read<AddtolibrarypackagedetailsCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تفاصيل الباقات",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.ph,
            Text(
              "اختر بين مجموعة من الباقات و إستمتع بالمزايا الحصرية",
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            ),
            19.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) => SizedBox(
                height: 55.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomFilledTabBar(
                      margin: EdgeInsets.zero,
                      innerRadius: 12.r,
                      outerRadius: 12.cr,
                      controller: cubit.controller,
                      onTap: (v) {},
                      tabs: List.generate(
                        cubit.subscriptionTypeTabs.length,
                        (index) {
                          bool isSelected = cubit.controller.index == index;
                          return Text(
                            cubit.subscriptionTypeTabs[index],
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 12,
                              color: isSelected
                                  ? MainColors.white
                                  : MainColors.black,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 15.w,
                      top: 0.h,
                      child: OfferContainer(
                        height: 25.h,
                        width: 73.w,
                        offerText: "وفر 20%",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            18.ph,
            SizedBox(
              height: 423.h,
              child: BlocBuilder(
                bloc: cubit,
                builder: (context, state) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (context, index) => 16.pw,
                  itemBuilder: (context, index) {
                    bool isSelected = index == cubit.packageIndex;
                    return InkWell(
                      onTap: () => cubit.changePackageIndex(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 423.h,
                        width: 295.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? MainColors.blueTextColor
                                : MainColors.black,
                          ),
                          color: isSelected
                              ? MainColors.lightblue
                              : MainColors.white,
                          borderRadius: 12.cr,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            16.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "إسم الباقة",
                                  style: MainTextStyle.boldTextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "السعر / شهريا",
                                  style: MainTextStyle.boldTextStyle(
                                      fontSize: 14,
                                      color: MainColors.grayTextColors),
                                ),
                              ],
                            ),
                            8.ph,
                            const CustomHorizontalDivider(),
                            8.ph,
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) => 20.ph,
                                // padding: ,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    PackageFeatureItem(
                                  areaHeight: 48.h,
                                  text:
                                      "خر تطورات الإدارة والعلوادر موثوقة وحديثة",
                                ),
                                itemCount: 5,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            CustomElevatedButton(
              text: "إشتراك",
              color: MainColors.blueTextColor,
              radius: 16.r,
              onPressed: () {
                // TODO add programId as arguments
                Navigator.pushNamed(context, RoutePaths.programSubscriptionPlan);
              },
            ),
            32.ph,
          ],
        ),
      ),
    );
  }
}
