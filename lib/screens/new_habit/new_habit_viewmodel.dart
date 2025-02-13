import 'package:table_calendar/table_calendar.dart';

import '../../core/base/base_notifier.dart';
import '../../utils/export.dart';

class NewHabitModel extends BaseNotifier{
  var order1 = true;
  var order2 = false;

  var orderR = true;
  var orderO = false;

  orderRclick(){
    orderR=true;
    orderO=false;
    notifyListeners();
  }

  orderOclick(){
    orderR=false;
    orderO=true;
    notifyListeners();
  }

  List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8"
  ];





  var buttonMonthly1 = true;
  var buttonMonthly2 = false;
  var buttonMonthly3 = false;
  var buttonMonthly4 = false;


  List<Cat> catList = [
    Cat(
      name: "Study",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Quit bad habit",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Art",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Sports",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Work",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Home",
      image: AppAssets().appleICon,
    ),

    Cat(
      name: "Entertainment",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Social",
      image: AppAssets().appleICon,
    ),

    Cat(
      name: "Diet",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Health",
      image: AppAssets().appleICon,
    ),

    Cat(
      name: "Meditation",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Other",
      image: AppAssets().appleICon,
    ),

    Cat(
      name: "Nutrition",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Outdoor",
      image: AppAssets().appleICon,
    ),

    Cat(
      name: "Finance",
      image: AppAssets().appleICon,
    ),
    Cat(
      name: "Create",
      image: AppAssets().appleICon,
    ),

  ];

  var today = true;
  var weekly = false;
  var overall = false;

  var morning=false;
  var evening=false;
  var afternoon=false;
  bool endHabitValue = false;
  bool setReminderValue = false;


  var date=true;
  var days=false;
  dateclick()
  {
    date=true;
    days=false;
    notifyListeners();
  }

  daysclick()
  {
    days=true;
    date=false;
    notifyListeners();
  }

  morningclick(){
    morning=true;
    afternoon=false;
    evening=false;
    notifyListeners();
  }
  eveningclick(){
    morning=false;
    afternoon=false;
    evening=true;
    notifyListeners();
  }
  afternoonclick(){
    morning=false;
    afternoon=true;
    evening=false;
    notifyListeners();
  }

  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  List<DateTime> selectedDate=[];
  String chose ="";


  var monday = false;
  var tuesday = false;
  var wednesday = false;
  var thursday = false;
  var friday = false;
  var saturday = false;
  var sundayy = true;
  sundayclick(){
    sundayy=true;
    monday=false;
    tuesday=false;
    wednesday=false;
    thursday=false;
    friday=false;
    saturday=false;
    notifyListeners();
  }

  mondayclick(){
    sundayy=false;
    monday=true;
    tuesday=false;
    wednesday=false;
    thursday=false;
    friday=false;
    saturday=false;
    notifyListeners();
  }

  tuesdayclick(){
    sundayy=false;
    monday=false;
    tuesday=true;
    wednesday=false;
    thursday=true;
    friday=false;
    saturday=false;
    notifyListeners();
  }
  wednesdayclick(){
    sundayy=false;
    monday=false;
    tuesday=false;
    wednesday=true;
    thursday=false;
    friday=false;
    saturday=false;
    notifyListeners();
  }

  thursdayclick(){
    sundayy=false;
    monday=false;
    tuesday=false;
    wednesday=false;
    thursday=true;
    friday=false;
    saturday=false;
    notifyListeners();
  }
  fridayclick(){
    sundayy=false;
    monday=false;
    tuesday=false;
    wednesday=false;
    thursday=false;
    friday=true;
    saturday=false;
    notifyListeners();
  }

  saturdayclick(){
    sundayy=false;
    monday=false;
    tuesday=false;
    wednesday=false;
    thursday=false;
    friday=false;
    saturday=true;
    notifyListeners();
  }





  order1click(){
    today=true;
    weekly=false;
    overall=false;
    notifyListeners();
  }

  order2click(){
    today=false;
    weekly=true;
    overall=false;
    notifyListeners();
  }

  order3click(){
    today=false;
    weekly=false;
    overall=true;
    notifyListeners();
  }

  DateTime todayDate = DateTime.now();
  void onDaySelected(DateTime day,DateTime focusedDay)
  {
    todayDate=day;
    notifyListeners();
  }

  NewHabitModel();
}
class Cat {
  final String name;
  final String image;

  Cat({required this.name, required this.image});
}