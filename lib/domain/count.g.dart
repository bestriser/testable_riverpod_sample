// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Count _$$_CountFromJson(Map<String, dynamic> json) => _$_Count(
      countId: json['countId'] as String,
      count: json['count'] as int,
      updatedAt:
          const DateTimeConverter().fromJson(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_CountToJson(_$_Count instance) => <String, dynamic>{
      'countId': instance.countId,
      'count': instance.count,
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };
