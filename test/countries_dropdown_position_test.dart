import 'package:easy_birthday/core/widgets/general/countries_codes_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

/// Regression: in Hebrew the country list opened off the left edge of the
/// screen (it resolved its direction from the overlay, not the LTR phone row).
void main() {
  for (final locale in const [Locale('he'), Locale('en')]) {
    testWidgets('country list opens on-screen (${locale.languageCode})', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          supportedLocales: const [Locale('he'), Locale('en')],
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CountriesCodesDropdown(onCountryChange: (_) {}),
                    ),
                    const Expanded(flex: 6, child: SizedBox(height: 55)),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CountriesCodesDropdown));
      await tester.pumpAndSettle();

      final list = tester.getRect(
        find
            .descendant(
              of: find.byType(CompositedTransformFollower),
              matching: find.byType(Material),
            )
            .first,
      );
      expect(list.left, greaterThanOrEqualTo(0));
      expect(list.right, lessThanOrEqualTo(390));
    });
  }
}
