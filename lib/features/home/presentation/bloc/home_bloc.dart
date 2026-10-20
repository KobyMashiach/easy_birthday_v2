import 'dart:async';
import 'dart:io';

import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/calendar_model.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.init() = _Init;
  const factory HomeEvent.addButtonClicked() = _AddButtonClicked;
  const factory HomeEvent.addOrEditCategory(
    CategoryModel category, {
    @Default(false) bool edit,
  }) = _AddOrEditCategory;
  const factory HomeEvent.changeTitle(CategoryModel category) = _ChangeTitle;
  const factory HomeEvent.deleteCategory(CategoryModel category) =
      _DeleteCategory;
  const factory HomeEvent.saveText(CategoryModel category, String text) =
      _SaveText;
  const factory HomeEvent.saveCalendar(
    CategoryModel category,
    CalendarModel calendar,
  ) = _SaveCalendar;
  const factory HomeEvent.saveQuiz(
    CategoryModel category,
    List<QuestionModel> questions,
    bool lock,
  ) = _SaveQuiz;
  const factory HomeEvent.saveWishesContract(
    CategoryModel category,
    String text, {
    required bool edit,
  }) = _SaveWishesContract;
  const factory HomeEvent.resetWishes(CategoryModel category) = _ResetWishes;
  const factory HomeEvent.resetMemoryGame(CategoryModel category) =
      _ResetMemoryGame;
  const factory HomeEvent.uploadFiles(
    CategoryModel category,
    List<File> files,
  ) = _UploadFiles;
  const factory HomeEvent.saveMemoryGameImages(
    CategoryModel category,
    List<String> keptUrls,
    List<File> newFiles,
  ) = _SaveMemoryGameImages;
  const factory HomeEvent.deleteFiles(
    CategoryModel category,
    List<int> filesIndexes,
  ) = _DeleteFiles;
  const factory HomeEvent.uploadSurprise(
    CategoryModel category,
    List<Widget> widgets,
  ) = _UploadSurprise;
  const factory HomeEvent.saveQuizAnswer(
    CategoryModel category,
    QuestionModel question,
    int index,
    int score,
  ) = _SaveQuizAnswer;
  const factory HomeEvent.saveWishes(
    CategoryModel category,
    WishesModel wishes,
  ) = _SaveWishes;
  const factory HomeEvent.saveMemoryScore(
    CategoryModel category,
    int score,
  ) = _SaveMemoryScore;
}

/// Identity equality: every emit must reach the UI, even when it repeats the
/// previous state (e.g. opening the add dialog twice, repeated errors).
@Freezed(equal: false)
sealed class HomeState with _$HomeState {
  const factory HomeState.initial(EventModel? event) = Initial;
  const factory HomeState.loading(EventModel? event, {String? text}) = Loading;
  const factory HomeState.loaded(EventModel? event) = Loaded;

  /// The page picks the message for [errorType].
  const factory HomeState.errorMessage(
    EventModel? event,
    AppErrorType errorType,
  ) = ErrorMessage;
  const factory HomeState.openAddDialog(EventModel? event) = OpenAddDialog;
  const factory HomeState.navigateToAddText(
    EventModel? event,
    CategoryModel category,
  ) = NavigateToAddText;
  const factory HomeState.navigateToAddPictures(
    EventModel? event,
    CategoryModel category,
  ) = NavigateToAddPictures;
  const factory HomeState.navigateToAddVideos(
    EventModel? event,
    CategoryModel category,
  ) = NavigateToAddVideos;
  const factory HomeState.navigateToAddQuizGame(
    EventModel? event,
    CategoryModel category,
  ) = NavigateToAddQuizGame;
  const factory HomeState.navigateToAddBirthdayCalendar(
    EventModel? event,
    CategoryModel category,
  ) = NavigateToAddBirthdayCalendar;
  const factory HomeState.navigateToAddBirthdaySurprise(
    EventModel? event,
    CategoryModel category,
  ) = NavigateToAddBirthdaySurprise;
  const factory HomeState.navigateToAddWishesList(
    EventModel? event,
    CategoryModel category,
  ) = NavigateToAddWishesList;
  const factory HomeState.navigateToAddMemoryGame(
    EventModel? event,
    CategoryModel category,
  ) = NavigateToAddMemoryGame;
  const factory HomeState.openEditAgain(
    EventModel? event,
    CategoryModel category,
  ) = OpenEditAgain;
}

