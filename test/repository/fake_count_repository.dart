import 'package:testable_riverpod_sample/domain/count.dart';
import 'package:testable_riverpod_sample/repository/count_repository.dart';

import '../domain/dummy_count.dart';

class FakeCountRepository implements CountRepository {
  @override
  Future<void> setCount(Count count) => Future.value();

  @override
  Future<Count?> getCount(String countId) =>
      Future.value(DummyCount.initialValue);
}
