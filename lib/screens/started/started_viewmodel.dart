
import 'package:flutter/cupertino.dart';

import '../../core/base/export.dart';


class StartedViewModel extends BaseNotifier{
  bool? get isIntro=>getIntroRun();
  final formKey = GlobalKey<FormState>();
  StartedViewModel();
}
