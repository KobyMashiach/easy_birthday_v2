import 'dart:io';
import 'dart:math';

import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/memory_game_model.dart';
import 'package:easy_birthday/features/event/data/models/option_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/add_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/add_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_media_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_current_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/reorder_categories_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/replace_memory_game_images_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/watch_event_usecase.dart';
import 'package:easy_birthday/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

QuestionModel _question(String text) => QuestionModel(
  text: text,
  options: [OptionModel(text: 'a', isCorrect: true)],
);

/// The category as stored remotely (the session's live copy).
CategoryModel _live(CategoryEnum type) => CategoryModel(
  id: 'c1',
  categoryType: type,
  name: 'name',
  description: 'desc',
  titleAppear: 'Live title',
  text: 'live text',
  urls: const ['u0', 'u1', 'u2', 'u3'],
  quizGame: [_question('q0'), _question('q1')],
  quizGameScore: 1,
  wishesList: const WishesModel(
    lock: true,
    first: 'w1',
    second: 'w2',
    third: 'w3',
    contract: 'old contract',
  ),
  memoryGame: const MemoryGameModel(
    imagesUrls: ['m0', 'm1'],
    score: 4,
    lock: true,
  ),
);

/// What an editor page still holds: opened before the live copy changed.
CategoryModel _stale(CategoryModel live) => live.copyWith(
  titleAppear: 'Stale title',
  text: 'stale text',
  quizGameScore: 0,
  wishesList: const WishesModel(lock: false),
  memoryGame: const MemoryGameModel(imagesUrls: ['stale']),
);

