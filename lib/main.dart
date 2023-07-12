import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled/view/dashboard_page.dart';
import 'package:untitled/view/login_page.dart';
import 'package:untitled/view/home_page.dart';
import 'package:untitled/view/splash_screen.dart';
import 'package:untitled/view_model/login/login_bloc.dart';
import 'package:untitled/view_model/splash_screen/splash_screen_bloc.dart';

void main() {
  runApp(const MyApp());
  // Konfigurasi EasyLoading
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..maskType = EasyLoadingMaskType.black
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(),
          ),
          BlocProvider<SplashScreenBloc>(
            create: (context) => SplashScreenBloc(),
          ),],
        child: MaterialApp(
          title: 'Latihan Flutter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: EasyLoading.init(),
          home: const SplashScreen(checkStatus: true),
        ),
    );
  }
}