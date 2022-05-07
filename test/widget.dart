import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:shortener_nu/main.dart';
import 'package:shortener_nu/providers/list_url_provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ListenableProvider<ListAliasURL>(
            create: (_) => ListAliasURL(),
          ),
        ],
        child: const MyApp(),
      ),
    );
    // await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pump(const Duration(seconds: 4));
    // find the widgets
    final addText = find.byKey(const ValueKey(Key("insertUrltxt")));
    final addButton = find.byKey(const ValueKey(Key("tapToInsertxt")));
    await tester.enterText(addText, "https://github.com/");
    await tester.tap(addButton);
    await tester.pump(const Duration(seconds: 3));

    expect(find.byKey(const ValueKey(Key('tapToInsertxt'))), findsOneWidget);
  });
}
