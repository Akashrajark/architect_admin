import 'package:dream_home_admin/features/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
      url: 'https://mhpvbvwvoczlnwkyawfj.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1ocHZidnd2b2N6bG53a3lhd2ZqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI5NDg1NzcsImV4cCI6MjA0ODUyNDU3N30.0lTn_YdvE2tBvF58wB6KOpGEIQOZdd3lpU_OsfFVpKY');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
