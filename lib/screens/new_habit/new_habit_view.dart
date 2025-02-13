import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../core/base/export.dart';
import '../../core/libraries/export.dart';
import '../../utils/export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/export.dart';
import 'export.dart';

class NewHabitView extends StatelessWidget {
  const NewHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<NewHabitModel>(
        model: NewHabitModel(),
        onModelReady: (vm) {},
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.cancel),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  const Text("Create New Habit"),
                ],
              ),
            ),
            body: _buildBody(context, vm),
          );
        });
  }

  _buildBody(BuildContext context, NewHabitModel vm) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getTab(context, vm),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "Select a category of your habit",
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors().black,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          listdata(vm, context),
          SizedBox(
            height: 2.h,
          ),
          if (vm.orderR) regularHabit(context, vm),
          if (vm.orderO) onetimehabit(context, vm),
          CustomButton(
            borderRadius: 10,
            backgroundColor: AppColors().primaryColor,
            onTap: () {
              AppNav().off(
                context: context,
                screen:NewHabitView(),
              );
            },
            child: Text(
              'Save',
              style: GoogleFonts.montserrat(
                color: AppColors().white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  getTab(
    context,
    NewHabitModel vm,
  ) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTabsButton(
              title: 'Regular Habit',
              isSelected: vm.orderR,
              width: 50.w,
              onPressed: () {
                /*vm.orderR=!vm.orderR;*/
                vm.orderRclick();
              },
              context: context,
            ),
            getTabsButton(
              title: 'One-Time Task',
              isSelected: vm.orderO,
              width: 50.w,
              onPressed: () {
                vm.orderO = !vm.orderO;
                vm.orderOclick();
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

  getRepeatButton({
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
            color: isSelected ? AppColors().primaryColor : AppColors().white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColors().greyLightColor)),
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

  listdata(NewHabitModel vm, BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 50.2,
      ),
      itemCount: vm.catList.length,
      itemBuilder: (BuildContext context, int index) {
        return CatCard(cat: vm.catList[index]);
      },
    );
  }

  Widget CatCard({required Cat cat}) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(cat.name),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ImageHelper(
              image: cat.image,
              imageType: ImageType.svg,
              height: 24,
              width: 24, // Settings icon at the end
            ),
          ),
        ],
      ),
    );
  }

  repeatData(BuildContext context, NewHabitModel vm) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getRepeatButton(
              title: 'Today',
              isSelected: vm.today,
              width: 130,
              onPressed: () {
                vm.order1click();
              },
              context: context,
            ),
            getRepeatButton(
              title: 'Weekly',
              isSelected: vm.weekly,
              width: 130,
              onPressed: () {
                vm.order2click();
              },
              context: context,
            ),
            getRepeatButton(
              title: 'monthly',
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
    );
  }

  onThesedays(BuildContext context, NewHabitModel vm) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTabsButton(
              title: 'S',
              isSelected: vm.sundayy,
              width: 48,
              onPressed: () {
                vm.sundayclick();
              },
              context: context,
            ),
            getTabsButton(
              title: 'M',
              isSelected: vm.monday,
              width: 48,
              onPressed: () {
                vm.mondayclick();
              },
              context: context,
            ),
            getTabsButton(
              title: 'T',
              isSelected: vm.tuesday,
              width: 48,
              onPressed: () {
                vm.tuesdayclick();
              },
              context: context,
            ),
            getTabsButton(
              title: 'W',
              isSelected: vm.wednesday,
              width: 48,
              onPressed: () {
                vm.wednesdayclick();
              },
              context: context,
            ),
            getTabsButton(
              title: 'T',
              isSelected: vm.thursday,
              width: 48,
              onPressed: () {
                vm.thursdayclick();
              },
              context: context,
            ),
            getTabsButton(
              title: 'F',
              isSelected: vm.friday,
              width: 48,
              onPressed: () {
                vm.fridayclick();
              },
              context: context,
            ),
            getTabsButton(
              title: 'S',
              isSelected: vm.saturday,
              width: 48,
              onPressed: () {
                vm.saturdayclick();
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  doitatmethod(BuildContext context, NewHabitModel vm) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTabsButton(
              title: 'Morning',
              isSelected: vm.morning,
              width: 130,
              onPressed: () {
                vm.morningclick();
              },
              context: context,
            ),
            getTabsButton(
              title: 'Afternoon',
              isSelected: vm.afternoon,
              width: 130,
              onPressed: () {
                vm.afternoonclick();
              },
              context: context,
            ),
            getTabsButton(
              title: 'Evening',
              isSelected: vm.evening,
              width: 130,
              onPressed: () {
                vm.eveningclick();
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  endhabitmethod(BuildContext context, NewHabitModel vm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "End Habit on",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors().black,
          ),
        ),
        Switch(
          value: vm.endHabitValue, // Current state of the switch
          onChanged: (value) {
            vm.endHabitValue = value;
            vm.notifyListeners();
          },
          activeColor: AppColors().primaryColor, // Color when switch is on
          inactiveThumbColor: AppColors().greyColor, // Color when switch is off
        ),
      ],
    );
  }

  setRemindermethod(BuildContext context, NewHabitModel vm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Set Reminder",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors().black,
          ),
        ),
        Switch(
          value: vm.setReminderValue, // Current state of the switch
          onChanged: (value) {
            vm.setReminderValue = value;
            vm.notifyListeners();
          },
          activeColor: AppColors().primaryColor, // Color when switch is on
          inactiveThumbColor: AppColors().greyColor, // Color when switch is off
        ),
      ],
    );
  }

  Widget tableCalender(NewHabitModel vm) {
    return SafeArea(
      child: Column(
        children: [
          // Display selected dates
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white, // Change color as needed
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Every Month on ${vm.selectedDate.map((date) => date.day).toList().join(', ')}",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: AppColors().greyColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: TableCalendar(
              focusedDay: vm.todayDate,
              selectedDayPredicate: (day) => isSameDay(day, vm.todayDate),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              onDaySelected: (selectedDay, focusedDay) {
                if (!vm.selectedDate.contains(selectedDay)) {
                  vm.selectedDate.add(selectedDay);
                  vm.selectedDay = selectedDay;
                  vm.notifyListeners();
                } else {
                  vm.selectedDate.remove(selectedDay);
                }
                vm.notifyListeners();
                print('Selected Day: $selectedDay');
              },
              // Use cellBuilder to customize the day cells
              eventLoader: (day) {
                vm.notifyListeners();
                final isSelected = vm.selectedDate.contains(day);
                final isToday = isSameDay(day, vm.todayDate);

                if (isSelected) {
                  vm.notifyListeners();
                  return [true];
                } else if (isToday) {
                  vm.notifyListeners();
                  return [true];
                } else {
                  return [];
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget datemethod(BuildContext context, NewHabitModel vm) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getRepeatButton(
              title: 'date',
              isSelected: vm.date,
              width: 130,
              onPressed: () {
                vm.dateclick();
              },
              context: context,
            ),
            getRepeatButton(
              title: 'days',
              isSelected: vm.days,
              width: 130,
              onPressed: () {
                vm.daysclick();
              },
              context: context,
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }

  Widget daysmethod(BuildContext context, NewHabitModel vm) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showCalendarDialog(context, vm);
          },
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
              color: AppColors().greyLightColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const ListTile(
              title: Text("After 365 days"),
              leading: Icon(
                Icons.refresh_sharp,
                color: Colors.green,
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget dateemthod(BuildContext context, NewHabitModel vm) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showCalendarDialog(context, vm);
          },
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
              color: AppColors().greyLightColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: ListTile(
              title: Text(vm.selectedDay?.toString().isEmpty ?? true
                  ? "21-05-3024"
                  : vm.selectedDay.toString()),
              leading: Icon(
                Icons.calendar_today,
                color: Colors.green,
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showCalendarDialog(BuildContext context, NewHabitModel vm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text("Calendar")),
          content: SizedBox(
            height: 400, // Adjust height as needed
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: tableCalender(vm),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  remindervaluemethod() {
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
        color: AppColors().greyLightColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListTile(
        title: Text("19:00 PM"),
        leading: Icon(
          Icons.lock_clock,
          color: Colors.green,
        ),
        trailing: Icon(
          Icons.edit,
          color: Colors.green,
        ),
      ),
    );
  }

  regularHabit(BuildContext context, NewHabitModel vm) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormField(
          hint: "habit Name",
          titleText: "Habit Name",
          titleColor: AppColors().black,
          titleFontSize: 20,
          fieldColor: AppColors().greyColor,
          titleFontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "Repeat",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors().black,
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        repeatData(context, vm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (vm.overall) // If "overall" is selected
              Container(
                height: 400,
                child: tableCalender(vm),
              ),
            if (vm.today) // If "weekly" is selected
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.5.h),
                  Text(
                    "On these Days:",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors().black,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  onThesedays(context, vm), // Show "onThesedays"
                ],
              ),
            if (!vm.overall &&
                !vm.weekly) // If neither "overall" nor "weekly" is selected
              Container(
                  // You can put default content or leave it empty
                  ),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Text(
          "Do it at:",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors().black,
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        doitatmethod(context, vm),
        SizedBox(
          height: 1.5.h,
        ),
        endhabitmethod(context, vm),
        SizedBox(
          height: 2.5.h,
        ),
        if (vm.endHabitValue)
          Container(
            height: 150,
            child: Column(
              children: [
                datemethod(context, vm),
                SizedBox(
                  height: 2.h,
                ),
                if (vm.date) dateemthod(context, vm),
                if (vm.days) daysmethod(context, vm)
              ],
            ),
          ),
        setRemindermethod(context, vm),
        if (vm.setReminderValue)
          Container(
            height: 150,
            child: Column(
              children: [
                remindervaluemethod(),
              ],
            ),
          ),
        SizedBox(
          height: 1.5.h,
        ),
      ],
    );
  }

  onetimehabit(BuildContext context, NewHabitModel vm) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormField(
          hint: "Task Name",
          titleText: "Task Name",
          titleColor: AppColors().black,
          titleFontSize: 20,
          fieldColor: AppColors().greyColor,
          titleFontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "When",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors().black,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        dateemthod(context, vm),
        SizedBox(
          height: 1.5.h,
        ),
        Text(
          "Do it at:",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors().black,
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        doitatmethod(context, vm),
        SizedBox(
          height: 1.5.h,
        ),
        setRemindermethod(context, vm),
        if (vm.setReminderValue)
          Container(
            height: 150,
            child: Column(
              children: [
                remindervaluemethod(),
              ],
            ),
          ),
        SizedBox(
          height: 1.5.h,
        ),
      ],
    );
  }
}
