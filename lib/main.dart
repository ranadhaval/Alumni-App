import 'package:alumni/Blocs/MainBloc/MainBlocEvent/main_bloc_event.dart';
import 'package:alumni/Blocs/MainBloc/main_bloc.dart';
// import 'package:alumni/Pages/Signup/Bloc/sinup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:alumni/Pages/OnBoarding/choose_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Constants/strings.dart';

import 'package:get_storage/get_storage.dart';
import 'Routes/page_routes.dart';
import 'Services/shared_helper.dart';
import 'themeFiles/theme_dark.dart';
import 'themeFiles/theme_light.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await SharedHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc()..add(SampleEvent()),
      child: MaterialApp(
        title: appName,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        routes: routes,
        home: const LanguageScreen(),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        locale: SharedHelper.locale,
        localeResolutionCallback: (locale, supportedLocales) {
          return const Locale('en');
        },
      ),
    );
  }
}
