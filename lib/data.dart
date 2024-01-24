import 'package:mboa_pharmacie/models/GridInfo.dart';

class FakeData {
  final List<GridInfo> _userList = <GridInfo>[
    GridInfo(name: "Admin", image: 'assets/Images/admin.png'),
    GridInfo(
        name: "Responsable de laboratoire", image: 'assets/Images/doctor.png'),
  ];
  List<GridInfo> get userList => _userList;
}
