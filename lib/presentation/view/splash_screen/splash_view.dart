import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
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
    Future.delayed(const Duration(seconds: 3), () {
      final String token = TokenUtil.getTokenFromMemory();
      print(token);
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
          // var notificationCubit = HomeNotificationCubit.get(context);
          // var chatCubit = ChatsCubit.get(context);
          // NotificationService.instance.setCubit(notificationCubit);
          // NotificationService.instance.setChatsCubit(chatCubit);
        },
      );
    }
    init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.white, // استخدم لونك الأساسي
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.iconsAppLogo,
                width: 150.w,
                height: 150.h,
              ),
              SizedBox(height: 20.h),
              Text(
                'EaziFly Student',
                style: MainTextStyle.boldTextStyle(
                  fontSize: 24,
                  plusJakartaSans: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
