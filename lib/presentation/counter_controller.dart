import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testable_riverpod_sample/repository/count_repository_impl.dart';
import 'package:testable_riverpod_sample/utility/constants.dart';

final counterProvider = StateNotifierProvider<CounterController, int>(
    (ref) => CounterController(ref));

class CounterController extends StateNotifier<int> {
  CounterController(this.ref) : super(0);
  final Ref ref;
  final _repo = CountRepositoryImpl();

  void increment() {
    state++;
    _repo.setCount(Constants.countId, state);
  }
}
