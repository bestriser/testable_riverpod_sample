import 'package:testable_riverpod_sample/repository/count_repository.dart';

class CountRepositoryFake implements CountRepository {
  static final CountRepositoryFake _cache = CountRepositoryFake._internal();
  CountRepositoryFake._internal();
  factory CountRepositoryFake() => _cache;

  @override
  Future<void> setCount(String countId, int count) => Future.value();

  @override
  Future<int> getCount(String countId) => Future.value(5);
}
