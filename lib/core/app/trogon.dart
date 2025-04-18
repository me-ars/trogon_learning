import 'package:flutter/material.dart';
import '../navigation/app_router.dart';
import '../theme/app_theme.dart';

class TrogonApp extends StatelessWidget {
  const TrogonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trogon',
      theme: AppTheme.light,
      routerConfig: AppRouter.appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
