import 'package:easy_birthday/core/widgets/design_kit/app_button.dart';
import 'package:easy_birthday/core/widgets/design_kit/dialogs.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('bottom button bar stays compact (does not fill the screen)', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox.expand(),
          bottomNavigationBar: AppButtonsBottomNavigationBar(oneButton: true),
        ),
      ),
    );
    final barHeight = tester
        .getSize(find.byType(AppButtonsBottomNavigationBar))
        .height;
    expect(barHeight, lessThan(140));
  });

  testWidgets('long labels in narrow dialog buttons stay on one line', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: KhEasydevDialogV2(
            title: 'Title',
            buttons: [
              for (final text in ['Edit item', 'Delete item', 'Exit now'])
                kheasydevAppButton(text: text, onTap: () {}),
            ],
          ),
        ),
      ),
    );
    for (final text in ['Edit item', 'Delete item', 'Exit now']) {
      final textBox = tester.getSize(find.text(text));
      final style = tester.widget<Text>(find.text(text)).style!;
      // One line: the rendered text is no taller than a single line.
      expect(textBox.height, lessThanOrEqualTo(style.fontSize! * 1.6));
    }
  });
}
