

import '../../../core/base/export.dart';

class WeeklyViewModel extends BaseNotifier{

  TodayViewModel() {
    getDayAndCheckIcons(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]);
  }

   getDayAndCheckIcons(List<String> days) {
  }

  WeeklyViewModel();
}