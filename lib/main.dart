import 'package:flutter/material.dart';
import 'features/splash/presentation/pages/splash_screen.dart';
import 'features/anggota/presentation/pages/page_anggota.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khataman Quran',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/anggota': (context) => PageAnggota(),
      },
    );
  }
}
