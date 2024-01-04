import 'package:flutter/material.dart';

class NavigationHelper {
  late GlobalKey<NavigatorState> navigationKey;
  static NavigationHelper instance = NavigationHelper();

  NavigationHelper() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  goBack() {
    return navigationKey.currentState!.pop();
  }

  goPush({required Widget widget}) {
    return navigationKey.currentState!
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  showLoading() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: navigationKey.currentContext!,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    });
  }
}
