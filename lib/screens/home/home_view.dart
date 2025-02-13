import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/export.dart';
import '../../core/libraries/export.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_nav.dart';
import '../../utils/export.dart';
import 'export.dart';
import 'overall/overall_view.dart';
import 'today/today_view.dart';
import 'weekly/weekly_view.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context,) {
    return BaseView<HomeViewModel>(
      onModelReady: (vm) {},
      model: HomeViewModel(),
      builder: (context, vm, child) {
        return Scaffold(
          body: _buildBody(context, vm),
        );
      },
    );
  }

  _buildBody(BuildContext context, HomeViewModel vm) {
    return Column(
      children: [
        SizedBox(height: 5.h,),
        appBar(),
        SizedBox(height: 2.h,),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getTabsButton(
                  title: 'Today',
                  isSelected: vm.today,
                  width: 130,
                  onPressed: () {
                    vm.order1click();
                  },
                  context: context,
                ),
                getTabsButton(
                  title: 'Weekly',
                  isSelected: vm.weekly,
                  width: 130,
                  onPressed: () {
                    vm.order2click();
                  },
                  context: context,
                ),
                getTabsButton(
                  title: 'Overall',
                  isSelected: vm.overall,
                  width: 130,
                  onPressed: () {
                    vm.order3click();
                  },
                  context: context,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (vm.today) const TodayView(),
        if (vm.weekly) const WeeklyView(),
        if (vm.overall) const OverallView(),
      ],
    );
  }


  appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppAssets().appLogo,
            width: 24,
            height: 22,
          ),
          // Logo at the start
          Expanded(
            child: Center(
              child: Text(
                "Home",
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),
            ),
          ),

          ImageHelper(
            image: AppAssets().settingICon,
            imageType: ImageType.svg, // Settings icon at the end
          ),
        ],
      ),
    );
  }


  getTabsWeekly(context,
      HomeViewModel vm,) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTabsButton(
                title: 'Today',
                isSelected: vm.today,
                width: 130,
                onPressed: () {
                  vm.order1click();
                  AppNav().to(
                    context: context,
                    screen: const TodayView(),
                  );
                },
                context: context),
            getTabsButton(
              title: 'Weekly',
              isSelected: vm.weekly,
              width: 130,
              onPressed: () {
                vm.order2click();
                AppNav().to(
                  context: context,
                  screen: const WeeklyView(),
                );
              },
              context: context,
            ),
            getTabsButton(
              title: 'Overall',
              isSelected: vm.overall,
              width: 130,
              onPressed: () {
                vm.order3click();
                AppNav().to(
                  context: context,
                  screen: const OverallView(),
                );
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }


  getTabsButton({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required Function() onPressed,
    required double width,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: width,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors().primaryColor
              : AppColors().lightGreyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w700,
            color: isSelected ? AppColors().white : AppColors().black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}




