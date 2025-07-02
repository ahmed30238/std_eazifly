import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/routes/router.dart';
import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/language/applanuage_cubit.dart';
import 'package:eazifly_student/presentation/controller/language/applanuage_state.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/payment_controller/payment_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ApplanuageCubit()..getAppLang()),
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => sl<ProgramsUnderReviewCubit>()),
        BlocProvider(
            create: (context) => sl<AddNewStudentDataToProgramCubit>()),
        BlocProvider(
            create: (context) => LectureCubit(
                  showProgramDetailsUsecase: sl(),
                  getProgramSessionsUsecase: sl(),
                  getProgramAssignmentsUsecase: sl(),
                  getUserReportsUsecase: sl(),
                  getUserFeedbacksUsecase: sl(),
                  completeChapterLessonUsecase: sl(),
                  getChapterLessonsUsecase: sl(),
                  getContentChaptersUsecase: sl(),
                  getUserQuizzesUsecase: sl(),
                  getAssignmentDetailsUsecase: sl(),
                  postAssignmentUsecase: sl(),
                  getReportQuestionsUsecase: sl(),
                )),
        BlocProvider(create: (context) => sl<PaymentCubit>()),
        BlocProvider(create: (context) => sl<CancelSessionCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: BlocBuilder<ApplanuageCubit, ApplanuageState>(
            builder: (context, state) {
              if (state is AppLanguageCurrentState) {
                var langCubit = ApplanuageCubit().get(context);
                return MaterialApp(
                  navigatorObservers: [navigatorObservers],
                  navigatorKey: navKey,
                  theme: ThemeData(
                    scaffoldBackgroundColor: MainColors.scaffoldWhite,
                  ),
                  onGenerateRoute: AppRouter.onGenerateRoutes,
                  initialRoute: RoutePaths.splashScreen,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  locale: Locale(langCubit.langKey),
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
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
