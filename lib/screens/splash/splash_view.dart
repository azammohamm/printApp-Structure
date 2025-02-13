import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import '../../core/base/base_view.dart';
import '../../utils/export.dart';
import 'export.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (vm) async {
        vm.checkUserLogin(context);
      },
      model: SplashViewModel(),
      builder: (context, vm, child) {
        return Scaffold(
          body: _buildBody(context, vm),
        );

      },
    );
  }

  Widget _buildBody(BuildContext context, SplashViewModel vm) {
    return Center( // Ensures vertical and horizontal centering
      child: SingleChildScrollView( // Handles overflow, useful for smaller devices
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets().splashLogo, height: 295, width: 309),
            SizedBox(height: 20.h), // Adjustable vertical space
            LoadingAnimationWidget.hexagonDots(
              size: 64, color: AppColors().primaryColor,
            ),
          ],
        ),
      ),
    );
  }


}
