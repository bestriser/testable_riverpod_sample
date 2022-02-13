import 'package:testable_riverpod_sample/domain/count.dart';
import 'package:testable_riverpod_sample/repository/count_repository.dart';
import 'package:testable_riverpod_sample/utility/constants.dart';

class CountRepositoryFake implements CountRepository {
  static final CountRepositoryFake _cache = CountRepositoryFake._internal();
  CountRepositoryFake._internal();
  factory CountRepositoryFake() => _cache;

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
