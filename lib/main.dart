import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travela_assignment/config/routes/app_router.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorManager.colorWhite,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Travela',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: ColorManager.colorWhite,
        dialogBackgroundColor: ColorManager.colorWhite,
        canvasColor: ColorManager.colorWhite,
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: ColorManager.colorWhite, modalBackgroundColor: ColorManager.colorWhite),
        colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.colorWhite),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
