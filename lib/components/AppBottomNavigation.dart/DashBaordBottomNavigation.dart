import 'package:mboa_pharmacie/components/AppBottomNavigation.dart/ListBottomNavigationItem.dart';
import 'package:flutter/material.dart';
import '../../Theme/theme_export.dart';

class DashBoardBottomNavigation extends StatefulWidget {
  late int selectedIndex;
  late Function OnTapCallbackfunction;
  // final Function(int) onTabSelected;

  DashBoardBottomNavigation(
      {required this.selectedIndex, required this.OnTapCallbackfunction
      // required this.onTabSelected,
      });

  @override
  State<DashBoardBottomNavigation> createState() =>
      _DashBoardBottomNavigationState();
}

class _DashBoardBottomNavigationState extends State<DashBoardBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.bottomtap,
      items: ListBottomNavigationItem().dashboardListItem(context),
      onTap: (val) {
        widget.OnTapCallbackfunction(val);
      },
      currentIndex: widget.selectedIndex,
    );
  }
}
