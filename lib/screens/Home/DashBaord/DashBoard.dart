import 'package:mboa_pharmacie/components/AppBottomNavigation.dart/DashBaordBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../Theme/app_theme.dart';
import '../../../components/component_export.dart';
import '../../../services/localisationService/t_key.dart';
import '../../../widget/widget_export.dart';
import 'utils/get_screen_fragment.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  int selectedIndex = 1;
  String AppBarTitle = 'Gestion Hopital';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void AppBarName() {
    switch (selectedIndex) {
      case 0:
        AppBarTitle = 'Projet';
        break;
      case 1:
        AppBarTitle = 'Gestion Hopital';
        break;
      case 2:
        AppBarTitle = TKeys.download.translate(context);
        break;
      default:
        AppBarTitle = 'Gestion Hopital';
    }
  }

  _changeSelectedIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: getDashboardFragment(selectedIndex),
        bottomNavigationBar: DashBoardBottomNavigation(
          selectedIndex: selectedIndex,
          // ignore: void_checks
          OnTapCallbackfunction: _changeSelectedIndex,
        ));
  }
}
