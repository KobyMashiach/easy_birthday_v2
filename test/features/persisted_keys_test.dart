import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('persisted JSON keys', () {
    // Dart field names were corrected, but documents already in Firestore use
    // the original keys — they must keep round-tripping.
    test('event chosenTexts is stored as choosenTexts', () {
      final event = EventModel(
        eventId: 'e',
        users: const ['1', '2'],
        planSubscribe: getPlan(PlansEnum.free),
        chosenTexts: const {'title_text': 'Happy'},
      );
      final json = event.toJson();
      expect(json['choosenTexts'], {'title_text': 'Happy'});
      expect(EventModel.fromJson(json).chosenTexts, {'title_text': 'Happy'});
    });

    test('category surpriseMap is stored as supriseMap', () {
      const category = CategoryModel(
        categoryType: CategoryEnum.birthdaySuprise,
        name: 'S',
        description: '',
        surpriseMap: {
          0: {'title': 'Hi'},
        },
      );
      final json = category.toJson();
      expect(json.containsKey('supriseMap'), isTrue);
      expect(CategoryModel.fromJson(json).surpriseMap, {
        0: {'title': 'Hi'},
      });
    });
  });
}
