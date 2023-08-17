import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_the_movie_db/config/router/app_router.dart';
import 'package:simple_the_movie_db/config/theme/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'The Fluvie DB',
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
