import 'package:flutter/material.dart';
import 'package:print_app/core/base/export.dart';
import '../services/cache_manager.dart';

class BaseNotifier extends ChangeNotifier with CacheManager{

  bool disposed = false;

  BaseNotifier();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

}