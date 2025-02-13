import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/base/export.dart';
import '../../core/libraries/export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';
import '../bottom_nav/export.dart';
import 'export.dart';

class StartedView extends StatelessWidget {
  const StartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StartedViewModel>(
      onModelReady: (vm) async {},
      model: StartedViewModel(),
      builder: (context, vm, child) {
        return Scaffold(
          body: _buildBody(context, vm),
        );
      },
    );
  }

  _buildBody(BuildContext context, StartedViewModel vm) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Image.asset(
                  AppAssets().splashLogo,
                  height: 295,
                  width: 309,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Let’s Get Started!",
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColors().black,
                ),
              ), const SizedBox(height: 20,),
              Text(
                "Let’s dive in into your account",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors().black,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 63,
                margin: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 10),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: AppColors().white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors().greyColor)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageHelper(
                      image: AppAssets().googleICon,
                      imageType: ImageType.svg,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Login With Facebook",
                      style: GoogleFonts.raleway(
                        color: AppColors().black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 63,
                margin: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 10),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: AppColors().white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors().greyColor)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageHelper(
                      image: AppAssets().appleICon,
                      imageType: ImageType.svg,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Continue with apple",
                      style: GoogleFonts.montserrat(
                        color: AppColors().black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: CustomButton(
                  borderRadius: 10,
                  onTap: () {
                    AppNav().to(
                      context: context,
                      screen: const BottomNavView(),
                    );
                  },
                  backgroundColor: AppColors().primaryColor,
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.montserrat(
                      color: AppColors().white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: CustomButton(
                  borderRadius: 10,
                  onTap: () {
                    AppNav().to(
                      context: context,
                      screen: const BottomNavView(),
                    );
                  },
                  backgroundColor: AppColors().simpleColor,
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.montserrat(
                      color: AppColors().primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10, top: 10, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Privacy Policy",
                      style: GoogleFonts.montserrat(
                        color: AppColors().hexColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "-",
                      style: GoogleFonts.montserrat(
                        color: AppColors().black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Terms fo Service",
                      style: GoogleFonts.montserrat(
                        color: AppColors().hexColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
