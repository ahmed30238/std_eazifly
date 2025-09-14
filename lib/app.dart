import 'package:eazifly_student/core/lang/app_localizations.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/routes/router.dart';
import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_controller/home_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/language/applanuage_cubit.dart';
import 'package:eazifly_student/presentation/controller/language/applanuage_state.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/payment_controller/payment_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppLanguageCubit()..getAppLang()),
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider.value(value: sl<ProgramsUnderReviewCubit>()),
        // BlocProvider.value(value: sl<SimpleAudioCubit>()),
        BlocProvider.value(value: sl<MyProgramsCubit>()),
        BlocProvider.value(value: sl<HomeCubit>()),
        BlocProvider.value(value: sl<ChatsCubit>()),
        BlocProvider.value(value: sl<AddNewStudentDataToProgramCubit>()),
        BlocProvider.value(value: sl<LectureCubit>()),
        BlocProvider.value(value: sl<PaymentCubit>()),
        BlocProvider.value(value: sl<HomeNotificationCubit>()),
        BlocProvider.value(value: sl<CancelSessionCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: BlocBuilder<AppLanguageCubit, ApplanuageState>(
            builder: (context, state) {
              if (state is AppLanguageCurrentState) {
                return MaterialApp(
                  navigatorObservers: [navigatorObservers],
                  navigatorKey: navKey,
                  theme: ThemeData(
                    scaffoldBackgroundColor: MainColors.surface2,
                  ),
                  onGenerateRoute: AppRouter.onGenerateRoutes,
                  initialRoute: RoutePaths.splashScreen,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  locale: Locale(state.locale),
                  debugShowCheckedModeBanner: false,
                  title: 'هدى للناس',
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
