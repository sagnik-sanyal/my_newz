import 'package:equatable/equatable.dart';

import '../../app/typedefs/typedefs.dart';

final class PaginatedResult<T extends Object> with EquatableMixin {
  const PaginatedResult({
    required this.results,
    this.totalResults = 0,
    this.pageSize = 20,
  });

  factory PaginatedResult.fromJson(JSON json, T Function(JSON) fromJsonT) {
    return PaginatedResult<T>(
      totalResults: json['totalResults'] as int? ?? 0,
      results: switch (json['articles']) {
        final List<Object?> list => list.cast<JSON>().map(fromJsonT).toList(),
        _ => <T>[],
      },
    );
  }

  final int totalResults;
  final List<T> results;
  final int pageSize;

  /// Whether more data can be loaded
  bool canLoadMore() => results.length < totalResults;

  /// Whether the data is empty
  bool isEmpty() => results.isEmpty;

  /// Next Page
  int nextPage() => (results.length / pageSize).ceil() + 1;

  @override
  List<Object> get props => <Object>[totalResults, results];

  /// Copy the [PaginatedResult] with new values
  PaginatedResult<T> copyWith({int? totalItems, List<T>? results}) {
    return PaginatedResult<T>(
      totalResults: totalItems ?? this.totalResults,
      results: results ?? this.results,
    );
  }
}
