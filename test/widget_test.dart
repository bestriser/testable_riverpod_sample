import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testable_riverpod_sample/app.dart';
import 'package:testable_riverpod_sample/repository/count_repository.dart';

import 'repository/fake_count_repository.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          countRepositoryProvider.overrideWithValue(FakeCountRepository())
        ],
        child: const App(),
      ),
    );

    // The first frame is a loading state.
    expect(find.text('読み込み中...'), findsOneWidget);
    expect(find.text('5'), findsNothing);
    expect(find.text('6'), findsNothing);

    // Re-render. TodoListProvider should have finished fetching the todos by now
    await tester.pump();

    // Verify that our counter starts at 0.
    expect(find.text('読み込み中...'), findsNothing);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('読み込み中...'), findsNothing);
    expect(find.text('5'), findsNothing);
    expect(find.text('6'), findsOneWidget);
  });
}
