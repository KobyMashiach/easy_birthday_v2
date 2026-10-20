import 'package:easy_birthday/core/widgets/cards/capsule_expanded_text_card.dart';
import 'package:easy_birthday/core/widgets/general/countries_codes_dropdown.dart';
import 'package:easy_birthday/features/event/data/models/text_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

/// Small phone (360x640 dp) at the largest text scale the app allows (1.6,
/// see main.dart), in both languages.
const _small = Size(360, 640);
const _locales = [Locale('he'), Locale('en')];

Future<void> _pump(
  WidgetTester tester,
  Widget child, {
  required Locale locale,
  Size size = _small,
  double textScale = 1.6,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  tester.platformDispatcher.textScaleFactorTestValue = textScale;
  addTearDown(tester.view.reset);
  addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
  await tester.pumpWidget(
    MaterialApp(
      locale: locale,
      supportedLocales: _locales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: Scaffold(body: child),
    ),
  );
  await tester.pumpAndSettle();
}

/// The phone row exactly as login/register/partner details lay it out.
Widget _phoneRow({String? dialCode}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24),
  child: Directionality(
    textDirection: TextDirection.ltr,
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: CountriesCodesDropdown(
            onCountryChange: (_) {},
            countryDialCode: dialCode,
          ),
        ),
        const Expanded(flex: 6, child: SizedBox(height: 55)),
      ],
    ),
  ),
);

const _textItem = TextItemModel(
  title: 'relationship',
  text: 'A very long title for the ready made text option',
  items: ['Short', 'A much longer option to choose from', 'Third'],
);

Widget _capsule({
  required bool expanded,
  double? titleSize,
  bool displayResult = false,
}) => Padding(
  padding: const EdgeInsets.all(12),
  child: CapsuleExpandedTextCard(
    isExpanded: expanded,
    onTap: () {},
    onTextChosen: (_) {},
    textItems: _textItem,
    textChoose: true,
    titleSize: titleSize,
    displayResult: displayResult,
    currentValue: 'A long chosen value that does not fit',
  ),
);

void main() {
  for (final locale in _locales) {
    final lang = locale.languageCode;

    testWidgets('countries dropdown fits ($lang, 360, x1.6)', (tester) async {
      for (final code in ['+972', '+1876', '+44']) {
        await _pump(tester, _phoneRow(dialCode: code), locale: locale);
        expect(tester.takeException(), isNull, reason: code);
      }
    });

    for (final expanded in [false, true]) {
      for (final (name, titleSize, displayResult) in [
        ('choose texts', null, false),
        ('generate greeting', 200.0, true),
      ]) {
        testWidgets(
          'capsule card $name ${expanded ? 'expanded' : 'collapsed'} '
          'fits ($lang, 360, x1.6)',
          (tester) async {
            await _pump(
              tester,
              _capsule(
                expanded: expanded,
                titleSize: titleSize,
                displayResult: displayResult,
              ),
              locale: locale,
            );
            expect(tester.takeException(), isNull);
          },
        );
      }
    }
  }

  testWidgets('countries dropdown is not scaled when it fits', (tester) async {
    await _pump(
      tester,
      _phoneRow(),
      locale: const Locale('en'),
      size: const Size(800, 640),
      textScale: 1,
    );
    final fitted = find.descendant(
      of: find.byType(CountriesCodesDropdown),
      matching: find.byType(FittedBox),
    );
    final row = find.descendant(of: fitted, matching: find.byType(Row));
    expect(tester.getSize(fitted), tester.getSize(row.first));
  });
}
