import 'package:mboa_pharmacie/models/GridInfo.dart';
import 'package:mboa_pharmacie/resources/assets_manager.dart';

class FakeData {
  final List<GridInfo> _userList = <GridInfo>[
    GridInfo(name: "Admin", image: ImageAssets.admin),
    GridInfo(
        name: "Responsable de laboratoire", image: ImageAssets.admin),
  ];
  List<GridInfo> get userList => _userList;
}
