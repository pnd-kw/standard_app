import 'package:flutter/material.dart';
import 'package:standard_app/presentation/gallery_full_screen.dart';
import 'package:standard_app/presentation/home_screen.dart';
import 'package:standard_app/presentation/works_detail_screen.dart';
import 'package:standard_app/presentation/works_screen.dart';
import 'package:standard_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Standard App',
        theme: theme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/works-screen': (context) => const WorksScreen(),
          '/works-detail-screen': (context) => const WorksDetailScreen(),
          '/gallery-full-screen': (context) => const GalleryFullScreen(),
        });
  }
}
