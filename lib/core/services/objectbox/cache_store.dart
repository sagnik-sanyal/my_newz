import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../../models/cached_models.dart';
import 'objectbox.g.dart';

/// Cache store for ObjectBox
final class ObjectBoxCacheStore extends CacheStore {
  ObjectBoxCacheStore({required this.storePath}) {
    clean(staleOnly: true);
  }

  /// ObjectBox store variables
  final String storePath;
  Store? _store;
  Box<CacheResponseBox>? _box;

  Box<CacheResponseBox> _openBox() {
    if (_box != null) return _box!;
    _store = Store(getObjectBoxModel(), directory: '$storePath/store');
    return _box = _store!.box<CacheResponseBox>();
  }

  @override
  Future<void> clean({
    CachePriority priorityOrBelow = CachePriority.high,
    bool staleOnly = false,
  }) async {
    final Box<CacheResponseBox> box = _openBox();
    final Query<CacheResponseBox> query = box
        .query(CacheResponseBox_.priority.lessOrEqual(priorityOrBelow.index))
        .build();
    final List<CacheResponseBox> results = query.find();
    query.close();
    for (final CacheResponseBox result in results) {
      if ((staleOnly && result.toObject().isStaled()) || !staleOnly) {
        box.remove(result.id!);
      }
    }
  }

  @override
  Future<void> close() async => _store?.close();

  @override
  Future<void> delete(String key, {bool staleOnly = false}) async {
    final Box<CacheResponseBox> box = _openBox();
    final Query<CacheResponseBox> query =
        box.query(CacheResponseBox_.key.equals(key)).build();
    final CacheResponseBox? resp = query.findFirst();
    query.close();
    if (resp == null) return;
    if (staleOnly && !resp.toObject().isStaled()) return;
    box.remove(resp.id!);
  }

  @override
  Future<void> deleteFromPath(
    RegExp pathPattern, {
    Map<String, String?>? queryParams,
  }) async {
    final Box<CacheResponseBox> box = _openBox();
    _getFromPath(
      pathPattern,
      queryParams: queryParams,
      onResponseMatch: (CacheResponseBox r) => box.remove(r.id ?? 0),
    );
  }

  @override
  Future<bool> exists(String key) async {
    final Box<CacheResponseBox> box = _openBox();
    final Query<CacheResponseBox> query =
        box.query(CacheResponseBox_.key.equals(key)).build();
    final bool result = query.findFirst() != null;
    query.close();
    return result;
  }

  @override
  Future<CacheResponse?> get(String key) async {
    final Box<CacheResponseBox> box = _openBox();
    final Query<CacheResponseBox> query =
        box.query(CacheResponseBox_.key.equals(key)).build();
    final CacheResponseBox? resp = query.findFirst();
    query.close();
    return resp?.toObject();
  }

  @override
  Future<List<CacheResponse>> getFromPath(
    RegExp pathPattern, {
    Map<String, String?>? queryParams,
  }) async {
    final List<CacheResponse> responses = <CacheResponse>[];
    _getFromPath(
      pathPattern,
      queryParams: queryParams,
      onResponseMatch: (CacheResponseBox r) => responses.add(r.toObject()),
    );
    return responses;
  }

  @override
  Future<void> set(CacheResponse response) async {
    final Box<CacheResponseBox> box = _openBox();
    await delete(response.key);
    box.put(CacheResponseBox.fromObject(response));
  }

  void _getFromPath(
    RegExp pathPattern, {
    required void Function(CacheResponseBox) onResponseMatch,
    Map<String, String?>? queryParams,
  }) {
    final List<dynamic> results = <CacheResponseBox>[];
    const int limit = 10;
    int offset = 0;
    final Box<CacheResponseBox> box = _openBox();
    do {
      final Query<CacheResponseBox> query = box.query().build()
        ..limit = limit
        ..offset = offset;
      final List<CacheResponseBox> results = query.find();
      query.close();
      for (final CacheResponseBox result in results) {
        if (pathExists(result.url, pathPattern, queryParams: queryParams)) {
          onResponseMatch.call(result);
        }
      }
      offset += limit;
    } while (results.isNotEmpty);
  }
}