extension HomeStateX on HomeState {
  bool get isOneShot => switch (this) {
    Initial() || Loading() || Loaded() => false,
    _ => true,
  };
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AddCategoryUseCase addCategoryUseCase;
  final UpdateCategoryUseCase updateCategoryUseCase;
  final DeleteCategoryUseCase deleteCategoryUseCase;
  final GetCurrentCategoryUseCase getCurrentCategoryUseCase;
  final WatchEventUseCase watchEventUseCase;
  final AddCategoryFilesUseCase addCategoryFilesUseCase;
  final DeleteCategoryFilesUseCase deleteCategoryFilesUseCase;
  final ReplaceMemoryGameImagesUseCase replaceMemoryGameImagesUseCase;
  final UploadCategoryFilesUseCase uploadCategoryFilesUseCase;
  final DeleteMediaUseCase deleteMediaUseCase;

  HomeBloc({
    required this.addCategoryUseCase,
    required this.updateCategoryUseCase,
    required this.deleteCategoryUseCase,
    required this.getCurrentCategoryUseCase,
    required this.watchEventUseCase,
    required this.addCategoryFilesUseCase,
    required this.deleteCategoryFilesUseCase,
    required this.replaceMemoryGameImagesUseCase,
    required this.uploadCategoryFilesUseCase,
    required this.deleteMediaUseCase,
  }) : super(.initial(SessionService().event)) {
    on<_Init>(_init);
    on<_AddButtonClicked>(_addButtonClicked);
    on<_AddOrEditCategory>(_addOrEditCategory);
    on<_ChangeTitle>(_changeTitle);
    on<_DeleteCategory>(_deleteCategory);
    on<_SaveText>(_saveText);
    on<_SaveCalendar>(_saveCalendar);
    on<_SaveQuiz>(_saveQuiz);
    on<_SaveWishesContract>(_saveWishesContract);
    on<_ResetWishes>(_resetWishes);
    on<_ResetMemoryGame>(_resetMemoryGame);
    on<_UploadFiles>(_uploadFilesToCategory);
    on<_SaveMemoryGameImages>(_saveMemoryGameImages);
    on<_DeleteFiles>(_deleteFiles);
    on<_UploadSurprise>(_uploadSurprise);
    on<_SaveQuizAnswer>(_saveQuizAnswer);
    on<_SaveWishes>(_saveWishes);
    on<_SaveMemoryScore>(_saveMemoryScore);
  }

  factory HomeBloc.fromContext(BuildContext context) => HomeBloc(
    addCategoryUseCase: context.read<AddCategoryUseCase>(),
    updateCategoryUseCase: context.read<UpdateCategoryUseCase>(),
    deleteCategoryUseCase: context.read<DeleteCategoryUseCase>(),
    getCurrentCategoryUseCase: context.read<GetCurrentCategoryUseCase>(),
    watchEventUseCase: context.read<WatchEventUseCase>(),
    addCategoryFilesUseCase: context.read<AddCategoryFilesUseCase>(),
    deleteCategoryFilesUseCase: context.read<DeleteCategoryFilesUseCase>(),
    replaceMemoryGameImagesUseCase: context
        .read<ReplaceMemoryGameImagesUseCase>(),
    uploadCategoryFilesUseCase: context.read<UploadCategoryFilesUseCase>(),
    deleteMediaUseCase: context.read<DeleteMediaUseCase>(),
  );

  EventModel? get _event => SessionService().event;

  String get _eventId =>
      _event?.eventId ??
      (throw const AppException(
        AppErrorType.unknown,
        message: 'No event loaded',
      ));

  /// The live copy of [category] from the session (the list item may predate
  /// a snapshot).
  CategoryModel _latest(CategoryModel category) =>
      getCurrentCategoryUseCase(category);

  /// Writes/uploads in flight. Handlers run concurrently and the watch stream
  /// emits while they run (Firestore echoes every local write right away), so
  /// the stream must not replace the spinner with the list mid-operation.
  int _busyCount = 0;

