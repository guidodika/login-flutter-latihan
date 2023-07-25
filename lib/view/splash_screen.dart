import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/view/dashboard_page.dart';
import 'package:untitled/view/profile_page.dart';
import 'login_page.dart';
import '../view_model/splash_screen/splash_screen_bloc.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.checkStatus}) : super(key: key);
  final bool checkStatus;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenBloc _splashScreenBloc = SplashScreenBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    getTokenFcmListeners();
    // LocalNotificationHelper.pushNotif(body: 'Se', tittle: 'Selamat Datang');
  }

  @override
  Widget build(BuildContext context) {
    bool checkStatus = widget.checkStatus;
    _splashScreenBloc = BlocProvider.of<SplashScreenBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SplashScreenBloc, SplashScreenState>(
        builder: (context, state) {
          if (state is SplashScreenInitial || checkStatus) {
            _splashScreenBloc.add(CekStatusLogin());
            checkStatus = false;
          }
          return Center(
            child: Container(
              margin: const EdgeInsets.all(30),
              height: double.maxFinite,
              decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: new AssetImage(
                //     "assets/images/background.png",
                //   ),
                //   fit: BoxFit.fill,
                //   colorFilter: new ColorFilter.mode(
                //       Colors.white.withOpacity(0.9), BlendMode.lighten),
                // ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo_splash.png'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void getTokenFcmListeners() async {
    // await Firebase.initializeApp();
    // String token = (await FirebaseMessaging.instance.getToken())!;
    // debugPrint("token = ");
  }
  void navigateUser() async {
    try {
      if (_splashScreenBloc.state is ScreenLogin) {
        // await AppSharedPreferences.setSubscribeTopicOrder(false);
        Future.delayed(const Duration(milliseconds: 800)).then((value) async {
          // await AppSharedPreferences.setSubscribeTopicOrder(true);
        });
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        ));
      } else if (_splashScreenBloc.state is ScreenHome) {
        // await AppSharedPreferences.setSubscribeTopicGlobal(false);
        // await AppSharedPreferences.setSubscribeTopicOrder(false);
        Future.delayed(const Duration(milliseconds: 800)).then((value) async {
          // await AppSharedPreferences.setSubscribeTopicGlobal(true);
          // await AppSharedPreferences.setSubscribeTopicOrder(true);
        });
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return DashboardPage();
            // return const Index();
          },
        ));
      }
    } catch (error) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      ));
    }
  }
}
