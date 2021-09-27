import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_tutorial/widget_test/todo_list.dart';

void main() {
  testWidgets('Add and remove a todo', (widgetTester) async {
    await widgetTester.pumpWidget(const TodoList());
    await widgetTester.enterText(find.byType(TextField), 'hi');

    await widgetTester.tap(find.byType(FloatingActionButton));

    await widgetTester.pump();
    expect(find.text('hi'), findsOneWidget);

    await widgetTester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));
    await widgetTester.pumpAndSettle();

    expect(find.text('hi'), findsNothing);
  });
}