  /// Progress text of the running upload, re-emitted by stream updates.
  String? _progressText;

  /// The non-one-shot state for the current [_event]: the spinner (with the
  /// latest progress text) while anything is in flight, the list otherwise.
  HomeState get _currentState =>
      _busyCount > 0 ? .loading(_event, text: _progressText) : .loaded(_event);

  void _emitProgress(Emitter<HomeState> emit, String? text) {
    _progressText = text;
    emit(.loading(_event, text: text));
  }

  /// Runs [operation] behind the spinner and leaves it only when no other
  /// operation is still running.
  Future<void> _whileBusy(
    Emitter<HomeState> emit,
    Future<void> Function() operation,
  ) async {
    _busyCount++;
    if (_busyCount == 1) _progressText = null;
    emit(_currentState);
    try {
      await operation();
    } finally {
      _busyCount--;
      if (_busyCount == 0) _progressText = null;
      emit(_currentState);
    }
  }

  FutureOr<void> _init(_Init event, Emitter<HomeState> emit) async {
    final String? eventId = _event?.eventId;
    if (eventId == null) return;

    // The use case only mirrors remote changes into the session: writing them
    // back would echo every remote change as a full-document write and could
    // revert the other device.
    await emit.forEach<EventModel?>(
      watchEventUseCase(eventId),
      onData: (remoteEvent) {
        if (remoteEvent != null) {
          debugPrint('New Event: ${remoteEvent.eventId}');
        } else {
          debugPrint('Document does not exist');
        }
        return _currentState;
      },
      onError: (error, stackTrace) {
        debugPrint('Error: $error');
        return _currentState;
      },
    );
  }

  FutureOr<void> _addButtonClicked(
    _AddButtonClicked event,
    Emitter<HomeState> emit,
  ) {
    emit(.openAddDialog(_event));
  }

  FutureOr<void> _addOrEditCategory(
    _AddOrEditCategory event,
    Emitter<HomeState> emit,
  ) async {
    if (event.edit) {
      emit(_navigateToEditor(_latest(event.category)));
      return;
    }
    // Behind the spinner, which hides the add button: on a slow or offline
    // network repeated taps would otherwise add the category again.
    await _whileBusy(emit, () async {
      try {
        emit(_navigateToEditor(await addCategoryUseCase(event.category)));
      } catch (e) {
        _emitError(e, emit);
      }
    });
  }

  HomeState _navigateToEditor(CategoryModel category) {
    final current = _event;
    return switch (category.categoryType) {
      CategoryEnum.text => .navigateToAddText(current, category),
      CategoryEnum.pictures => .navigateToAddPictures(current, category),
      CategoryEnum.videos => .navigateToAddVideos(current, category),
      CategoryEnum.quizGame => .navigateToAddQuizGame(current, category),
      CategoryEnum.birthdayCalendar => .navigateToAddBirthdayCalendar(
        current,
        category,
      ),
      CategoryEnum.birthdaySuprise => .navigateToAddBirthdaySurprise(
        current,
        category,
      ),
      CategoryEnum.wishesList => .navigateToAddWishesList(current, category),
      CategoryEnum.memoryGame => .navigateToAddMemoryGame(current, category),
    };
  }

  /// Saves [change] (only the fields the editor changed) onto the latest copy
  /// of [category]; once saved, deletes from storage what [orphanedMedia]
  /// returns for the copies before and after the write.
  Future<void> _save(
    CategoryModel category,
    Emitter<HomeState> emit,
    CategoryModel Function(CategoryModel latest) change, {
    Iterable<String> Function(CategoryModel before, CategoryModel after)?
    orphanedMedia,
  }) => _whileBusy(emit, () async {
    try {
      late CategoryModel before;
      final CategoryModel after = await updateCategoryUseCase(category, (
        latest,
      ) {
        before = latest;
        return change(latest);
      });
      if (orphanedMedia != null) {
        _deleteInBackground(orphanedMedia(before, after));
      }
    } catch (e) {
      _emitError(e, emit);
    }
  });

  void _deleteInBackground(Iterable<String> urls) {
    for (final url in urls) {
      unawaited(deleteMediaUseCase(url));
    }
  }

