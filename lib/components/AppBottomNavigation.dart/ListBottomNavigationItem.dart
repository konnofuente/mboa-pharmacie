import 'package:flutter/material.dart';

import '../../Theme/theme_export.dart';
import '../../services/localisationService/t_key.dart';

class ListBottomNavigationItem {
  List<BottomNavigationBarItem> dashboardListItem(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.info,
          color: Color.fromRGBO(78, 86, 107, 1),
          size: 24.66,
        ),
        label: TKeys.project.translate(context),
        activeIcon: Icon(
          Icons.info,
          color: AppColors.primarydark,
          size: 24.66,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.category,
          color: Color.fromRGBO(78, 86, 107, 1),
          size: 24.66,
        ),
        label: TKeys.category.translate(context),
        activeIcon: Icon(
          Icons.category,
          color: AppColors.primarydark,
          size:
              23.00, // Adjusted the size for the active icon, as in your original code
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.dashboard,
          color: Color.fromRGBO(78, 86, 107, 1),
          size: 24.66,
        ),
        label: TKeys.stat.translate(context),
        activeIcon: Icon(
          Icons.dashboard,
          color: AppColors.primarydark,
          size: 24.66,
        ),
      ),
    ];
  }
}
