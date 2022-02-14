import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testable_riverpod_sample/presentation/counter_controller.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counterProvider);
    final controller = ref.read(counterProvider.notifier);

    Widget _counterText(String text) =>
        Text(text, style: Theme.of(context).textTheme.headline4);

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            state.when(
              loading: () => _counterText('読み込み中...'),
              error: (error, _) => _counterText('$error'),
              data: (count) => _counterText('${count?.count ?? 0}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
