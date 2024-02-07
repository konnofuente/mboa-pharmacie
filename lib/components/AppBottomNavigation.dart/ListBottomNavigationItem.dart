import 'package:flutter/material.dart';
import '../../Theme/theme_export.dart';
import '../../services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/resources/value_manager.dart';


class ListBottomNavigationItem {
  List<BottomNavigationBarItem> dashboardListItem(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.info,
          color: Color.fromRGBO(78, 86, 107, 1),
          size: AppSize.s24,
        ),
        label: TKeys.screen.translate(context),
        activeIcon: Icon(
          Icons.info,
          color: AppColors.primarydark,
          size: AppSize.s24,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Color.fromRGBO(78, 86, 107, 1),
          size: AppSize.s24,
        ),
        label: TKeys.home.translate(context),
        activeIcon: Icon(
          Icons.home,
          color: AppColors.primarydark,
          size:
              23.00, // Adjusted the size for the active icon, as in your original code
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.medical_services_rounded,
          color: Color.fromRGBO(78, 86, 107, 1),
          size: AppSize.s24,
        ),
        label: TKeys.ordonance.translate(context),
        activeIcon: Icon(
          Icons.medical_services_rounded,
          color: AppColors.primarydark,
          size: AppSize.s24,
        ),
      ),
    ];
  }
}
