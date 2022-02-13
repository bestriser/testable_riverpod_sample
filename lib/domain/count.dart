import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:testable_riverpod_sample/utility/date_time_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'count.freezed.dart';
part 'count.g.dart';

@freezed
abstract class Count with _$Count {
  const factory Count({
    required String countId,
    required int count,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _Count;

  factory Count.fromJson(Map<String, dynamic> json) => _$CountFromJson(json);
}
