import 'package:breakingbad/cubit/app_cubit.dart';
import 'package:breakingbad/helpers/dio.dart';
import 'package:breakingbad/screens/homescreen.dart';
import 'package:breakingbad/screens/navscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/observar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getChars()
        ..getEpisode()..getQuotes()..getCompleteQuotes(id: 1),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black
              ),
              primarySwatch: Colors.blue,
            ),
            home: const NavScreen(),
          );
        },
      ),
    );
  }
}
