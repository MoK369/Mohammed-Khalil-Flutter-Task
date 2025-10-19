import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/routing/defined_routes.dart';
import 'package:otex_flutter_task/ui/plans/plans_screen.dart';

abstract class RouteMethods {
  static Route<dynamic> getRoute(settings) {
    final name = settings.name;
    //final args = settings.args;
    try {
      switch (name) {
        case DefinedRoutes.plansScreen:
          return MaterialPageRoute(builder: (context) => const PlansScreen());
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Material(
          child: Container(
            color: Colors.red,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