void main() {
  late FakeEventRepository repository;
  late HomeBloc bloc;

  void useLive(CategoryModel live) {
    SessionService().event = EventModel(
      eventId: 'e1',
      users: const ['1', '2'],
      planSubscribe: getPlan(PlansEnum.free),
      categories: [live],
    );
  }

  CategoryModel liveCategory() => SessionService().event!.categories.single;

  Future<List<HomeState>> run(HomeEvent event) =>
      emittedStates(bloc, () => bloc.add(event));

  HomeBloc buildBloc(FakeEventRepository repository) => HomeBloc(
    addCategoryUseCase: AddCategoryUseCase(repository),
    updateCategoryUseCase: UpdateCategoryUseCase(repository),
    deleteCategoryUseCase: DeleteCategoryUseCase(repository),
    getCurrentCategoryUseCase: GetCurrentCategoryUseCase(repository),
    watchEventUseCase: WatchEventUseCase(repository),
    addCategoryFilesUseCase: AddCategoryFilesUseCase(repository),
    deleteCategoryFilesUseCase: DeleteCategoryFilesUseCase(repository),
    replaceMemoryGameImagesUseCase: ReplaceMemoryGameImagesUseCase(
      repository,
    ),
    uploadCategoryFilesUseCase: UploadCategoryFilesUseCase(repository),
    deleteMediaUseCase: DeleteMediaUseCase(repository),
    reorderCategoriesUseCase: ReorderCategoriesUseCase(repository),
  );

  setUp(() {
    SessionService().reset();
    useLive(_live(CategoryEnum.text));
    repository = FakeEventRepository();
    bloc = buildBloc(repository);
  });
  tearDown(() => bloc.close());

  group('edits apply only their own fields onto the live copy', () {
    test('changeTitle', () async {
      final live = liveCategory();
      await run(
        .changeTitle(_stale(live).copyWith(titleAppear: 'New title')),
      );
      expect(
        liveCategory(),
        live.copyWith(titleAppear: 'New title'),
      );
    });

    test('saveText keeps a title renamed after the page opened', () async {
      final live = liveCategory();
      final states = await run(
        .saveText(_stale(live).copyWith(lock: true), 'new text'),
      );
      expect(liveCategory(), live.copyWith(text: 'new text', lock: true));
      expect(states.first, isA<Loading>());
      expect(states.last, isA<Loaded>());
    });

    test('saveQuiz replaces questions and lock, keeps the score', () async {
      final live = liveCategory();
      await run(.saveQuiz(_stale(live), [_question('only')], true));
      expect(
        liveCategory(),
        live.copyWith(quizGame: [_question('only')], lock: true),
      );
    });

    test('saveWishesContract(edit) keeps the partner wishes', () async {
      final live = liveCategory();
      await run(.saveWishesContract(_stale(live), 'new contract', edit: true));
      expect(
        liveCategory(),
        live.copyWith(
          wishesList: live.wishesList!.copyWith(contract: 'new contract'),
        ),
      );
    });

    test('saveWishesContract(new) starts an empty, unlocked list', () async {
      final live = liveCategory();
      await run(.saveWishesContract(_stale(live), 'fresh', edit: false));
      expect(
        liveCategory(),
        live.copyWith(
          wishesList: const WishesModel(lock: false, contract: 'fresh'),
        ),
      );
    });

    test('resetWishes clears the wishes and keeps the contract', () async {
      final live = liveCategory();
      await run(.resetWishes(_stale(live)));
      expect(
        liveCategory().wishesList,
        const WishesModel(lock: false, contract: 'old contract'),
      );
      expect(liveCategory().text, live.text);
    });

    test('resetMemoryGame unlocks and zeroes the score only', () async {
      final live = liveCategory();
      await run(.resetMemoryGame(_stale(live)));
      expect(
        liveCategory(),
        live.copyWith(
          memoryGame: const MemoryGameModel(
            imagesUrls: ['m0', 'm1'],
            score: 0,
            lock: false,
          ),
        ),
      );
    });

    test('saveWishes (partner) replaces only the wishes', () async {
      final live = liveCategory();
      const wishes = WishesModel(lock: true, first: 'a', contract: 'c');
      await run(.saveWishes(_stale(live), wishes));
      expect(liveCategory(), live.copyWith(wishesList: wishes));
    });

    test('saveMemoryScore locks the game with the score', () async {
      final live = liveCategory();
      await run(.saveMemoryScore(_stale(live), 2));
      expect(
        liveCategory().memoryGame,
        live.memoryGame!.copyWith(score: 2, lock: true),
      );
      expect(liveCategory().titleAppear, 'Live title');
    });

    test('saveQuizAnswer replaces one question and the score', () async {
      final live = liveCategory();
      final answered = _question('q1').copyWith(isLocked: true);
      await run(.saveQuizAnswer(_stale(live), answered, 1, 7));
      expect(
        liveCategory(),
        live.copyWith(
          quizGame: [_question('q0'), answered],
          quizGameScore: 7,
        ),
      );
    });

    test('saveQuizAnswer ignores an index out of range', () async {
      final states = await run(
        .saveQuizAnswer(liveCategory(), _question('x'), 5, 1),
      );
      expect(states, isEmpty);
      expect(repository.updatedCategories, isEmpty);
    });
  });

  group('uploadFiles', () {
    test('a partial failure saves the uploaded files and reports '
        'the error once', () async {
      repository.failUploadsContaining = 'bad';
      final live = liveCategory();
      final states = await run(
        .uploadFiles(_stale(live).copyWith(lock: true), [
          File('/a.jpg'),
          File('/bad.jpg'),
          File('/c.jpg'),
        ]),
      );
      expect(
        liveCategory(),
        live.copyWith(
          lock: true,
          urls: [
            ...live.urls!,
            'https://cdn/e1/c1/a.jpg',
            'https://cdn/e1/c1/c.jpg',
          ],
        ),
      );
      expect(states.whereType<ErrorMessage>(), hasLength(1));
      expect(states.last, isA<Loaded>());
    });

    test('nothing uploaded and lock unchanged: no write', () async {
      repository.failUploadsContaining = 'bad';
      final states = await run(
        .uploadFiles(liveCategory(), [File('/bad.jpg')]),
      );
      expect(repository.updatedCategories, isEmpty);
      expect(states.last, isA<Loaded>());
    });
  });

  group('deleteFiles', () {
    test('removes the displayed indexes (any order, duplicates, out of '
        'range) and deletes media only after the write', () async {
      final live = liveCategory();
      final states = await run(.deleteFiles(live, [2, 0, 2, 9]));
      expect(liveCategory().urls, ['u1', 'u3']);
      expect(repository.log.first, 'update:c1');
      expect(
        repository.log.skip(1).toSet(),
        {'deleteMedia:u2', 'deleteMedia:u0'},
      );
      expect(states.last, isA<OpenEditAgain>());
      expect((states.last as OpenEditAgain).category.urls, ['u1', 'u3']);
    });

    test('a failed write keeps the media', () async {
      repository.updateError = Exception('offline');
      final states = await run(.deleteFiles(liveCategory(), [0]));
      expect(repository.log.where((e) => e.startsWith('deleteMedia')), isEmpty);
      expect(states.whereType<ErrorMessage>(), hasLength(1));
      expect(states.last, isA<OpenEditAgain>());
      expect((states.last as OpenEditAgain).category.urls, liveCategory().urls);
    });
  });

  test('editing opens the live copy, not the list item', () async {
    final live = liveCategory();
    final states = await run(.addOrEditCategory(_stale(live), edit: true));
    expect(states.single, isA<NavigateToAddText>());
    expect((states.single as NavigateToAddText).category, live);
  });

  group('saveMemoryGameImages', () {
    test(
      'a full new set replaces the old one, then deletes the old images',
      () async {
        final live = liveCategory();
        await run(
          .saveMemoryGameImages(live, const [], [
            File('/x.jpg'),
            File('/y.jpg'),
          ]),
        );
        expect(liveCategory().memoryGame!.imagesUrls, [
          'https://cdn/e1/c1/x.jpg',
          'https://cdn/e1/c1/y.jpg',
        ]);
        final updateAt = repository.log.indexOf('update:c1');
        expect(updateAt, greaterThan(-1));
        expect(
          repository.log.sublist(updateAt + 1).toSet(),
          {'deleteMedia:m0', 'deleteMedia:m1'},
        );
      },
    );

    test('kept images are not uploaded again; only the replaced one is '
        'deleted', () async {
      final live = liveCategory();
      await run(.saveMemoryGameImages(live, const ['m0'], [File('/x.jpg')]));
      expect(liveCategory().memoryGame!.imagesUrls, [
        'm0',
        'https://cdn/e1/c1/x.jpg',
      ]);
      expect(
        repository.log.where((e) => e.startsWith('upload')),
        ['upload:/x.jpg'],
      );
      expect(
        repository.log.where((e) => e.startsWith('deleteMedia')),
        ['deleteMedia:m1'],
      );
    });

    test(
      'the saved set unchanged with a lock change saves only the lock',
      () async {
        final live = liveCategory();
        await run(
          .saveMemoryGameImages(
            live.copyWith(lock: true),
            live.memoryGame!.imagesUrls,
            const [],
          ),
        );
        expect(liveCategory(), live.copyWith(lock: true));
        expect(
          repository.log.where(
            (e) => e.startsWith('upload') || e.startsWith('deleteMedia'),
          ),
          isEmpty,
        );
      },
    );

    test('a partial upload keeps the old set and removes only the orphaned '
        'new upload', () async {
      repository.failUploadsContaining = 'bad';
      final live = liveCategory();
      final states = await run(
        .saveMemoryGameImages(
          live,
          const ['m0'],
          [
            File('/x.jpg'),
            File('/bad.jpg'),
          ],
        ),
      );
      expect(liveCategory().memoryGame, live.memoryGame);
      expect(repository.updatedCategories, isEmpty);
      expect(
        repository.log.where((e) => e.startsWith('deleteMedia')),
        ['deleteMedia:https://cdn/e1/c1/x.jpg'],
      );
      expect(states.whereType<ErrorMessage>(), hasLength(1));
      expect(states.last, isA<Loaded>());
    });

    test('a partial upload with a lock change saves only the lock', () async {
      repository.failUploadsContaining = 'bad';
      final live = liveCategory();
      await run(
        .saveMemoryGameImages(live.copyWith(lock: true), const [], [
          File('/x.jpg'),
          File('/bad.jpg'),
        ]),
      );
      expect(liveCategory(), live.copyWith(lock: true));
      final updateAt = repository.log.indexOf('update:c1');
      expect(updateAt, greaterThan(-1));
      expect(
        repository.log.sublist(updateAt + 1),
        ['deleteMedia:https://cdn/e1/c1/x.jpg'],
      );
    });
  });

  test('a write to a category deleted meanwhile reports notFound', () async {
    final live = liveCategory();
    SessionService().event = SessionService().event!.copyWith(
      categories: const [],
    );
    final states = await run(.saveText(live, 'x'));
    expect(
      states.whereType<ErrorMessage>().single.errorType,
      AppErrorType.notFound,
    );
    expect(states.last, isA<Loaded>());
  });

  test('a failed save reports the error and leaves the spinner', () async {
    repository.updateError = Exception('offline');
    final states = await run(.saveText(liveCategory(), 'x'));
    expect(states.map((s) => s.runtimeType), [Loading, ErrorMessage, Loaded]);
    expect(liveCategory().text, 'live text');
  });

  test('adding a category waits behind the spinner, then opens its '
      'editor', () async {
    final states = await run(
      const .addOrEditCategory(
        CategoryModel(
          categoryType: CategoryEnum.text,
          name: 'text',
          description: '',
        ),
      ),
    );
    expect(states.map((s) => s.runtimeType), [
      Loading,
      NavigateToAddText,
      Loaded,
    ]);
    expect((states[1] as NavigateToAddText).category.id, 'new-text');
  });

  group('media uploads', () {
    late _SlowUploadsRepository slow;
    late HomeBloc slowBloc;

    setUp(() {
      slow = _SlowUploadsRepository();
      slowBloc = buildBloc(slow);
    });
    tearDown(() => slowBloc.close());

    test('images upload in parallel and keep the picked order', () async {
      useLive(_live(CategoryEnum.pictures).copyWith(urls: const []));
      await emittedStates(
        slowBloc,
        () => slowBloc.add(
          .uploadFiles(liveCategory(), [
            File('/slow-a.jpg'),
            File('/b.jpg'),
            File('/c.jpg'),
            File('/d.jpg'),
          ]),
        ),
      );
      expect(slow.maxInFlight, 3);
      expect(liveCategory().urls, [
        'https://cdn/e1/c1/slow-a.jpg',
        'https://cdn/e1/c1/b.jpg',
        'https://cdn/e1/c1/c.jpg',
        'https://cdn/e1/c1/d.jpg',
      ]);
    });

    test('videos upload one at a time', () async {
      useLive(_live(CategoryEnum.videos).copyWith(urls: const []));
      await emittedStates(
        slowBloc,
        () => slowBloc.add(
          .uploadFiles(liveCategory(), [File('/a.mp4'), File('/b.mp4')]),
        ),
      );
      expect(slow.maxInFlight, 1);
      expect(liveCategory().urls, hasLength(2));
    });
  });

  test('uploadFiles: a failed write deletes the new uploads', () async {
    repository.updateError = Exception('denied');
    final states = await run(.uploadFiles(liveCategory(), [File('/a.jpg')]));
    expect(
      repository.log.where((e) => e.startsWith('deleteMedia')),
      ['deleteMedia:https://cdn/e1/c1/a.jpg'],
    );
    expect(states.whereType<ErrorMessage>(), hasLength(1));
    expect(states.last, isA<Loaded>());
  });

  test('saveMemoryGameImages: a failed write deletes the new uploads '
      'and keeps the old set', () async {
    repository.updateError = Exception('denied');
    await run(
      .saveMemoryGameImages(liveCategory(), const [], [File('/x.jpg')]),
    );
    expect(
      repository.log.where((e) => e.startsWith('deleteMedia')),
      ['deleteMedia:https://cdn/e1/c1/x.jpg'],
    );
  });

  test('uploadSurprise keeps the order, uploads picked images and leaves '
      'out the one that failed', () async {
    repository.failUploadsContaining = 'bad';
    final states = await run(
      .uploadSurprise(liveCategory().copyWith(lock: true), [
        Text('Title', style: AppTextStyle().subTitle),
        Image.file(File('/a.jpg')),
        Text('Body', style: AppTextStyle().description),
        Image.file(File('/bad.jpg')),
        Image.network('https://saved'),
      ]),
    );
    expect(liveCategory().surpriseMap, {
      0: {'title': 'Title'},
      1: {'image': 'https://cdn/e1/c1/a.jpg'},
      2: {'description': 'Body'},
      4: {'image': 'https://saved'},
    });
    expect(liveCategory().lock, isTrue);
    expect(states.whereType<ErrorMessage>(), hasLength(1));
    expect(states.last, isA<Loaded>());
  });

  group('removed media is deleted only after a successful save', () {
    List<String> deleted() => [
      for (final entry in repository.log)
        if (entry.startsWith('deleteMedia:')) entry.substring(12),
    ];

    test('uploadSurprise keeps saved images (as the editor shows them) and '
        'deletes the removed one', () async {
      useLive(
        _live(CategoryEnum.birthdaySuprise).copyWith(
          surpriseMap: {
            0: {'image': 'https://kept'},
            1: {'title': 'Title'},
            2: {'image': 'https://removed'},
          },
        ),
      );
      final List<Widget> shown = surpriseMapToWidgets(
        liveCategory().surpriseMap,
      )..removeAt(2);
      await run(
        .uploadSurprise(liveCategory(), [...shown, Image.file(File('/n.jpg'))]),
      );
      expect(liveCategory().surpriseMap, {
        0: {'image': 'https://kept'},
        1: {'title': 'Title'},
        2: {'image': 'https://cdn/e1/c1/n.jpg'},
      });
      expect(deleted(), ['https://removed']);
    });

    test(
      'uploadSurprise: a failed write deletes the new uploads only',
      () async {
        useLive(
          _live(CategoryEnum.birthdaySuprise).copyWith(
            surpriseMap: {
              0: {'image': 'https://saved'},
            },
          ),
        );
        repository.updateError = Exception('denied');
        final states = await run(
          .uploadSurprise(liveCategory(), [Image.file(File('/n.jpg'))]),
        );
        expect(deleted(), ['https://cdn/e1/c1/n.jpg']);
        expect(liveCategory().surpriseMap, {
          0: {'image': 'https://saved'},
        });
        expect(states.whereType<ErrorMessage>(), hasLength(1));
      },
    );

    test('saveQuiz deletes the images of removed questions', () async {
      useLive(
        _live(CategoryEnum.quizGame).copyWith(
          quizGame: [
            _question('kept').copyWith(imageUrl: 'https://kept'),
            _question('removed').copyWith(imageUrl: 'https://removed'),
          ],
        ),
      );
      await run(
        .saveQuiz(liveCategory(), [liveCategory().quizGame!.first], false),
      );
      expect(deleted(), ['https://removed']);
    });

    test('saveQuiz: a failed write deletes nothing', () async {
      useLive(
        _live(CategoryEnum.quizGame).copyWith(
          quizGame: [_question('q').copyWith(imageUrl: 'https://saved')],
        ),
      );
      repository.updateError = Exception('denied');
      await run(.saveQuiz(liveCategory(), const [], false));
      expect(deleted(), isEmpty);
    });
  });
}

/// Uploads take a few event-loop turns ("slow" files many more), so they
/// overlap; [maxInFlight] records how many ran at once.
class _SlowUploadsRepository extends FakeEventRepository {
  int _inFlight = 0;
  int maxInFlight = 0;

  @override
  Future<String> uploadMedia({
    required String folder,
    required File file,
    String? fileName,
  }) async {
    _inFlight++;
    maxInFlight = max(maxInFlight, _inFlight);
    final int turns = file.path.contains('slow') ? 8 : 2;
    for (int i = 0; i < turns; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    _inFlight--;
    return super.uploadMedia(folder: folder, file: file);
  }
}
