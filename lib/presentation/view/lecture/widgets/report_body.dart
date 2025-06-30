import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/report_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:intl/intl.dart'; // للتعامل مع التواريخ

class ReportBody extends StatelessWidget {
  const ReportBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LectureCubit>();
    var reports = cubit.getUserReportsEntity?.data;

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var report = reports?[index];
        var type = report?.reportMakerType;
        var instructor = type == "instructor";
        String teacher = "العلم";
        String client = "الإدارة";
        String from = instructor ? teacher : client;
        return ReportItem(
          createdAt: "",
          description: formatDateWithAmPm(report?.createdAt?.toString()),
          title:
              "تقرير للطالب ${report?.reportForName} من $from ${report?.reportMakerName}",
          onTap: () {
            Navigator.pushNamed(
              arguments: index,
              context,
              RoutePaths.lectureReportView,
            );
          },
        );
      },
      separatorBuilder: (context, index) => const SeparatedWidget(),
      itemCount: reports?.length ?? 0,
    );
  }
}

// دالة لتنسيق التاريخ والوقت بنظام AM/PM
String formatDateWithAmPm(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return "غير محدد";
  }

  try {
    DateTime date = DateTime.parse(dateString);

    // تنسيق التاريخ
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);

    // تنسيق الوقت بنظام AM/PM
    String formattedTime = DateFormat('hh:mm a').format(date);

    return "$formattedDate في $formattedTime";
  } catch (e) {
    // إذا فشل parsing التاريخ، أرجع النص كما هو
    return dateString;
  }
}
