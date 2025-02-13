

import '../../core/base/export.dart';

class HomeViewModel extends BaseNotifier{


  var today = true;
  var weekly = false;
  var overall = false;


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

  HomeViewModel();
}