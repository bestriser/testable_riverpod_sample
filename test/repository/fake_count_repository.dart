import 'package:testable_riverpod_sample/domain/count.dart';
import 'package:testable_riverpod_sample/repository/count_repository.dart';
import 'package:testable_riverpod_sample/utility/constants.dart';

class FakeCountRepository implements CountRepository {
  static final FakeCountRepository _cache = FakeCountRepository._internal();
  FakeCountRepository._internal();
  factory FakeCountRepository() => _cache;

  @override
  Future<void> setCount(Count count) => Future.value();

  @override
  Future<Count?> getCount(String countId) async {
    return Count(
      countId: Constants.countId,
      count: 5,
      updatedAt: DateTime(2022, 2, 14),
    );
  }
}
