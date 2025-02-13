import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../core/base/base_view.dart';
import '../../../core/libraries/export.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/export.dart';
import 'export.dart';

class OverallView extends StatelessWidget {
  const OverallView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OverallViewModel>(
      onModelReady: (vm) {},
      model: OverallViewModel(),
      builder: (context, vm, child) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [weeklyCardItems(vm)],
            ),
          ),
        );
      },
    );
  }

  weeklyCardItems(vm) {
    return Column(children: [
      getSetSmallCard(vm, imagePath: AppAssets().goalsImg, label: "Everyday", title: "Set Small Goalsr",),
      const SizedBox(height: 10,),
      getMeditationCard( vm,imagePath: AppAssets().lotusImg, label: "Everyday", title: "Meditation"),
      const SizedBox(height: 10,),
      getWorkCard( vm,imagePath: AppAssets().notesImg, label: "5 days per week", title: "work"),
      const SizedBox(height: 10,),
      getSleepCard( vm,imagePath: AppAssets().sleepImg, label: "Sleep over 8h", title: "Everyday"),
      const SizedBox(height: 10,),
      getBasketballCard( vm,imagePath: AppAssets().ballImg, label: "Everyday", title: "Basketball"),
      const SizedBox(height: 10,),
      getExerciseCard( vm,imagePath: AppAssets().dumbbellImg, label: "Everyday", title: "Exercise or workout"),
      const SizedBox(height: 10,),
    ],);
  }

  Widget getSetSmallCard(OverallViewModel vm,
      {required String imagePath, required String label, required String title}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors().greyLightColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper(
                image: imagePath,
                imageType: ImageType.svg,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                label,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors().greyColor,
            thickness: 1,
            height: 20,
          ),
          // Display week names and containers
          for (var weekName in ["M", "T", "W", "T", "F", "S", "S"])
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    weekName,
                    style: TextStyle(
                      color: AppColors().black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Row(
                    children: [
                      for (int i = 0; i < 13; i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors().pinkColor,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Add space between rows
              ],
            ),
        ],
      ),
    );
  }


  Widget getMeditationCard(OverallViewModel vm,
      {required String imagePath, required String label, required String title}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors().greyLightColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper(
                image: imagePath,
                imageType: ImageType.svg,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                label,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors().greyColor,
            thickness: 1,
            height: 20,
          ),
          // Display week names and containers
          for (var weekName in ["M", "T", "W", "T", "F", "S", "S"])
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    weekName,
                    style: TextStyle(
                      color: AppColors().black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Row(
                    children: [
                      for (int i = 0; i < 13; i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors().lightGreenColor,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Add space between rows
              ],
            ),
        ],
      ),
    );
  }


  getWorkCard(OverallViewModel vm,
      {required String imagePath, required String label, required String title}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors().greyLightColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper(
                image: imagePath,
                imageType: ImageType.svg,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                label,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors().greyColor,
            thickness: 1,
            height: 20,
          ),
          // Display week names and containers
          for (var weekName in ["M", "T", "W", "T", "F", "S", "S"])
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    weekName,
                    style: TextStyle(
                      color: AppColors().black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Row(
                    children: [
                      for (int i = 0; i < 13; i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors().purColor,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Add space between rows
              ],
            ),
        ],
      ),
    );
  }
  List<Widget> getWorkCards(List<String> days, Color checkIconColor) {
    List<Widget> dayWidgets = [];
    List<Widget> checkWidgets = [];
    for (int i = 0; i < days.length; i++) {
      dayWidgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text(
            days[i],
            style: GoogleFonts.montserrat(
              color: AppColors().black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
    for (int i = 0; i < days.length; i++) {
      checkWidgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors().purColor,
            ),
            child: Icon(Icons.check, color: checkIconColor), // Use the provided check icon color
          ),
        ),
      );
    }

    return [
      Row(children: dayWidgets),
      const SizedBox(
        height: 10,
      ),
      Row(children: checkWidgets),
    ];
  }


  getSleepCard(OverallViewModel vm,
      {required String imagePath, required String label, required String title}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors().greyLightColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper(
                image: imagePath,
                imageType: ImageType.svg,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                label,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors().greyColor,
            thickness: 1,
            height: 20,
          ),
          // Display week names and containers
          for (var weekName in ["M", "T", "W", "T", "F", "S", "S"])
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    weekName,
                    style: TextStyle(
                      color: AppColors().black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Row(
                    children: [
                      for (int i = 0; i < 13; i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors().darkBlue,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Add space between rows
              ],
            ),
        ],
      ),
    );
  }
  List<Widget> getSleepItems(List<String> days, Color checkIconColor) {
    List<Widget> dayWidgets = [];
    List<Widget> checkWidgets = [];
    for (int i = 0; i < days.length; i++) {
      dayWidgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text(
            days[i],
            style: GoogleFonts.montserrat(
              color: AppColors().black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
    for (int i = 0; i < days.length; i++) {
      checkWidgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors().darkBlue,
            ),
            child: Icon(Icons.check, color: checkIconColor), // Use the provided check icon color
          ),
        ),
      );
    }

    return [
      Row(children: dayWidgets),
      const SizedBox(
        height: 10,
      ),
      Row(children: checkWidgets),
    ];
  }


  getBasketballCard(OverallViewModel vm,
      {required String imagePath, required String label, required String title}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors().greyLightColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper(
                image: imagePath,
                imageType: ImageType.svg,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                label,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors().greyColor,
            thickness: 1,
            height: 20,
          ),
          // Display week names and containers
          for (var weekName in ["M", "T", "W", "T", "F", "S", "S"])
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    weekName,
                    style: TextStyle(
                      color: AppColors().black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Row(
                    children: [
                      for (int i = 0; i < 13; i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors().yellowGreenColor,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Add space between rows
              ],
            ),
        ],
      ),
    );
  }
  List<Widget> getBasketballCardItems(List<String> days, Color checkIconColor) {
    List<Widget> dayWidgets = [];
    List<Widget> checkWidgets = [];
    for (int i = 0; i < days.length; i++) {
      dayWidgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text(
            days[i],
            style: GoogleFonts.montserrat(
              color: AppColors().black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
    for (int i = 0; i < days.length; i++) {
      checkWidgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors().orangeColor,
            ),
            child: Icon(Icons.check, color: checkIconColor), // Use the provided check icon color
          ),
        ),
      );
    }
    return [
      Row(children: dayWidgets),
      const SizedBox(
        height: 10,
      ),
      Row(children: checkWidgets),
    ];
  }


  getExerciseCard(OverallViewModel vm,
      {required String imagePath, required String label, required String title}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors().greyLightColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper(
                image: imagePath,
                imageType: ImageType.svg,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                label,
                style: GoogleFonts.montserrat(
                  color: AppColors().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors().greyColor,
            thickness: 1,
            height: 20,
          ),
          // Display week names and containers
          for (var weekName in ["M", "T", "W", "T", "F", "S", "S"])
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    weekName,
                    style: TextStyle(
                      color: AppColors().black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Row(
                    children: [
                      for (int i = 0; i < 13; i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors().darkZing,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Add space between rows
              ],
            ),
        ],
      ),
    );
  }
  List<Widget> getExerciseCardItems(List<String> days, Color checkIconColor) {
    List<Widget> dayWidgets = [];
    List<Widget> checkWidgets = [];
    for (int i = 0; i < days.length; i++) {
      dayWidgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text(
            days[i],
            style: GoogleFonts.montserrat(
              color: AppColors().black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
    for (int i = 0; i < days.length; i++) {
      checkWidgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors().orangeColor,
            ),
            child: Icon(Icons.check, color: checkIconColor), // Use the provided check icon color
          ),
        ),
      );
    }
    return [
      Row(children: dayWidgets),
      const SizedBox(
        height: 10,
      ),
      Row(children: checkWidgets),
    ];
  }



}
