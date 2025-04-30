import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SelectionProgramItemDetailsView extends StatelessWidget {
  const SelectionProgramItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "ورش عمل في الخط العربي",
        leadingText: lang.back,
        isCenterTitle: true,
        leadingCustomWidth: 80.w,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.ph,
              Container(
                width: 343.w,
                height: 188.h,
                decoration: BoxDecoration(
                  borderRadius: 8.cr,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Assets.imagesPersona,
                    ),
                  ),
                ),
              ),
              12.ph,
              Text(
                "ورش عمل في الخط العربي",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 14,
                  color: MainColors.black,
                ),
              ),
              4.ph,
              Text(
                "إكتشفوا جمال تعلم القرآن من خلال دروسنا المصممة خصيصًا لقادة المستقبل",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.grayTextColors,
                ),
              ),
              16.ph,
              SizedBox(
                height: 5 * 143.h + 5 * 16.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const ProgramDataContainer(),
                  separatorBuilder: (context, index) => 16.ph,
                  itemCount: 5,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgramDataContainer extends StatelessWidget {
  const ProgramDataContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143.h,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: 8.cr,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const StudentData(),
              18.5.pw,
              const TeacherData(),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  Assets.iconsVerticalDots,
                ),
              ),
            ],
          ),
          const CustomHorizontalDivider(),
          const LectureDates(),
        ],
      ),
    );
  }
}

class LectureDates extends StatelessWidget {
  const LectureDates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "المواعيد",
          style: MainTextStyle.boldTextStyle(
            fontSize: 12,
            color: MainColors.blueTextColor,
          ),
        ),
        51.pw,
        ...List.generate(
          3,
          (index) => Container(
            margin: EdgeInsets.symmetric(
              horizontal: index == 1 ? 32.w : 0,
            ),
            height: 46.h,
            width: 54.w,
            child: Column(
              children: [
                Text(
                  "السبت",
                  style: MainTextStyle.boldTextStyle(
                      fontSize: 12, color: MainColors.grayTextColors),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "12:45 PM",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TeacherData extends StatelessWidget {
  const TeacherData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.w,
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "المعلم",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
            ),
          ),
          4.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageContainer(
                containerHeight: 24.h,
                containerWidth: 24.w,
                radius: 8.r,
              ),
              4.pw,
              Text(
                "علي وائل",
                style: MainTextStyle.boldTextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}

class StudentData extends StatelessWidget {
  const StudentData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 42.h,
      child: Column(
        children: [
          Row(
            children: [
              ImageContainer(
                containerHeight: 40.h,
                containerWidth: 40.w,
                shape: BoxShape.circle,
              ),
              8.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "أحمد عبدالرحيم",
                    style: MainTextStyle.boldTextStyle(fontSize: 12),
                  ),
                  4.ph,
                  Text(
                    "61 عام",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
