import '../../../Theme/theme_export.dart';
import '../../../services/localisationService/t_key.dart';
  import 'package:flutter/material.dart';


List<BottomNavigationBarItem> getBottomItem(BuildContext context) {
    return [
            BottomNavigationBarItem(
        icon: Icon(
          Icons.list,
          color: Color.fromRGBO(78, 86, 107, 1),
          size: 24.66,
        ),
        label: "List",
        activeIcon: Icon(
          Icons.list,
          color: AppColors.primarydark,
          size: 24.66,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.add,
          color: Color.fromRGBO(78, 86, 107, 1),
          size: 24.66,
        ),
        label: "Ajoutez",
        activeIcon: Icon(
          Icons.add,
          color: AppColors.primarydark,
          size: 24.66,
        ),
      ),    
      BottomNavigationBarItem(
        icon: Icon(
          Icons.manage_accounts,
          color: Color.fromRGBO(78, 86, 107, 1),
          size: 24.66,
        ),
        label: "Peronne",
        activeIcon: Icon(
          Icons.manage_accounts,
          color: AppColors.primarydark,
          size: 24.66,
        ),
      ),    
      ];
  }
