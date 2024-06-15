import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialapp/auth/auth_gate.dart';
import 'package:socialapp/firebase_options.dart';
import 'package:socialapp/pages/home_page.dart';
import 'package:socialapp/pages/profile.dart';
import 'package:socialapp/pages/settings.dart';
import 'package:socialapp/pages/users_page.dart';
import 'package:socialapp/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthGate(),
      routes: {
        '/home': (context) => HomePage(),
        '/users': (context) => const UsersPage(),
        '/settings': (context) => const Settings(),
        '/profile': (context) => Profile(),
      },
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
