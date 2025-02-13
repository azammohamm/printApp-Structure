import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/base/base_view.dart';
import '../../../core/libraries/export.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/export.dart';
import 'export.dart';

class WeeklyView extends StatelessWidget {
  const WeeklyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<WeeklyViewModel>(
      onModelReady: (vm) {},
      model: WeeklyViewModel(),
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

  weeklyCardItems(vm){
    return Column(children: [
      getSetSmallCard( vm,imagePath: AppAssets().goalsImg, label: "Everyday", title: "Set Small Goalsr",),
      const SizedBox(height: 10,),
      getWorkCard( vm,imagePath: AppAssets().notesImg, label: "5 days per week", title: "work"),
      const SizedBox(height: 10,),
      getMeditationCard( vm,imagePath: AppAssets().lotusImg, label: "Everyday", title: "Meditation"),
      const SizedBox(height: 10,),
      getSleepCard( vm,imagePath: AppAssets().sleepImg, label: "Everyday", title: "Sleep over 8h"),
      const SizedBox(height: 10,),
      getBasketballCard( vm,imagePath: AppAssets().ballImg, label: "Everyday", title: "Exercise or workout"),
      const SizedBox(height: 10,),
      getExerciseCard( vm,imagePath: AppAssets().dumbbellImg, label: "5 days per week", title: "Basketball"),
     const SizedBox(height: 10,),    ],);
  }
  getSetSmallCard(WeeklyViewModel vm, {required String imagePath, required String label, required title,}) {
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
          Column(
            children: getDayAndCheckIcons(
                ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );}
  List<Widget> getDayAndCheckIcons(List<String> days,) {
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
              color: AppColors().pinkColor,
            ),
            child: Icon(Icons.check, color: AppColors().black),
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


  getWorkCard(WeeklyViewModel vm, {required String imagePath, required String label, required String title, Color checkIconColor = Colors.purple}) {
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
          Column(
            children: getWorkCards(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], checkIconColor),
          ),
          const SizedBox(
            height: 10,
          )
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


  getMeditationCard(WeeklyViewModel vm, {required String imagePath, required String label, required String title, Color checkIconColor = Colors.purple}) {
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
          Column(
            children: getMeditation(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], checkIconColor),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  List<Widget> getMeditation(List<String> days, Color checkIconColor) {
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
              color: AppColors().lightGreenColor,
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


  getSleepCard(WeeklyViewModel vm, {required String imagePath, required String label, required String title, Color checkIconColor = Colors.purple}) {
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
          Column(
            children: getSleepCardItems(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], checkIconColor),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  List<Widget> getSleepCardItems(List<String> days, Color checkIconColor) {
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
              color: AppColors().blueColor,
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


  getBasketballCard(WeeklyViewModel vm, {required String imagePath, required String label, required String title, Color checkIconColor = Colors.purple}) {
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
          Column(
            children: getBasketballCardItems(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], checkIconColor),
          ),
          const SizedBox(
            height: 10,
          )
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
              color: AppColors().yellowGreenColor,
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


  getExerciseCard(WeeklyViewModel vm, {required String imagePath, required String label, required String title, Color checkIconColor = Colors.purple}) {
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
          Column(
            children: getExerciseCardItems(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], checkIconColor),
          ),
          const SizedBox(
            height: 10,
          )
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
              color: AppColors().darkGreyColor
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
