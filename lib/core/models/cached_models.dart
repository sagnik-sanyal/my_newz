import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
final class CacheResponseBox with EquatableMixin {
  CacheResponseBox({
    required this.key,
    required this.priority,
    required this.responseDate,
    required this.url,
    this.content,
    this.date,
    this.eTag,
    this.expires,
    this.headers,
    this.lastModified,
    this.maxStale,
    this.requestDate,
  });

  @Id()
  int? id;
  String key;

  @Property(type: PropertyType.byteVector)
  List<int>? content;

  @Property(type: PropertyType.date)
  DateTime? date;

  String? eTag;

  @Property(type: PropertyType.date)
  DateTime? expires;

  @Property(type: PropertyType.byteVector)
  List<int>? headers;

  String? lastModified;

  @Property(type: PropertyType.date)
  DateTime? maxStale;

  @Property(type: PropertyType.date)
  DateTime responseDate;

  @Property(type: PropertyType.date)
  DateTime? requestDate;

  String url;

  int priority;

  final ToOne<CacheControlBox> cacheControl = ToOne<CacheControlBox>();

  CachePriority get cachePriority {
    return switch (priority) {
      0 => CachePriority.low,
      1 => CachePriority.normal,
      2 => CachePriority.high,
      _ => CachePriority.low,
    };
  }

  CacheResponse toObject() {
    return CacheResponse(
      cacheControl: cacheControl.target?.toObject() ?? CacheControl(),
      content: content,
      date: date,
      eTag: eTag,
      expires: expires,
      headers: headers,
      key: key,
      lastModified: lastModified,
      maxStale: maxStale,
      priority: cachePriority,
      responseDate: responseDate,
      url: url,
      requestDate: requestDate ??
          responseDate.subtract(const Duration(milliseconds: 150)),
    );
  }

  static CacheResponseBox fromObject(CacheResponse response) {
    final CacheResponseBox result = CacheResponseBox(
      key: response.key,
      content: response.content,
      date: response.date,
      eTag: response.eTag,
      expires: response.expires,
      headers: response.headers,
      lastModified: response.lastModified,
      maxStale: response.maxStale,
      responseDate: response.responseDate,
      url: response.url,
      requestDate: response.requestDate,
      priority: response.priority.index,
    );

    result.cacheControl.target = CacheControlBox(
      maxAge: response.cacheControl.maxAge,
      privacy: response.cacheControl.privacy,
      noCache: response.cacheControl.noCache,
      noStore: response.cacheControl.noStore,
      other: response.cacheControl.other,
    );

    return result;
  }

  @override
  List<Object?> get props {
    return <Object?>[
      id,
      key,
      responseDate,
      url,
      priority,
      content,
      date,
      eTag,
      expires,
      headers,
      lastModified,
      maxStale,
      requestDate,
    ];
  }
}

@Entity()
class CacheControlBox with EquatableMixin {
  CacheControlBox({
    this.id,
    this.maxAge,
    this.privacy,
    this.noCache,
    this.noStore,
    this.other,
  });

  @Id()
  int? id;
  int? maxAge;
  String? privacy;
  bool? noCache;
  bool? noStore;
  List<String>? other;
  int? maxStale;
  int? minFresh;
  bool? mustRevalidate;

  CacheControl toObject() {
    return CacheControl(
      maxAge: maxAge ?? -1,
      privacy: privacy,
      noCache: noCache ?? false,
      noStore: noStore ?? false,
      other: other ?? <String>[],
      maxStale: maxStale ?? -1,
      minFresh: minFresh ?? -1,
      mustRevalidate: mustRevalidate ?? false,
    );
  }

  @override
  List<Object?> get props {
    return <Object?>[
      id,
      maxAge,
      privacy,
      noCache,
      noStore,
      other,
      maxStale,
      minFresh,
      mustRevalidate,
    ];
  }
}
