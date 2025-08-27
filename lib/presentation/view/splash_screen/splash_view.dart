import 'package:eazifly_student/core/fire_base_helper/firebase_notifiction.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    // الانتقال للشاشة التالية بعد انتهاء المؤقت
    Future.delayed(const Duration(seconds: 1), () {
      final String token = TokenUtil.getTokenFromMemory();
      if (token.isEmpty) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutePaths.loginPath,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutePaths.layoutPath,
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool init = true;
  @override
  void didChangeDependencies() {
    if (init) {
      Future.delayed(
        const Duration(
          milliseconds: 200,
        ),
        () {
          var notificationCubit = context.read<HomeNotificationCubit>();
          var chatCubit = context.read<ChatsCubit>();
          NotificationService.instance.setCubit(notificationCubit);
          NotificationService.instance.setChatsCubit(chatCubit);
        },
      );
    }
    init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.background,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.iconsAppLogo,
                width: 150.w,
                height: 150.h,
              ),
              SizedBox(height: 20.h),
              Text(
                'هدى للناس',
                style: MainTextStyle.boldTextStyle(
                  fontSize: 24,
                  // plusJakartaSans: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
