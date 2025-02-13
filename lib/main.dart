import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:print_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'screens/splash/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        //auth
       /* ChangeNotifierProvider(create: (_) => StartedViewModel()),*/
       /* ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SignupViewModel()),
        //main app
        ChangeNotifierProvider(create: (_) => BottomNavViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => NewHabitModel()),
        ChangeNotifierProvider(create: (_) => ProgressViewModel()),
        ChangeNotifierProvider(create: (_) => AccountabilityViewModel()),
        ChangeNotifierProvider(create: (_) => ChooseViewModel()),
        ChangeNotifierProvider(create: (_) => ReviewSummaryViewModel()),
        ChangeNotifierProvider(create: (_) => CongratulationsViewViewModel()),
        ChangeNotifierProvider(create: (_) => FreemiumViewModel()),*/

      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Print App',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors().white,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors().white,
              ),
              useMaterial3: true,
            ),
            home: const SplashView(),
          );
        },
      ),
    );
  }
}