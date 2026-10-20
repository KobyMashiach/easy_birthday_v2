import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/data/repositories_impl/event_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

void main() {
  setUp(SessionService().reset);
  tearDown(SessionService().reset);

  test(
    'updatePlan writes only planSubscribe and keeps live categories',
    () async {
      final remote = FakeEventRemote();
      final repository = EventRepositoryImpl(remoteDataSource: remote);
      const liveCategory = CategoryModel(
        id: 'c1',
        categoryType: CategoryEnum.text,
        name: 'Text',
        description: '',
      );
      // The session already has a category the purchase's (older) copy lacks.
      final stale = EventModel(
        eventId: 'e1',
        users: const ['1', '2'],
        planSubscribe: getPlan(PlansEnum.free),
      );
      SessionService().event = stale.copyWith(categories: [liveCategory]);

      await repository.updatePlan(stale, getPlan(PlansEnum.platinum));

      expect(remote.updates.single.keys, ['planSubscribe']);
      expect(SessionService().event!.planSubscribe.isPlatinum, isTrue);
      expect(SessionService().event!.categories, [liveCategory]);
    },
  );
}
