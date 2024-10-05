import 'dart:async';
import 'dart:io' show Directory;

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../models/cached_models.dart';
import 'objectbox.g.dart';

/// Cache store for ObjectBox
final class ObjectBoxCacheStore extends CacheStore {
  ObjectBoxCacheStore() {
    clean(staleOnly: true);
  }

  /// Build cache store with cache options
  CacheOptions addOptions() {
    return CacheOptions(store: this, maxStale: const Duration(days: 1));
  }

  /// ObjectBox store variables
  Store? _store;
  Box<CacheResponseBox>? _box;

  /// Open ObjectBox store
  FutureOr<Box<CacheResponseBox>> _openBox() async {
    if (_box != null) return _box!;
    final Directory dir = await getApplicationDocumentsDirectory();
    _store = Store(getObjectBoxModel(), directory: p.join(dir.path, 'cache'));
    return _box = _store!.box<CacheResponseBox>();
  }

  @override
  Future<void> clean({
    CachePriority priorityOrBelow = CachePriority.high,
    bool staleOnly = false,
  }) async {
    final Box<CacheResponseBox> box = await _openBox();
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
    final Box<CacheResponseBox> box = await _openBox();
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
    final Box<CacheResponseBox> box = await _openBox();
    _getFromPath(
      pathPattern,
      box: box,
      queryParams: queryParams,
      onResponseMatch: (CacheResponseBox r) => box.remove(r.id ?? 0),
    );
  }

  @override
  Future<bool> exists(String key) async {
    final Box<CacheResponseBox> box = await _openBox();
    final Query<CacheResponseBox> query =
        box.query(CacheResponseBox_.key.equals(key)).build();
    final bool result = query.findFirst() != null;
    query.close();
    return result;
  }

  @override
  Future<CacheResponse?> get(String key) async {
    final Box<CacheResponseBox> box = await _openBox();
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
      box: await _openBox(),
      queryParams: queryParams,
      onResponseMatch: (CacheResponseBox r) => responses.add(r.toObject()),
    );
    return responses;
  }

  @override
  Future<void> set(CacheResponse response) async {
    final Box<CacheResponseBox> box = await _openBox();
    await delete(response.key);
    box.put(CacheResponseBox.fromObject(response));
  }

  void _getFromPath(
    RegExp pathPattern, {
    required Box<CacheResponseBox> box,
    required void Function(CacheResponseBox) onResponseMatch,
    Map<String, String?>? queryParams,
  }) {
    final List<dynamic> results = <CacheResponseBox>[];
    const int limit = 10;
    int offset = 0;
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
