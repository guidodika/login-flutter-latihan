import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/view/dashboard_page.dart';
import 'package:untitled/utils/will_pop_scope_helper.dart';
import '../../../../view_model/login/login_bloc.dart';
import '../../../../utils/text_form_field_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final TextEditingController _usernameController =
  TextEditingController();
  static final TextEditingController _passController = TextEditingController();
  static LoginBloc _loginBloc = LoginBloc();
  final _formKey = GlobalKey<FormState>();
  bool isLoginFormVisible = true;
  double containerPosition = 0;

  void toggleLoginFormVisibility() {
    setState(() {
      isLoginFormVisible = !isLoginFormVisible;
      containerPosition = isLoginFormVisible ? 0 : -300;
    });
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ));
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) =>
                WillPopScopeHelper.dialogCLoseApp(context: context));
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  'assets/images/background-image-k24.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              // Text Overlay
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'K-24',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Pasti Peduli',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Login Form
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                left: 0,
                right: 0,
                bottom: containerPosition,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    // Slide the login form up or down based on drag movement
                    if (details.delta.dy < 0 && !isLoginFormVisible) {
                      toggleLoginFormVisibility();
                    } else if (details.delta.dy > 0 && isLoginFormVisible) {
                      toggleLoginFormVisibility();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Selamat Datang',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Silahkan masuk dengan akun yang sudah diberikan',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormFieldHelper.stylePrimary(
                              label: 'Username',
                              hintText: 'Username',
                              emailValidator: true,
                              textController: _usernameController,
                              context: context),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormFieldHelper.stylePrimary(
                              label: 'Password',
                              hintText: 'kata sandi',
                              obscureText: true,
                              textController: _passController,
                              context: context),
                        ),
                        const Text(
                          'PIN awal anda adalah 1111',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CupertinoButton(
                          padding: const EdgeInsets.all(10),
                          minSize: 10,
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                          child: const Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            debugPrint("cek login");
                            if (_formKey.currentState!.validate()) {
                              _loginBloc.add(PostLogin(
                                username: _usernameController.text,
                                password: _passController.text,
                              ));
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            return BlocListener<LoginBloc, LoginState>(
                              listener: (context, state) {
                                debugPrint('State changed: ${state.status}');
                                if (state.status == 'success') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DashboardPage()),
                                  );
                                }
                              },
                              child: Container(),
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
