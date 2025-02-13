import 'package:flutter/material.dart';

class AppNav {
  final _begin = const Offset(0.0, 1.0);
  final _end = Offset.zero;
  final _curve = Curves.ease;

  to({context, required Widget screen, arguments}) {
    Navigator.push(
      context!,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionsBuilder: (_, animation, __, child) {
          var tween =
              Tween(begin: _begin, end: _end).chain(CurveTween(curve: _curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: RouteSettings(
          arguments: arguments,
        ),
      ),
    );
  }

  off({context, required Widget screen, arguments}) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionsBuilder: (_, animation, __, child) {
          var tween =
          Tween(begin: _begin, end: _end).chain(CurveTween(curve: _curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: RouteSettings(
          arguments: arguments,
        ),
      ),
    );
  }

  back(BuildContext context) {
    Navigator.pop(context);
  }

  offAll({context, required Widget screen, arguments}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionsBuilder: (_, animation, __, child) {
          var tween =
          Tween(begin: _begin, end: _end).chain(CurveTween(curve: _curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: RouteSettings(
          arguments: arguments,
        ),
      ),
      ModalRoute.withName('/'),
    );
  }
}
