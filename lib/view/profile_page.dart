import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/utils/constant.dart';
import 'package:untitled/view/splash_screen.dart';
import 'package:untitled/view_model/login/login_bloc.dart';

const String imageProfile = "assets/images/test_image.svg";

class ProfilePage extends StatelessWidget {
  static LoginBloc _loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            // Mendapatkan nilai 'status' dari state.dataUser
            bool isOnline = UserConfig.dataUser.status == '1';

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: SvgPicture.asset(
                      imageProfile,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    // state.dataUser.map((e) {
                    //   return e.displayName;
                    // }).join(),
                    UserConfig.dataUser.displayName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    isOnline
                        ? 'Online'
                        : 'Offline', // Menampilkan 'Online' atau 'Offline' berdasarkan nilai 'status'
                    style: TextStyle(
                      fontSize: 16,
                      color: isOnline
                          ? Colors.green
                          : Colors
                              .red, // Mengubah warna teks menjadi hijau jika 'Online', merah jika 'Offline'
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {
                          // Tambahkan logika untuk menu Update Profile di sini
                        },
                      ),
                      SizedBox(width: 10),
                      const Text(
                        'Update Profile',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.lock),
                        onPressed: () {
                          // Tambahkan logika untuk menu Update Password di sini
                        },
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Update Password',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.logout),
                        onPressed: () {
                          Future.delayed(const Duration(seconds: 1), () async {
                            _loginBloc.add(LogoutApp());
                            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const SplashScreen(checkStatus: true);
                                },
                              ),
                                  (_) => false,
                            );
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
