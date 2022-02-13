import 'package:flutter/material.dart';
import 'package:testable_riverpod_sample/presentation/counter_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testable Riverpod Sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(title: 'Testable Riverpod Sample'),
    );
  }
}
