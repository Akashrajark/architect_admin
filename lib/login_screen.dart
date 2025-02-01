import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          width: 350.0,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
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
                  offset: Offset(2.0, 2.0),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  foregroundColor: Color.fromARGB(187, 238, 111, 27),
                  child: const Icon(Icons.house_rounded),
                )),
                SizedBox(height: 20),
                Center(
                    child: Text(
                  overflow: TextOverflow.ellipsis,
                  'Dream Home',
                  style: TextStyle(fontSize: 20),
                )),
                SizedBox(height: 80),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email address',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            isObscure = !isObscure;
                            setState(() {});
                          },
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      border: OutlineInputBorder(),
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                    )),
                SizedBox(height: 70),
                ElevatedButton(
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        backgroundColor: Color.fromARGB(187, 238, 111, 27),
                        foregroundColor: Colors.white,
                        minimumSize: Size(350, 50),
                        textStyle: const TextStyle(
                            fontSize: 20, fontStyle: FontStyle.normal)),
                    onPressed: () {}),
                Center(
                    child: TextButton(
                  onPressed: () {},
                  child: const Text('Forget Password?'),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
