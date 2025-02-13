import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/base/base_view.dart';
import '../../../core/libraries/image_loader/image_helper.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import 'export.dart';

class TodayView extends StatelessWidget {
  const TodayView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TodayViewModel>(
      onModelReady: (vm) {},
      model: TodayViewModel(),
      builder: (context, vm, child) {
        return Expanded(
          child: ListView(
            children: [
              getTabsMonthly(context, vm),
              getAllTaskItem(),
            ],
          ),
        );
      },
    );
  }

  getTabsMonthly(context, TodayViewModel vm,) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTabsButtonMonthly(
              title: 'All',
              isSelected: vm.buttonMonthly1,
              onPressed: () {
                vm.monthly1Click();
              },
              context: context,
            ),
            const SizedBox(
              width: 10,
            ),
            getTabsButtonMonthly(
              title: 'Morning',
              isSelected: vm.buttonMonthly2,
              onPressed: () {
                vm.monthly2Click();
              },
              context: context,
            ),
            const SizedBox(
              width: 10,
            ),
            getTabsButtonMonthly(
              title: 'Afternoon',
              isSelected: vm.buttonMonthly3,
              onPressed: () {
                vm.monthly3Click();
              },
              context: context,
            ),
            const SizedBox(
              width: 10,
            ),
            getTabsButtonMonthly(
              title: 'Evening',
              isSelected: vm.buttonMonthly4,
              onPressed: () {
                vm.monthly4Click();
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  getTabsButtonMonthly({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required Function() onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        // Horizontal padding for some breathing space around the text
        decoration: BoxDecoration(
          color: isSelected ? AppColors().primaryColor : AppColors().white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.white : AppColors().lightGreyColor,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors().white : AppColors().black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  getAllTaskCard({
    required String imagePath,
    required String label,
    required Color cardColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 64,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageHelper(
              image: imagePath,
              alignment: Alignment.center,
              imageType: ImageType.svg,
              imageShape: ImageShape.rectangle,
              boxFit: BoxFit.cover,
              borderRadius: BorderRadius.circular(10),
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20, // Font size
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getAllTaskItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          getAllTaskCard(
              imagePath: AppAssets().goalsImg,
              label: "Set Small Goals",
              cardColor: AppColors().pinkColor),
          const SizedBox(
            height: 10,
          ),
          getAllTaskCard(
              imagePath: AppAssets().notesImg,
              label: "Work",
              cardColor: AppColors().purColor),
          const SizedBox(
            height: 10,
          ),
          getAllTaskCard(
              imagePath: AppAssets().notesImg,
              label: "Meditation",
              cardColor: AppColors().lightGreenColor),
          const SizedBox(
            height: 10,
          ),
          getAllTaskCard(
              imagePath: AppAssets().ballImg,
              label: "Basketball",
              cardColor: AppColors().yellowGreenColor),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Completed",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  color: AppColors().black,
                  fontSize: 20,
                ),
              ), const SizedBox(width: 5,),
              Expanded(
                child: Divider(
                  color: AppColors().greyColor,
                  thickness: 1, // Set a thickness to make it visible
                  height: 20,  // This controls the vertical spacing
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          getAllTaskCard(
              imagePath: AppAssets().sleepImg,
              label: "Sleep over 8h",
              cardColor: AppColors().blueColor),
          getAllTaskCard(
              imagePath: AppAssets().gameImg,
              label: "Playing Games",
              cardColor: AppColors().darkPinkColor),
          getAllTaskCard(
              imagePath: AppAssets().dumbbellImg,
              label: "Exercise or workout",
              cardColor: AppColors().darkGreyColor),
        ],
      ),
    );
  }




}
