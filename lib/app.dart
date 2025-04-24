import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/routes/router.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/presentation/controller/language/applanuage_cubit.dart';
import 'package:eazifly_student/presentation/controller/language/applanuage_state.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
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
        BlocProvider(create: (context) => LectureCubit()),
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
                  initialRoute: RoutePaths.groupPackageManagement,
                  //  GetStorage().hasData(TokenEnum.token.name)
                  //     ? RoutePaths.layoutPath
                  //     : RoutePaths.loginPath,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  locale: Locale(langCubit.langKey),
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  // home: Layout(),
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
