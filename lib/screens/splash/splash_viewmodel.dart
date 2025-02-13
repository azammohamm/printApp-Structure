import 'dart:async';

import '../../core/base/base_notifier.dart';
import '../../utils/app_nav.dart';
import '../started/export.dart';

class SplashViewModel extends BaseNotifier {
  bool? get isIntro => getIntroRun();

  SplashViewModel();

  checkUserLogin(context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Future.delayed(Duration.zero, () {
          if (isIntro == null || isIntro == false) {
            AppNav().off(
              context: context,
              screen: const StartedView(),
            );
          } else {
            // AppNav().off(
            //   context: context,
            //   screen: const LoginView(),
            // );
          }
        });
      },
    );
  }
}
