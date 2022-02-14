import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testable_riverpod_sample/domain/count.dart';
import 'package:testable_riverpod_sample/repository/count_repository.dart';
import 'package:testable_riverpod_sample/utility/constants.dart';

final _currentCountProvider = FutureProvider(
    (ref) => ref.read(countRepositoryProvider).getCount(Constants.countId));

final counterProvider =
    StateNotifierProvider<CounterController, AsyncValue<Count?>>((ref) {
  final repo = ref.read(countRepositoryProvider);
  final currentCount = ref.watch(_currentCountProvider);
  return CounterController(repo, currentCount);
});

class CounterController extends StateNotifier<AsyncValue<Count?>> {
  CounterController(this._repo, currentCount) : super(currentCount);

  final CountRepository _repo;

  void increment() {
    if (state.value == null) return;
    state = AsyncValue.data(
      state.value!.copyWith(
        count: state.value!.count + 1,
        updatedAt: DateTime.now(),
      ),
    );
    _repo.setCount(state.value!);
  }
}
