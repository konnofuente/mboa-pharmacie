import 'package:flutter/material.dart';
import '../../../Theme/app_theme.dart';
import 'utils/get_screen_fragment.dart';
import '../../../components/component_export.dart';
import '../../../services/localisationService/t_key.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:mboa_pharmacie/components/AppBottomNavigation.dart/DashBaordBottomNavigation.dart';


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
