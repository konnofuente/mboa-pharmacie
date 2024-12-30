import 'package:get_storage/get_storage.dart';

import '../local_storage.dart';

class LocalStorageImpl extends LocalStorage {
  final GetStorage _storage;

  LocalStorageImpl(this._storage);
}
