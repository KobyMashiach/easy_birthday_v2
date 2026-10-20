import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/design_kit/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel shareChannel = MethodChannel(
    'dev.fluttercommunity.plus/share',
  );

  testWidgets(
    'Share app shares an invite with the store link',
    (
      tester,
    ) async {
      final List<MethodCall> calls = [];
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        shareChannel,
        (call) async {
          calls.add(call);
          return 'dev.fluttercommunity.plus/share/unavailable';
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          shareChannel,
          null,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => kheasydevAppDrawerV2(
                name: 'Koby',
                color: Colors.pink,
                context: context,
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text(t.share_app));
      await tester.pump();

      expect(calls, hasLength(1));
      final String text = (calls.single.arguments as Map)['text'] as String;
      expect(text, t.share_app_message(url: playStoreUrl));
      expect(text, contains(playStoreUrl));
      expect(text, isNot(anyOf('android', 'ios')));
    },
    variant: TargetPlatformVariant.mobile(),
  );
}
