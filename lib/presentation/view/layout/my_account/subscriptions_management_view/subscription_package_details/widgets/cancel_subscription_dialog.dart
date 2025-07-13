// Dialog Function
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

void showCancelSubscriptionDialog(
  BuildContext context, {
  required SubscriptionmanagementCubit cubit,
  required int mainId,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: cubit,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: 15.cr,
          ),
          title: Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: 28,
              ),
              10.pw,
              Text(
                "تأكيد الإلغاء",
                style: MainTextStyle.boldTextStyle(fontSize: 18),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "هل أنت متأكد من إلغاء الاشتراك؟",
                style: MainTextStyle.regularTextStyle(fontSize: 16),
              ),
              10.ph,
              Text(
                "سيتم إيقاف جميع الخدمات المرتبطة بهذا الاشتراك",
                style: MainTextStyle.regularTextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          actions: [
            // زر الإلغاء
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الـ dialog
              },
              child: Text(
                "تراجع",
                style: MainTextStyle.regularTextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
            // زر التأكيد
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الـ dialog
                cubit.cancelSubscription(
                  mainId: mainId,
                ); // تنفيذ إلغاء الاشتراك
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: 8.cr,
                ),
              ),
              child: Text(
                "تأكيد الإلغاء",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
