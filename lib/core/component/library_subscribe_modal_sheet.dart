import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Future<dynamic> librarySubscribeModalSheet(BuildContext context) {
  return showModalSheet(
    isFixedSize: true,
    maxHeight: 120.h,
    minHeight: 120.h,
    context,
    widget: Column(
      children: [
        24.ph,
        Text(
          "هل تود الاشتراك",
          style: MainTextStyle.boldTextStyle(fontSize: 14),
        ),
        16.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  radius: 16.r,
                  height: 40.h,
                  text: "نعم",
                  color: MainColors.success,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.addToLibraryPackageDetailsView,
                    );
                  },
                ),
              ),
              10.pw,
              Expanded(
                child: CustomElevatedButton(
                  radius: 16.r,
                  height: 40.h,
                  color: MainColors.onError,
                  text: "لا",
                  onPressed: () {
                    back(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
