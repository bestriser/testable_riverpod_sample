import 'package:testable_riverpod_sample/domain/count.dart';

abstract class CountRepository {
  Future<void> setCount(Count count);
  Future<Count?> getCount(String uid);
}
