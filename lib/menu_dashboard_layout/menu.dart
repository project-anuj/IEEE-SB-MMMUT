import 'package:flutter/material.dart';
import 'package:testing/menu_dashboard_layout/menu_nav.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;

  const Menu(
      {Key key, this.slideAnimation, this.menuAnimation, this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuNav(
      slideAnimation: slideAnimation,
      menuAnimation: menuAnimation,
      selectedIndex: selectedIndex,
    );
  }
}
