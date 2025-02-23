import 'package:dream_home_admin/common_widget/custom_button.dart';
import 'package:dream_home_admin/common_widget/custom_text_formfield.dart';
import 'package:dream_home_admin/features/home/home_screen.dart';
import 'package:dream_home_admin/features/login_screen/login_bloc/login_bloc.dart';
import 'package:dream_home_admin/theme/app_theme.dart';
import 'package:dream_home_admin/util/value_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common_widget/custom_alert_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      User? currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null && currentUser.appMetadata['role'] == 'admin') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            } else if (state is LoginFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed',
                  description: state.message,
                  primaryButton: 'Ok',
                ),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: SizedBox(
                width: 360,
                child: Material(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: outlineColor),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: FloatingActionButton.small(
                            onPressed: null,
                            backgroundColor: Colors.white,
                            foregroundColor:
                                const Color.fromARGB(187, 238, 111, 27),
                            child: const Icon(Icons.house_rounded),
                          )),
                          const SizedBox(height: 20),
                          const Center(
                              child: Text(
                            overflow: TextOverflow.ellipsis,
                            'Dream Home',
                            style: TextStyle(fontSize: 20),
                          )),
                          const SizedBox(height: 30),
                          CustomTextFormField(
                            isLoading: state is LoginLoadingState,
                            controller: _emailController,
                            labelText: 'Email',
                            prefixIconData: Icons.email,
                            validator: emailValidator,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                              controller: _passwordController,
                              obscureText: isObscure,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      isObscure = !isObscure;
                                      setState(() {});
                                    },
                                    icon: Icon(isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                              )),
                          const SizedBox(height: 20),
                          CustomButton(
                            inverse: true,
                            isLoading: state is LoginLoadingState,
                            label: 'Login',
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginEvent(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