  FutureOr<void> _changeTitle(_ChangeTitle event, Emitter<HomeState> emit) =>
      _save(
        event.category,
        emit,
        (latest) => latest.copyWith(titleAppear: event.category.titleAppear),
      );

  FutureOr<void> _saveText(_SaveText event, Emitter<HomeState> emit) => _save(
    event.category,
    emit,
    (latest) => latest.copyWith(lock: event.category.lock, text: event.text),
  );

  FutureOr<void> _saveCalendar(
    _SaveCalendar event,
    Emitter<HomeState> emit,
  ) => _save(
    event.category,
    emit,
    (latest) => latest.copyWith(
      lock: event.category.lock,
      calendarEvents: event.calendar,
    ),
  );

  FutureOr<void> _saveQuiz(_SaveQuiz event, Emitter<HomeState> emit) => _save(
    event.category,
    emit,
    (latest) => latest.copyWith(quizGame: event.questions, lock: event.lock),
    orphanedMedia: (before, after) => _questionImages(
      before.quizGame,
    ).difference(_questionImages(after.quizGame)),
  );

  static Set<String> _questionImages(List<QuestionModel>? questions) => {
    for (final question in questions ?? const <QuestionModel>[])
      ?question.imageUrl,
  };

  FutureOr<void> _saveWishesContract(
    _SaveWishesContract event,
    Emitter<HomeState> emit,
  ) => _save(
    event.category,
    emit,
    (latest) => latest.copyWith(
      lock: event.category.lock,
      wishesList: event.edit
          ? (latest.wishesList ?? const WishesModel(lock: false)).copyWith(
              contract: event.text,
            )
          : WishesModel(lock: false, contract: event.text),
    ),
  );

  FutureOr<void> _resetWishes(_ResetWishes event, Emitter<HomeState> emit) =>
      _save(
        event.category,
        emit,
        (latest) => latest.copyWith(
          wishesList: (latest.wishesList ?? const WishesModel(lock: false))
              .copyWith(first: null, second: null, third: null, lock: false),
        ),
      );

  FutureOr<void> _resetMemoryGame(
    _ResetMemoryGame event,
    Emitter<HomeState> emit,
  ) => _save(
    event.category,
    emit,
    (latest) => latest.copyWith(
      memoryGame: latest.memoryGame?.copyWith(lock: false, score: 0),
    ),
  );

  FutureOr<void> _saveQuizAnswer(
    _SaveQuizAnswer event,
    Emitter<HomeState> emit,
  ) {
    final int questionCount = _latest(event.category).quizGame?.length ?? 0;
    if (event.index < 0 || event.index >= questionCount) return null;
    return _save(event.category, emit, (latest) {
      final List<QuestionModel> questions = [...?latest.quizGame];
      if (event.index >= questions.length) return latest;
      questions[event.index] = event.question;
      return latest.copyWith(quizGame: questions, quizGameScore: event.score);
    });
  }

  FutureOr<void> _saveWishes(_SaveWishes event, Emitter<HomeState> emit) =>
      _save(
        event.category,
        emit,
        (latest) => latest.copyWith(wishesList: event.wishes),
      );

  FutureOr<void> _saveMemoryScore(
    _SaveMemoryScore event,
    Emitter<HomeState> emit,
  ) {
    if (_latest(event.category).memoryGame == null) return null;
    return _save(
      event.category,
      emit,
      (latest) => latest.copyWith(
        memoryGame: latest.memoryGame?.copyWith(score: event.score, lock: true),
      ),
    );
  }

  FutureOr<void> _deleteCategory(
    _DeleteCategory event,
    Emitter<HomeState> emit,
  ) => _whileBusy(emit, () async {
    try {
      await deleteCategoryUseCase(event.category);
    } catch (e) {
      _emitError(e, emit);
    }
  });

  void _emitError(Object e, Emitter<HomeState> emit) {
    debugPrint('Home operation failed: $e');
    emit(
      .errorMessage(_event, e is AppException ? e.type : AppErrorType.unknown),
    );
  }

  /// Shows "uploading [uploaded] of [total]" on the spinner.
  UploadProgress _uploadProgress(Emitter<HomeState> emit) =>
      (uploaded, total) => _emitProgress(
        emit,
        t.upload_files_count(file: uploaded.toString(), files: total),
      );

