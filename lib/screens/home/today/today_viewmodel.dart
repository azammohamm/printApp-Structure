



import '../../../core/base/export.dart';

class TodayViewModel extends BaseNotifier{

  var order1 = true;
  var order2 = false;
  var order3 = false;
  var order4 = false;
  order1click(){
    order1=true;
    order2=false;
    order3=false;
    order4=false;
    notifyListeners();
  }

  order2click(){
    order1=false;
    order2=true;
    order3=false;
    order4=false;
    notifyListeners();
  }

  order3click(){
    order1=false;
    order2=false;
    order3=true;
    order4=false;
    notifyListeners();
  }

  order4click(){
    order1=false;
    order2=false;
    order3=false;
    order4=true;
    notifyListeners();
  }


  var buttonMonthly1 = true;
  var buttonMonthly2 = false;
  var buttonMonthly3 = false;
  var buttonMonthly4 = false;


  monthly1Click(){
    buttonMonthly1=true;
    buttonMonthly2=false;
    buttonMonthly3=false;
    buttonMonthly4=false;
    notifyListeners();
  }

  monthly2Click(){
    buttonMonthly1=false;
    buttonMonthly2=true;
    buttonMonthly3=false;
    buttonMonthly4=false;
    notifyListeners();
  }

  monthly3Click(){
    buttonMonthly1=false;
    buttonMonthly2=false;
    buttonMonthly3=true;
    buttonMonthly4=false;
    notifyListeners();
  }

  monthly4Click(){
    buttonMonthly1=false;
    buttonMonthly2=false;
    buttonMonthly3=false;
    buttonMonthly4=true;
    notifyListeners();
  }


  TodayViewModel();
}