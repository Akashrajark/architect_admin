import 'package:dream_home_admin/features/home/home_screen.dart';
import 'package:dream_home_admin/features/login_screen/login_bloc/login_bloc.dart';
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
              child: Container(
                margin: const EdgeInsets.all(10.0),
                width: 350.0,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      stops: [
                        0.0,
                        0.6,
                      ],
                      end: Alignment.bottomCenter,
                      colors: [Color.fromARGB(187, 238, 111, 27), Colors.white],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 2.0,
                        offset: const Offset(2.0, 2.0),
                      ),
                    ]),
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
                          onPressed: () {},
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
                        const SizedBox(height: 80),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 30),
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
                        const SizedBox(height: 70),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                backgroundColor:
                                    const Color.fromARGB(187, 238, 111, 27),
                                foregroundColor: Colors.white,
                                minimumSize: const Size(350, 50),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontStyle: FontStyle.normal)),
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
                            child: const Text('Login')),
                      ],
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
