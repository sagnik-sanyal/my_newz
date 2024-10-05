import 'package:equatable/equatable.dart';

import '../../app/typedefs/typedefs.dart';

final class PaginatedResult<T extends Object> with EquatableMixin {
  const PaginatedResult({
    required this.results,
    this.currentPage = 1,
    this.totalResults = 0,
  });

  /// Empty [PaginatedResult] instance
  factory PaginatedResult.empty() => PaginatedResult<T>(results: <T>[]);

  factory PaginatedResult.fromJson(JSON json, T Function(JSON) fromJsonT) {
    return PaginatedResult<T>(
      totalResults: json['totalResults']! as int,
      currentPage: json['currentPage'] as int? ?? 1,
      results: switch (json['articles']) {
        final List<Object?> list => list.cast<JSON>().map(fromJsonT).toList(),
        _ => <T>[],
      },
    );
  }

  final int totalResults;
  final int currentPage;
  final List<T> results;

  /// Whether more data can be loaded
  bool canLoadMore() => results.length < totalResults;

  @override
  List<Object> get props => <Object>[totalResults, results];

  /// Copy the [PaginatedResult] with new values
  PaginatedResult<T> copyWith({
    int? totalItems,
    List<T>? items,
    int? currentPage,
  }) {
    return PaginatedResult<T>(
      totalResults: totalItems ?? this.totalResults,
      results: items ?? this.results,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
