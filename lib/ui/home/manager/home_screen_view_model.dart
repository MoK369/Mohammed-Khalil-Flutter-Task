import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends ChangeNotifier {
  int _currentNavItemIndex = 0;
  PageController pageViewController = PageController(initialPage: 0);

  int get currentNavItemIndex => _currentNavItemIndex;

  void changeSelectedNavItem(int newIndex) {
    if(newIndex == _currentNavItemIndex) return;
    _currentNavItemIndex = newIndex;
    pageViewController.jumpToPage(_currentNavItemIndex);
    notifyListeners();
  }

  void onPageChange(int index) {
    if(index == _currentNavItemIndex) return;
    _currentNavItemIndex = index;
    notifyListeners();
  }
}
