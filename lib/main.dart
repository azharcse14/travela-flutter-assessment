import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travela_assignment/config/routes/app_router.dart';
import 'package:travela_assignment/core/di/di_import_path.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/features/explore/presentation/manager/campaigns/campaigns_bloc.dart';
import 'package:travela_assignment/features/explore/presentation/manager/campaigns_item_list/campaigns_item_list_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: injector<CampaignsBloc>()..add(const GetCampaigns()),
        ),
        BlocProvider.value(value: injector<CampaignsItemListBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Travela',
        theme: ThemeData(
          fontFamily: 'Inter',
          primaryColor: ColorManager.colorWhite,
          dialogBackgroundColor: ColorManager.colorWhite,
          canvasColor: ColorManager.colorWhite,
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: ColorManager.colorWhite,
              modalBackgroundColor: ColorManager.colorWhite),
          colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.colorWhite),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
