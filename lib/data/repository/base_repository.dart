import 'package:mboa_pharmacie/data/local/local_storage.dart';

abstract class BaseRepository {
  final LocalStorage _localStorage;

  BaseRepository(this._localStorage);
}
