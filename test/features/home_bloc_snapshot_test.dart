import 'dart:async';
import 'dart:io';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/add_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/add_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_media_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_current_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/replace_memory_game_images_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/watch_event_usecase.dart';
import 'package:easy_birthday/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

/// [FakeEventRepository] whose [snapshots] play the Firestore watch stream
/// and whose uploads each wait for [releaseUpload].
class _GatedEventRepository extends FakeEventRepository {
  final StreamController<EventModel?> snapshots = StreamController();
  final List<Completer<void>> _pendingUploads = [];
  int _uploads = 0;

  Future<void> releaseUpload() async {
    while (_pendingUploads.isEmpty) {
      await Future<void>.delayed(Duration.zero);
    }
    _pendingUploads.removeAt(0).complete();
  }

  @override
  Stream<EventModel?> watchEvent(String eventId) => snapshots.stream.map((e) {
    SessionService().event = e;
    return e;
  });

  @override
  Future<String> uploadMedia({
    required String folder,
    required File file,
    String? fileName,
  }) async {
    final gate = Completer<void>();
    _pendingUploads.add(gate);
    await gate.future;
    return 'https://media/${_uploads++}';
  }
}

const _pictures = CategoryModel(
  categoryType: CategoryEnum.pictures,
  name: 'Pictures',
  description: '',
  id: 'c1',
  titleAppear: 'Pics',
);

HomeBloc _bloc(FakeEventRepository repository) => HomeBloc(
  addCategoryUseCase: AddCategoryUseCase(repository),
  updateCategoryUseCase: UpdateCategoryUseCase(repository),
  deleteCategoryUseCase: DeleteCategoryUseCase(repository),
  getCurrentCategoryUseCase: GetCurrentCategoryUseCase(repository),
  watchEventUseCase: WatchEventUseCase(repository),
  addCategoryFilesUseCase: AddCategoryFilesUseCase(repository),
  deleteCategoryFilesUseCase: DeleteCategoryFilesUseCase(repository),
  replaceMemoryGameImagesUseCase: ReplaceMemoryGameImagesUseCase(repository),
  uploadCategoryFilesUseCase: UploadCategoryFilesUseCase(repository),
  deleteMediaUseCase: DeleteMediaUseCase(repository),
);

void main() {
  late _GatedEventRepository repository;
  late HomeBloc bloc;
  late List<HomeState> states;

  setUp(() {
    SessionService().event = EventModel(
      eventId: 'e1',
      users: const ['1', '2'],
      planSubscribe: getPlan(PlansEnum.free),
      categories: const [_pictures],
    );
    repository = _GatedEventRepository();
    bloc = _bloc(repository);
    states = [];
    bloc.stream.listen(states.add);
    bloc.add(const .init());
  });

  tearDown(() async {
    await repository.snapshots.close();
    await bloc.close();
    SessionService().reset();
  });

  test('a snapshot during an upload keeps the spinner and its progress, '
      'with the new event data', () async {
    bloc.add(.uploadFiles(_pictures, [File('a'), File('b')]));
    await repository.releaseUpload();
    await pumpEventQueue();

    final remote = SessionService().event!.copyWith(
      categories: [_pictures.copyWith(titleAppear: 'Renamed by partner')],
    );
    repository.snapshots.add(remote);
    await pumpEventQueue();

    final afterSnapshot = states.last;
    expect(afterSnapshot, isA<Loading>());
    expect((afterSnapshot as Loading).text, isNotNull);
    expect(afterSnapshot.text, contains('1'));
    expect(
      afterSnapshot.event!.categories.single.titleAppear,
      'Renamed by partner',
    );

    await repository.releaseUpload();
    await pumpEventQueue();

    expect(states.last, isA<Loaded>());
    final category = SessionService().event!.categories.single;
    expect(category.urls, ['https://media/0', 'https://media/1']);
    expect(category.titleAppear, 'Renamed by partner');
    expect(states.whereType<Loaded>(), hasLength(1));
  });

  test('a snapshot while idle shows the list', () async {
    repository.snapshots.add(SessionService().event);
    await pumpEventQueue();
    expect(states.single, isA<Loaded>());
  });

  test('a snapshot while two uploads overlap keeps the spinner until both '
      'finish', () async {
    bloc
      ..add(.uploadFiles(_pictures, [File('a')]))
      ..add(.uploadFiles(_pictures, [File('b')]));
    await repository.releaseUpload();
    await pumpEventQueue();

    repository.snapshots.add(SessionService().event);
    await pumpEventQueue();
    expect(states.last, isA<Loading>());

    await repository.releaseUpload();
    await pumpEventQueue();
    expect(states.last, isA<Loaded>());
    expect(states.whereType<Loaded>(), hasLength(1));
    expect(SessionService().event!.categories.single.urls, hasLength(2));
  });
}