  FutureOr<void> _uploadFilesToCategory(
    _UploadFiles event,
    Emitter<HomeState> emit,
  ) => _whileBusy(emit, () async {
    try {
      await addCategoryFilesUseCase(
        eventId: _eventId,
        category: event.category,
        files: event.files,
        lock: event.category.lock,
        onProgress: _uploadProgress(emit),
      );
    } catch (e) {
      _emitError(e, emit);
    }
  });

  FutureOr<void> _saveMemoryGameImages(
    _SaveMemoryGameImages event,
    Emitter<HomeState> emit,
  ) => _whileBusy(emit, () async {
    try {
      await replaceMemoryGameImagesUseCase(
        eventId: _eventId,
        category: event.category,
        keptUrls: event.keptUrls,
        newFiles: event.newFiles,
        lock: event.category.lock,
        onProgress: _uploadProgress(emit),
      );
    } catch (e) {
      _emitError(e, emit);
    }
  });

  FutureOr<void> _deleteFiles(
    _DeleteFiles event,
    Emitter<HomeState> emit,
  ) async {
    // Taken before the write: a failed write may already show in the session.
    final CategoryModel before = _latest(event.category);
    CategoryModel reopened;
    try {
      reopened = await deleteCategoryFilesUseCase(
        shown: event.category,
        indexes: event.filesIndexes,
      );
    } catch (e) {
      // The files are still saved: reopen the editor showing them.
      reopened = before;
      _emitError(e, emit);
    }
    emit(_currentState);
    emit(.openEditAgain(_event, reopened));
  }

  /// The editor sends the surprise as [Text] (title/description, told apart
  /// by style) and [Image] widgets: picked images are [FileImage]s to upload,
  /// saved ones [NetworkImage]s. An image that fails to upload is left out.
  /// Saved images the editor removed are deleted from storage after the save,
  /// new uploads when the save fails.
  FutureOr<void> _uploadSurprise(
    _UploadSurprise event,
    Emitter<HomeState> emit,
  ) => _whileBusy(emit, () async {
    final List<Widget> widgets = event.widgets;
    try {
      final upload = await uploadCategoryFilesUseCase(
        eventId: _eventId,
        category: event.category,
        files: [
          for (final widget in widgets)
            if (widget case Image(image: FileImage(:final file))) file,
        ],
        onProgress: _uploadProgress(emit),
      );
      final Iterator<String?> uploadedUrls = upload.results.iterator;
      final TextStyle titleStyle = AppTextStyle().subTitle;
      final Map<int, Map<String, String>> items = {};
      for (int i = 0; i < widgets.length; i++) {
        switch (widgets[i]) {
          case Text(:final data, :final style):
            items[i] = {
              style == titleStyle ? "title" : "description": data ?? "",
            };
          case Image(image: FileImage()):
            uploadedUrls.moveNext();
            if (uploadedUrls.current case final String url) {
              items[i] = {"image": url};
            }
          // Saved images come from surpriseMapToWidgets, which decodes them
          // at a cache size: their NetworkImage is wrapped in a ResizeImage.
          case Image(image: NetworkImage(:final url)) ||
              Image(
                image: ResizeImage(imageProvider: NetworkImage(:final url)),
              ):
            items[i] = {"image": url};
        }
      }
      late CategoryModel before;
      final CategoryModel after;
      try {
        after = await updateCategoryUseCase(event.category, (latest) {
          before = latest;
          return latest.copyWith(lock: event.category.lock, surpriseMap: items);
        });
      } catch (_) {
        _deleteInBackground(upload.urls);
        rethrow;
      }
      _deleteInBackground(
        _surpriseImages(
          before.surpriseMap,
        ).difference(_surpriseImages(after.surpriseMap)),
      );
      if (upload.error case final Object error) _emitError(error, emit);
    } catch (e) {
      _emitError(e, emit);
    }
  });

  static Set<String> _surpriseImages(Map<int, Map<String, String>>? items) => {
    for (final item in items?.values ?? const <Map<String, String>>[])
      ?item["image"],
  };
}
