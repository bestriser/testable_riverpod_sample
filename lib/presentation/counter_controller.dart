import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testable_riverpod_sample/domain/count.dart';
import 'package:testable_riverpod_sample/repository/count_repository_impl.dart';
import 'package:testable_riverpod_sample/utility/constants.dart';

final counterProvider = StateNotifierProvider<CounterController, Count>(
    (ref) => CounterController(ref));

class CounterController extends StateNotifier<Count> {
  CounterController(this.ref)
      : super(Count(countId: Constants.countId, count: 0));

  final Ref ref;
  final _repo = CountRepositoryImpl();

  void increment() {
    state = state.copyWith(count: state.count + 1, updatedAt: DateTime.now());
    _repo.setCount(state);
  }
}
