import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<CounterController, int>(
    (ref) => CounterController(ref));

class CounterController extends StateNotifier<int> {
  CounterController(this.ref) : super(0);
  final Ref ref;

  void increment() => state++;
}
