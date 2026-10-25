// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _AddButtonClicked value)?  addButtonClicked,TResult Function( _AddOrEditCategory value)?  addOrEditCategory,TResult Function( _ChangeTitle value)?  changeTitle,TResult Function( _DeleteCategory value)?  deleteCategory,TResult Function( _ReorderCategories value)?  reorderCategories,TResult Function( _SaveText value)?  saveText,TResult Function( _SaveCalendar value)?  saveCalendar,TResult Function( _SaveQuiz value)?  saveQuiz,TResult Function( _SaveWishesContract value)?  saveWishesContract,TResult Function( _ResetWishes value)?  resetWishes,TResult Function( _ResetMemoryGame value)?  resetMemoryGame,TResult Function( _ResetQuiz value)?  resetQuiz,TResult Function( _UploadFiles value)?  uploadFiles,TResult Function( _SaveMemoryGameImages value)?  saveMemoryGameImages,TResult Function( _DeleteFiles value)?  deleteFiles,TResult Function( _UploadSurprise value)?  uploadSurprise,TResult Function( _SaveQuizAnswer value)?  saveQuizAnswer,TResult Function( _SaveWishes value)?  saveWishes,TResult Function( _SaveMemoryScore value)?  saveMemoryScore,TResult Function( _SaveTimeCapsule value)?  saveTimeCapsule,TResult Function( _SaveTimeCapsuleLetter value)?  saveTimeCapsuleLetter,TResult Function( _SaveParentStats value)?  saveParentStats,TResult Function( _SaveMilestones value)?  saveMilestones,TResult Function( _SaveLookAlike value)?  saveLookAlike,TResult Function( _SaveLookAlikeAnswers value)?  saveLookAlikeAnswers,TResult Function( _ResetLookAlike value)?  resetLookAlike,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _AddButtonClicked() when addButtonClicked != null:
return addButtonClicked(_that);case _AddOrEditCategory() when addOrEditCategory != null:
return addOrEditCategory(_that);case _ChangeTitle() when changeTitle != null:
return changeTitle(_that);case _DeleteCategory() when deleteCategory != null:
return deleteCategory(_that);case _ReorderCategories() when reorderCategories != null:
return reorderCategories(_that);case _SaveText() when saveText != null:
return saveText(_that);case _SaveCalendar() when saveCalendar != null:
return saveCalendar(_that);case _SaveQuiz() when saveQuiz != null:
return saveQuiz(_that);case _SaveWishesContract() when saveWishesContract != null:
return saveWishesContract(_that);case _ResetWishes() when resetWishes != null:
return resetWishes(_that);case _ResetMemoryGame() when resetMemoryGame != null:
return resetMemoryGame(_that);case _ResetQuiz() when resetQuiz != null:
return resetQuiz(_that);case _UploadFiles() when uploadFiles != null:
return uploadFiles(_that);case _SaveMemoryGameImages() when saveMemoryGameImages != null:
return saveMemoryGameImages(_that);case _DeleteFiles() when deleteFiles != null:
return deleteFiles(_that);case _UploadSurprise() when uploadSurprise != null:
return uploadSurprise(_that);case _SaveQuizAnswer() when saveQuizAnswer != null:
return saveQuizAnswer(_that);case _SaveWishes() when saveWishes != null:
return saveWishes(_that);case _SaveMemoryScore() when saveMemoryScore != null:
return saveMemoryScore(_that);case _SaveTimeCapsule() when saveTimeCapsule != null:
return saveTimeCapsule(_that);case _SaveTimeCapsuleLetter() when saveTimeCapsuleLetter != null:
return saveTimeCapsuleLetter(_that);case _SaveParentStats() when saveParentStats != null:
return saveParentStats(_that);case _SaveMilestones() when saveMilestones != null:
return saveMilestones(_that);case _SaveLookAlike() when saveLookAlike != null:
return saveLookAlike(_that);case _SaveLookAlikeAnswers() when saveLookAlikeAnswers != null:
return saveLookAlikeAnswers(_that);case _ResetLookAlike() when resetLookAlike != null:
return resetLookAlike(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _AddButtonClicked value)  addButtonClicked,required TResult Function( _AddOrEditCategory value)  addOrEditCategory,required TResult Function( _ChangeTitle value)  changeTitle,required TResult Function( _DeleteCategory value)  deleteCategory,required TResult Function( _ReorderCategories value)  reorderCategories,required TResult Function( _SaveText value)  saveText,required TResult Function( _SaveCalendar value)  saveCalendar,required TResult Function( _SaveQuiz value)  saveQuiz,required TResult Function( _SaveWishesContract value)  saveWishesContract,required TResult Function( _ResetWishes value)  resetWishes,required TResult Function( _ResetMemoryGame value)  resetMemoryGame,required TResult Function( _ResetQuiz value)  resetQuiz,required TResult Function( _UploadFiles value)  uploadFiles,required TResult Function( _SaveMemoryGameImages value)  saveMemoryGameImages,required TResult Function( _DeleteFiles value)  deleteFiles,required TResult Function( _UploadSurprise value)  uploadSurprise,required TResult Function( _SaveQuizAnswer value)  saveQuizAnswer,required TResult Function( _SaveWishes value)  saveWishes,required TResult Function( _SaveMemoryScore value)  saveMemoryScore,required TResult Function( _SaveTimeCapsule value)  saveTimeCapsule,required TResult Function( _SaveTimeCapsuleLetter value)  saveTimeCapsuleLetter,required TResult Function( _SaveParentStats value)  saveParentStats,required TResult Function( _SaveMilestones value)  saveMilestones,required TResult Function( _SaveLookAlike value)  saveLookAlike,required TResult Function( _SaveLookAlikeAnswers value)  saveLookAlikeAnswers,required TResult Function( _ResetLookAlike value)  resetLookAlike,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _AddButtonClicked():
return addButtonClicked(_that);case _AddOrEditCategory():
return addOrEditCategory(_that);case _ChangeTitle():
return changeTitle(_that);case _DeleteCategory():
return deleteCategory(_that);case _ReorderCategories():
return reorderCategories(_that);case _SaveText():
return saveText(_that);case _SaveCalendar():
return saveCalendar(_that);case _SaveQuiz():
return saveQuiz(_that);case _SaveWishesContract():
return saveWishesContract(_that);case _ResetWishes():
return resetWishes(_that);case _ResetMemoryGame():
return resetMemoryGame(_that);case _ResetQuiz():
return resetQuiz(_that);case _UploadFiles():
return uploadFiles(_that);case _SaveMemoryGameImages():
return saveMemoryGameImages(_that);case _DeleteFiles():
return deleteFiles(_that);case _UploadSurprise():
return uploadSurprise(_that);case _SaveQuizAnswer():
return saveQuizAnswer(_that);case _SaveWishes():
return saveWishes(_that);case _SaveMemoryScore():
return saveMemoryScore(_that);case _SaveTimeCapsule():
return saveTimeCapsule(_that);case _SaveTimeCapsuleLetter():
return saveTimeCapsuleLetter(_that);case _SaveParentStats():
return saveParentStats(_that);case _SaveMilestones():
return saveMilestones(_that);case _SaveLookAlike():
return saveLookAlike(_that);case _SaveLookAlikeAnswers():
return saveLookAlikeAnswers(_that);case _ResetLookAlike():
return resetLookAlike(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _AddButtonClicked value)?  addButtonClicked,TResult? Function( _AddOrEditCategory value)?  addOrEditCategory,TResult? Function( _ChangeTitle value)?  changeTitle,TResult? Function( _DeleteCategory value)?  deleteCategory,TResult? Function( _ReorderCategories value)?  reorderCategories,TResult? Function( _SaveText value)?  saveText,TResult? Function( _SaveCalendar value)?  saveCalendar,TResult? Function( _SaveQuiz value)?  saveQuiz,TResult? Function( _SaveWishesContract value)?  saveWishesContract,TResult? Function( _ResetWishes value)?  resetWishes,TResult? Function( _ResetMemoryGame value)?  resetMemoryGame,TResult? Function( _ResetQuiz value)?  resetQuiz,TResult? Function( _UploadFiles value)?  uploadFiles,TResult? Function( _SaveMemoryGameImages value)?  saveMemoryGameImages,TResult? Function( _DeleteFiles value)?  deleteFiles,TResult? Function( _UploadSurprise value)?  uploadSurprise,TResult? Function( _SaveQuizAnswer value)?  saveQuizAnswer,TResult? Function( _SaveWishes value)?  saveWishes,TResult? Function( _SaveMemoryScore value)?  saveMemoryScore,TResult? Function( _SaveTimeCapsule value)?  saveTimeCapsule,TResult? Function( _SaveTimeCapsuleLetter value)?  saveTimeCapsuleLetter,TResult? Function( _SaveParentStats value)?  saveParentStats,TResult? Function( _SaveMilestones value)?  saveMilestones,TResult? Function( _SaveLookAlike value)?  saveLookAlike,TResult? Function( _SaveLookAlikeAnswers value)?  saveLookAlikeAnswers,TResult? Function( _ResetLookAlike value)?  resetLookAlike,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _AddButtonClicked() when addButtonClicked != null:
return addButtonClicked(_that);case _AddOrEditCategory() when addOrEditCategory != null:
return addOrEditCategory(_that);case _ChangeTitle() when changeTitle != null:
return changeTitle(_that);case _DeleteCategory() when deleteCategory != null:
return deleteCategory(_that);case _ReorderCategories() when reorderCategories != null:
return reorderCategories(_that);case _SaveText() when saveText != null:
return saveText(_that);case _SaveCalendar() when saveCalendar != null:
return saveCalendar(_that);case _SaveQuiz() when saveQuiz != null:
return saveQuiz(_that);case _SaveWishesContract() when saveWishesContract != null:
return saveWishesContract(_that);case _ResetWishes() when resetWishes != null:
return resetWishes(_that);case _ResetMemoryGame() when resetMemoryGame != null:
return resetMemoryGame(_that);case _ResetQuiz() when resetQuiz != null:
return resetQuiz(_that);case _UploadFiles() when uploadFiles != null:
return uploadFiles(_that);case _SaveMemoryGameImages() when saveMemoryGameImages != null:
return saveMemoryGameImages(_that);case _DeleteFiles() when deleteFiles != null:
return deleteFiles(_that);case _UploadSurprise() when uploadSurprise != null:
return uploadSurprise(_that);case _SaveQuizAnswer() when saveQuizAnswer != null:
return saveQuizAnswer(_that);case _SaveWishes() when saveWishes != null:
return saveWishes(_that);case _SaveMemoryScore() when saveMemoryScore != null:
return saveMemoryScore(_that);case _SaveTimeCapsule() when saveTimeCapsule != null:
return saveTimeCapsule(_that);case _SaveTimeCapsuleLetter() when saveTimeCapsuleLetter != null:
return saveTimeCapsuleLetter(_that);case _SaveParentStats() when saveParentStats != null:
return saveParentStats(_that);case _SaveMilestones() when saveMilestones != null:
return saveMilestones(_that);case _SaveLookAlike() when saveLookAlike != null:
return saveLookAlike(_that);case _SaveLookAlikeAnswers() when saveLookAlikeAnswers != null:
return saveLookAlikeAnswers(_that);case _ResetLookAlike() when resetLookAlike != null:
return resetLookAlike(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  addButtonClicked,TResult Function( CategoryModel category,  bool edit)?  addOrEditCategory,TResult Function( CategoryModel category)?  changeTitle,TResult Function( CategoryModel category)?  deleteCategory,TResult Function( List<String> ids)?  reorderCategories,TResult Function( CategoryModel category,  String text)?  saveText,TResult Function( CategoryModel category,  CalendarModel calendar)?  saveCalendar,TResult Function( CategoryModel category,  List<QuestionModel> questions,  bool lock)?  saveQuiz,TResult Function( CategoryModel category,  String text,  bool edit)?  saveWishesContract,TResult Function( CategoryModel category)?  resetWishes,TResult Function( CategoryModel category)?  resetMemoryGame,TResult Function( CategoryModel category)?  resetQuiz,TResult Function( CategoryModel category,  List<File> files)?  uploadFiles,TResult Function( CategoryModel category,  List<String> keptUrls,  List<File> newFiles)?  saveMemoryGameImages,TResult Function( CategoryModel category,  List<int> filesIndexes)?  deleteFiles,TResult Function( CategoryModel category,  List<Widget> widgets)?  uploadSurprise,TResult Function( CategoryModel category,  QuestionModel question,  int index,  int score)?  saveQuizAnswer,TResult Function( CategoryModel category,  WishesModel wishes)?  saveWishes,TResult Function( CategoryModel category,  int score)?  saveMemoryScore,TResult Function( CategoryModel category,  String letter,  DateTime openDate)?  saveTimeCapsule,TResult Function( CategoryModel category,  String letter)?  saveTimeCapsuleLetter,TResult Function( CategoryModel category,  Map<String, double> stats)?  saveParentStats,TResult Function( CategoryModel category,  List<(MilestoneModel milestone, File? image)> milestones)?  saveMilestones,TResult Function( CategoryModel category,  Map<String, String> ownerAnswers,  Map<String, File> childImages,  File? ownerImage,  File? partnerImage)?  saveLookAlike,TResult Function( CategoryModel category,  Map<String, String> answers)?  saveLookAlikeAnswers,TResult Function( CategoryModel category)?  resetLookAlike,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _AddButtonClicked() when addButtonClicked != null:
return addButtonClicked();case _AddOrEditCategory() when addOrEditCategory != null:
return addOrEditCategory(_that.category,_that.edit);case _ChangeTitle() when changeTitle != null:
return changeTitle(_that.category);case _DeleteCategory() when deleteCategory != null:
return deleteCategory(_that.category);case _ReorderCategories() when reorderCategories != null:
return reorderCategories(_that.ids);case _SaveText() when saveText != null:
return saveText(_that.category,_that.text);case _SaveCalendar() when saveCalendar != null:
return saveCalendar(_that.category,_that.calendar);case _SaveQuiz() when saveQuiz != null:
return saveQuiz(_that.category,_that.questions,_that.lock);case _SaveWishesContract() when saveWishesContract != null:
return saveWishesContract(_that.category,_that.text,_that.edit);case _ResetWishes() when resetWishes != null:
return resetWishes(_that.category);case _ResetMemoryGame() when resetMemoryGame != null:
return resetMemoryGame(_that.category);case _ResetQuiz() when resetQuiz != null:
return resetQuiz(_that.category);case _UploadFiles() when uploadFiles != null:
return uploadFiles(_that.category,_that.files);case _SaveMemoryGameImages() when saveMemoryGameImages != null:
return saveMemoryGameImages(_that.category,_that.keptUrls,_that.newFiles);case _DeleteFiles() when deleteFiles != null:
return deleteFiles(_that.category,_that.filesIndexes);case _UploadSurprise() when uploadSurprise != null:
return uploadSurprise(_that.category,_that.widgets);case _SaveQuizAnswer() when saveQuizAnswer != null:
return saveQuizAnswer(_that.category,_that.question,_that.index,_that.score);case _SaveWishes() when saveWishes != null:
return saveWishes(_that.category,_that.wishes);case _SaveMemoryScore() when saveMemoryScore != null:
return saveMemoryScore(_that.category,_that.score);case _SaveTimeCapsule() when saveTimeCapsule != null:
return saveTimeCapsule(_that.category,_that.letter,_that.openDate);case _SaveTimeCapsuleLetter() when saveTimeCapsuleLetter != null:
return saveTimeCapsuleLetter(_that.category,_that.letter);case _SaveParentStats() when saveParentStats != null:
return saveParentStats(_that.category,_that.stats);case _SaveMilestones() when saveMilestones != null:
return saveMilestones(_that.category,_that.milestones);case _SaveLookAlike() when saveLookAlike != null:
return saveLookAlike(_that.category,_that.ownerAnswers,_that.childImages,_that.ownerImage,_that.partnerImage);case _SaveLookAlikeAnswers() when saveLookAlikeAnswers != null:
return saveLookAlikeAnswers(_that.category,_that.answers);case _ResetLookAlike() when resetLookAlike != null:
return resetLookAlike(_that.category);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  addButtonClicked,required TResult Function( CategoryModel category,  bool edit)  addOrEditCategory,required TResult Function( CategoryModel category)  changeTitle,required TResult Function( CategoryModel category)  deleteCategory,required TResult Function( List<String> ids)  reorderCategories,required TResult Function( CategoryModel category,  String text)  saveText,required TResult Function( CategoryModel category,  CalendarModel calendar)  saveCalendar,required TResult Function( CategoryModel category,  List<QuestionModel> questions,  bool lock)  saveQuiz,required TResult Function( CategoryModel category,  String text,  bool edit)  saveWishesContract,required TResult Function( CategoryModel category)  resetWishes,required TResult Function( CategoryModel category)  resetMemoryGame,required TResult Function( CategoryModel category)  resetQuiz,required TResult Function( CategoryModel category,  List<File> files)  uploadFiles,required TResult Function( CategoryModel category,  List<String> keptUrls,  List<File> newFiles)  saveMemoryGameImages,required TResult Function( CategoryModel category,  List<int> filesIndexes)  deleteFiles,required TResult Function( CategoryModel category,  List<Widget> widgets)  uploadSurprise,required TResult Function( CategoryModel category,  QuestionModel question,  int index,  int score)  saveQuizAnswer,required TResult Function( CategoryModel category,  WishesModel wishes)  saveWishes,required TResult Function( CategoryModel category,  int score)  saveMemoryScore,required TResult Function( CategoryModel category,  String letter,  DateTime openDate)  saveTimeCapsule,required TResult Function( CategoryModel category,  String letter)  saveTimeCapsuleLetter,required TResult Function( CategoryModel category,  Map<String, double> stats)  saveParentStats,required TResult Function( CategoryModel category,  List<(MilestoneModel milestone, File? image)> milestones)  saveMilestones,required TResult Function( CategoryModel category,  Map<String, String> ownerAnswers,  Map<String, File> childImages,  File? ownerImage,  File? partnerImage)  saveLookAlike,required TResult Function( CategoryModel category,  Map<String, String> answers)  saveLookAlikeAnswers,required TResult Function( CategoryModel category)  resetLookAlike,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _AddButtonClicked():
return addButtonClicked();case _AddOrEditCategory():
return addOrEditCategory(_that.category,_that.edit);case _ChangeTitle():
return changeTitle(_that.category);case _DeleteCategory():
return deleteCategory(_that.category);case _ReorderCategories():
return reorderCategories(_that.ids);case _SaveText():
return saveText(_that.category,_that.text);case _SaveCalendar():
return saveCalendar(_that.category,_that.calendar);case _SaveQuiz():
return saveQuiz(_that.category,_that.questions,_that.lock);case _SaveWishesContract():
return saveWishesContract(_that.category,_that.text,_that.edit);case _ResetWishes():
return resetWishes(_that.category);case _ResetMemoryGame():
return resetMemoryGame(_that.category);case _ResetQuiz():
return resetQuiz(_that.category);case _UploadFiles():
return uploadFiles(_that.category,_that.files);case _SaveMemoryGameImages():
return saveMemoryGameImages(_that.category,_that.keptUrls,_that.newFiles);case _DeleteFiles():
return deleteFiles(_that.category,_that.filesIndexes);case _UploadSurprise():
return uploadSurprise(_that.category,_that.widgets);case _SaveQuizAnswer():
return saveQuizAnswer(_that.category,_that.question,_that.index,_that.score);case _SaveWishes():
return saveWishes(_that.category,_that.wishes);case _SaveMemoryScore():
return saveMemoryScore(_that.category,_that.score);case _SaveTimeCapsule():
return saveTimeCapsule(_that.category,_that.letter,_that.openDate);case _SaveTimeCapsuleLetter():
return saveTimeCapsuleLetter(_that.category,_that.letter);case _SaveParentStats():
return saveParentStats(_that.category,_that.stats);case _SaveMilestones():
return saveMilestones(_that.category,_that.milestones);case _SaveLookAlike():
return saveLookAlike(_that.category,_that.ownerAnswers,_that.childImages,_that.ownerImage,_that.partnerImage);case _SaveLookAlikeAnswers():
return saveLookAlikeAnswers(_that.category,_that.answers);case _ResetLookAlike():
return resetLookAlike(_that.category);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  addButtonClicked,TResult? Function( CategoryModel category,  bool edit)?  addOrEditCategory,TResult? Function( CategoryModel category)?  changeTitle,TResult? Function( CategoryModel category)?  deleteCategory,TResult? Function( List<String> ids)?  reorderCategories,TResult? Function( CategoryModel category,  String text)?  saveText,TResult? Function( CategoryModel category,  CalendarModel calendar)?  saveCalendar,TResult? Function( CategoryModel category,  List<QuestionModel> questions,  bool lock)?  saveQuiz,TResult? Function( CategoryModel category,  String text,  bool edit)?  saveWishesContract,TResult? Function( CategoryModel category)?  resetWishes,TResult? Function( CategoryModel category)?  resetMemoryGame,TResult? Function( CategoryModel category)?  resetQuiz,TResult? Function( CategoryModel category,  List<File> files)?  uploadFiles,TResult? Function( CategoryModel category,  List<String> keptUrls,  List<File> newFiles)?  saveMemoryGameImages,TResult? Function( CategoryModel category,  List<int> filesIndexes)?  deleteFiles,TResult? Function( CategoryModel category,  List<Widget> widgets)?  uploadSurprise,TResult? Function( CategoryModel category,  QuestionModel question,  int index,  int score)?  saveQuizAnswer,TResult? Function( CategoryModel category,  WishesModel wishes)?  saveWishes,TResult? Function( CategoryModel category,  int score)?  saveMemoryScore,TResult? Function( CategoryModel category,  String letter,  DateTime openDate)?  saveTimeCapsule,TResult? Function( CategoryModel category,  String letter)?  saveTimeCapsuleLetter,TResult? Function( CategoryModel category,  Map<String, double> stats)?  saveParentStats,TResult? Function( CategoryModel category,  List<(MilestoneModel milestone, File? image)> milestones)?  saveMilestones,TResult? Function( CategoryModel category,  Map<String, String> ownerAnswers,  Map<String, File> childImages,  File? ownerImage,  File? partnerImage)?  saveLookAlike,TResult? Function( CategoryModel category,  Map<String, String> answers)?  saveLookAlikeAnswers,TResult? Function( CategoryModel category)?  resetLookAlike,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _AddButtonClicked() when addButtonClicked != null:
return addButtonClicked();case _AddOrEditCategory() when addOrEditCategory != null:
return addOrEditCategory(_that.category,_that.edit);case _ChangeTitle() when changeTitle != null:
return changeTitle(_that.category);case _DeleteCategory() when deleteCategory != null:
return deleteCategory(_that.category);case _ReorderCategories() when reorderCategories != null:
return reorderCategories(_that.ids);case _SaveText() when saveText != null:
return saveText(_that.category,_that.text);case _SaveCalendar() when saveCalendar != null:
return saveCalendar(_that.category,_that.calendar);case _SaveQuiz() when saveQuiz != null:
return saveQuiz(_that.category,_that.questions,_that.lock);case _SaveWishesContract() when saveWishesContract != null:
return saveWishesContract(_that.category,_that.text,_that.edit);case _ResetWishes() when resetWishes != null:
return resetWishes(_that.category);case _ResetMemoryGame() when resetMemoryGame != null:
return resetMemoryGame(_that.category);case _ResetQuiz() when resetQuiz != null:
return resetQuiz(_that.category);case _UploadFiles() when uploadFiles != null:
return uploadFiles(_that.category,_that.files);case _SaveMemoryGameImages() when saveMemoryGameImages != null:
return saveMemoryGameImages(_that.category,_that.keptUrls,_that.newFiles);case _DeleteFiles() when deleteFiles != null:
return deleteFiles(_that.category,_that.filesIndexes);case _UploadSurprise() when uploadSurprise != null:
return uploadSurprise(_that.category,_that.widgets);case _SaveQuizAnswer() when saveQuizAnswer != null:
return saveQuizAnswer(_that.category,_that.question,_that.index,_that.score);case _SaveWishes() when saveWishes != null:
return saveWishes(_that.category,_that.wishes);case _SaveMemoryScore() when saveMemoryScore != null:
return saveMemoryScore(_that.category,_that.score);case _SaveTimeCapsule() when saveTimeCapsule != null:
return saveTimeCapsule(_that.category,_that.letter,_that.openDate);case _SaveTimeCapsuleLetter() when saveTimeCapsuleLetter != null:
return saveTimeCapsuleLetter(_that.category,_that.letter);case _SaveParentStats() when saveParentStats != null:
return saveParentStats(_that.category,_that.stats);case _SaveMilestones() when saveMilestones != null:
return saveMilestones(_that.category,_that.milestones);case _SaveLookAlike() when saveLookAlike != null:
return saveLookAlike(_that.category,_that.ownerAnswers,_that.childImages,_that.ownerImage,_that.partnerImage);case _SaveLookAlikeAnswers() when saveLookAlikeAnswers != null:
return saveLookAlikeAnswers(_that.category,_that.answers);case _ResetLookAlike() when resetLookAlike != null:
return resetLookAlike(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements HomeEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.init()';
}


}




/// @nodoc


class _AddButtonClicked implements HomeEvent {
  const _AddButtonClicked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddButtonClicked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.addButtonClicked()';
}


}




/// @nodoc


class _AddOrEditCategory implements HomeEvent {
  const _AddOrEditCategory(this.category, {this.edit = false});
  

 final  CategoryModel category;
@JsonKey() final  bool edit;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddOrEditCategoryCopyWith<_AddOrEditCategory> get copyWith => __$AddOrEditCategoryCopyWithImpl<_AddOrEditCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddOrEditCategory&&(identical(other.category, category) || other.category == category)&&(identical(other.edit, edit) || other.edit == edit));
}


@override
int get hashCode => Object.hash(runtimeType,category,edit);

@override
String toString() {
  return 'HomeEvent.addOrEditCategory(category: $category, edit: $edit)';
}


}

/// @nodoc
abstract mixin class _$AddOrEditCategoryCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$AddOrEditCategoryCopyWith(_AddOrEditCategory value, $Res Function(_AddOrEditCategory) _then) = __$AddOrEditCategoryCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, bool edit
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$AddOrEditCategoryCopyWithImpl<$Res>
    implements _$AddOrEditCategoryCopyWith<$Res> {
  __$AddOrEditCategoryCopyWithImpl(this._self, this._then);

  final _AddOrEditCategory _self;
  final $Res Function(_AddOrEditCategory) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? edit = null,}) {
  return _then(_AddOrEditCategory(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,edit: null == edit ? _self.edit : edit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _ChangeTitle implements HomeEvent {
  const _ChangeTitle(this.category);
  

 final  CategoryModel category;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeTitleCopyWith<_ChangeTitle> get copyWith => __$ChangeTitleCopyWithImpl<_ChangeTitle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeTitle&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'HomeEvent.changeTitle(category: $category)';
}


}

/// @nodoc
abstract mixin class _$ChangeTitleCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ChangeTitleCopyWith(_ChangeTitle value, $Res Function(_ChangeTitle) _then) = __$ChangeTitleCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$ChangeTitleCopyWithImpl<$Res>
    implements _$ChangeTitleCopyWith<$Res> {
  __$ChangeTitleCopyWithImpl(this._self, this._then);

  final _ChangeTitle _self;
  final $Res Function(_ChangeTitle) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_ChangeTitle(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _DeleteCategory implements HomeEvent {
  const _DeleteCategory(this.category);
  

 final  CategoryModel category;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCategoryCopyWith<_DeleteCategory> get copyWith => __$DeleteCategoryCopyWithImpl<_DeleteCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteCategory&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'HomeEvent.deleteCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class _$DeleteCategoryCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$DeleteCategoryCopyWith(_DeleteCategory value, $Res Function(_DeleteCategory) _then) = __$DeleteCategoryCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$DeleteCategoryCopyWithImpl<$Res>
    implements _$DeleteCategoryCopyWith<$Res> {
  __$DeleteCategoryCopyWithImpl(this._self, this._then);

  final _DeleteCategory _self;
  final $Res Function(_DeleteCategory) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_DeleteCategory(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _ReorderCategories implements HomeEvent {
  const _ReorderCategories(final  List<String> ids): _ids = ids;
  

 final  List<String> _ids;
 List<String> get ids {
  if (_ids is EqualUnmodifiableListView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ids);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderCategoriesCopyWith<_ReorderCategories> get copyWith => __$ReorderCategoriesCopyWithImpl<_ReorderCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderCategories&&const DeepCollectionEquality().equals(other._ids, _ids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ids));

@override
String toString() {
  return 'HomeEvent.reorderCategories(ids: $ids)';
}


}

/// @nodoc
abstract mixin class _$ReorderCategoriesCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ReorderCategoriesCopyWith(_ReorderCategories value, $Res Function(_ReorderCategories) _then) = __$ReorderCategoriesCopyWithImpl;
@useResult
$Res call({
 List<String> ids
});




}
/// @nodoc
class __$ReorderCategoriesCopyWithImpl<$Res>
    implements _$ReorderCategoriesCopyWith<$Res> {
  __$ReorderCategoriesCopyWithImpl(this._self, this._then);

  final _ReorderCategories _self;
  final $Res Function(_ReorderCategories) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ids = null,}) {
  return _then(_ReorderCategories(
null == ids ? _self._ids : ids // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class _SaveText implements HomeEvent {
  const _SaveText(this.category, this.text);
  

 final  CategoryModel category;
 final  String text;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveTextCopyWith<_SaveText> get copyWith => __$SaveTextCopyWithImpl<_SaveText>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveText&&(identical(other.category, category) || other.category == category)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,category,text);

@override
String toString() {
  return 'HomeEvent.saveText(category: $category, text: $text)';
}


}

/// @nodoc
abstract mixin class _$SaveTextCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveTextCopyWith(_SaveText value, $Res Function(_SaveText) _then) = __$SaveTextCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, String text
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveTextCopyWithImpl<$Res>
    implements _$SaveTextCopyWith<$Res> {
  __$SaveTextCopyWithImpl(this._self, this._then);

  final _SaveText _self;
  final $Res Function(_SaveText) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? text = null,}) {
  return _then(_SaveText(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveCalendar implements HomeEvent {
  const _SaveCalendar(this.category, this.calendar);
  

 final  CategoryModel category;
 final  CalendarModel calendar;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveCalendarCopyWith<_SaveCalendar> get copyWith => __$SaveCalendarCopyWithImpl<_SaveCalendar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveCalendar&&(identical(other.category, category) || other.category == category)&&(identical(other.calendar, calendar) || other.calendar == calendar));
}


@override
int get hashCode => Object.hash(runtimeType,category,calendar);

@override
String toString() {
  return 'HomeEvent.saveCalendar(category: $category, calendar: $calendar)';
}


}

/// @nodoc
abstract mixin class _$SaveCalendarCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveCalendarCopyWith(_SaveCalendar value, $Res Function(_SaveCalendar) _then) = __$SaveCalendarCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, CalendarModel calendar
});


$CategoryModelCopyWith<$Res> get category;$CalendarModelCopyWith<$Res> get calendar;

}
/// @nodoc
class __$SaveCalendarCopyWithImpl<$Res>
    implements _$SaveCalendarCopyWith<$Res> {
  __$SaveCalendarCopyWithImpl(this._self, this._then);

  final _SaveCalendar _self;
  final $Res Function(_SaveCalendar) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? calendar = null,}) {
  return _then(_SaveCalendar(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == calendar ? _self.calendar : calendar // ignore: cast_nullable_to_non_nullable
as CalendarModel,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarModelCopyWith<$Res> get calendar {
  
  return $CalendarModelCopyWith<$Res>(_self.calendar, (value) {
    return _then(_self.copyWith(calendar: value));
  });
}
}

/// @nodoc


class _SaveQuiz implements HomeEvent {
  const _SaveQuiz(this.category, final  List<QuestionModel> questions, this.lock): _questions = questions;
  

 final  CategoryModel category;
 final  List<QuestionModel> _questions;
 List<QuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  bool lock;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveQuizCopyWith<_SaveQuiz> get copyWith => __$SaveQuizCopyWithImpl<_SaveQuiz>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveQuiz&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.lock, lock) || other.lock == lock));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_questions),lock);

@override
String toString() {
  return 'HomeEvent.saveQuiz(category: $category, questions: $questions, lock: $lock)';
}


}

/// @nodoc
abstract mixin class _$SaveQuizCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveQuizCopyWith(_SaveQuiz value, $Res Function(_SaveQuiz) _then) = __$SaveQuizCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, List<QuestionModel> questions, bool lock
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveQuizCopyWithImpl<$Res>
    implements _$SaveQuizCopyWith<$Res> {
  __$SaveQuizCopyWithImpl(this._self, this._then);

  final _SaveQuiz _self;
  final $Res Function(_SaveQuiz) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? questions = null,Object? lock = null,}) {
  return _then(_SaveQuiz(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveWishesContract implements HomeEvent {
  const _SaveWishesContract(this.category, this.text, {required this.edit});
  

 final  CategoryModel category;
 final  String text;
 final  bool edit;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveWishesContractCopyWith<_SaveWishesContract> get copyWith => __$SaveWishesContractCopyWithImpl<_SaveWishesContract>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveWishesContract&&(identical(other.category, category) || other.category == category)&&(identical(other.text, text) || other.text == text)&&(identical(other.edit, edit) || other.edit == edit));
}


@override
int get hashCode => Object.hash(runtimeType,category,text,edit);

@override
String toString() {
  return 'HomeEvent.saveWishesContract(category: $category, text: $text, edit: $edit)';
}


}

/// @nodoc
abstract mixin class _$SaveWishesContractCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveWishesContractCopyWith(_SaveWishesContract value, $Res Function(_SaveWishesContract) _then) = __$SaveWishesContractCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, String text, bool edit
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveWishesContractCopyWithImpl<$Res>
    implements _$SaveWishesContractCopyWith<$Res> {
  __$SaveWishesContractCopyWithImpl(this._self, this._then);

  final _SaveWishesContract _self;
  final $Res Function(_SaveWishesContract) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? text = null,Object? edit = null,}) {
  return _then(_SaveWishesContract(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,edit: null == edit ? _self.edit : edit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _ResetWishes implements HomeEvent {
  const _ResetWishes(this.category);
  

 final  CategoryModel category;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetWishesCopyWith<_ResetWishes> get copyWith => __$ResetWishesCopyWithImpl<_ResetWishes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetWishes&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'HomeEvent.resetWishes(category: $category)';
}


}

/// @nodoc
abstract mixin class _$ResetWishesCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ResetWishesCopyWith(_ResetWishes value, $Res Function(_ResetWishes) _then) = __$ResetWishesCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$ResetWishesCopyWithImpl<$Res>
    implements _$ResetWishesCopyWith<$Res> {
  __$ResetWishesCopyWithImpl(this._self, this._then);

  final _ResetWishes _self;
  final $Res Function(_ResetWishes) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_ResetWishes(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _ResetMemoryGame implements HomeEvent {
  const _ResetMemoryGame(this.category);
  

 final  CategoryModel category;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetMemoryGameCopyWith<_ResetMemoryGame> get copyWith => __$ResetMemoryGameCopyWithImpl<_ResetMemoryGame>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetMemoryGame&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'HomeEvent.resetMemoryGame(category: $category)';
}


}

/// @nodoc
abstract mixin class _$ResetMemoryGameCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ResetMemoryGameCopyWith(_ResetMemoryGame value, $Res Function(_ResetMemoryGame) _then) = __$ResetMemoryGameCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$ResetMemoryGameCopyWithImpl<$Res>
    implements _$ResetMemoryGameCopyWith<$Res> {
  __$ResetMemoryGameCopyWithImpl(this._self, this._then);

  final _ResetMemoryGame _self;
  final $Res Function(_ResetMemoryGame) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_ResetMemoryGame(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _ResetQuiz implements HomeEvent {
  const _ResetQuiz(this.category);
  

 final  CategoryModel category;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetQuizCopyWith<_ResetQuiz> get copyWith => __$ResetQuizCopyWithImpl<_ResetQuiz>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetQuiz&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'HomeEvent.resetQuiz(category: $category)';
}


}

/// @nodoc
abstract mixin class _$ResetQuizCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ResetQuizCopyWith(_ResetQuiz value, $Res Function(_ResetQuiz) _then) = __$ResetQuizCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$ResetQuizCopyWithImpl<$Res>
    implements _$ResetQuizCopyWith<$Res> {
  __$ResetQuizCopyWithImpl(this._self, this._then);

  final _ResetQuiz _self;
  final $Res Function(_ResetQuiz) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_ResetQuiz(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _UploadFiles implements HomeEvent {
  const _UploadFiles(this.category, final  List<File> files): _files = files;
  

 final  CategoryModel category;
 final  List<File> _files;
 List<File> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadFilesCopyWith<_UploadFiles> get copyWith => __$UploadFilesCopyWithImpl<_UploadFiles>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadFiles&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._files, _files));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'HomeEvent.uploadFiles(category: $category, files: $files)';
}


}

/// @nodoc
abstract mixin class _$UploadFilesCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$UploadFilesCopyWith(_UploadFiles value, $Res Function(_UploadFiles) _then) = __$UploadFilesCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, List<File> files
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$UploadFilesCopyWithImpl<$Res>
    implements _$UploadFilesCopyWith<$Res> {
  __$UploadFilesCopyWithImpl(this._self, this._then);

  final _UploadFiles _self;
  final $Res Function(_UploadFiles) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? files = null,}) {
  return _then(_UploadFiles(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveMemoryGameImages implements HomeEvent {
  const _SaveMemoryGameImages(this.category, final  List<String> keptUrls, final  List<File> newFiles): _keptUrls = keptUrls,_newFiles = newFiles;
  

 final  CategoryModel category;
 final  List<String> _keptUrls;
 List<String> get keptUrls {
  if (_keptUrls is EqualUnmodifiableListView) return _keptUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keptUrls);
}

 final  List<File> _newFiles;
 List<File> get newFiles {
  if (_newFiles is EqualUnmodifiableListView) return _newFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newFiles);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveMemoryGameImagesCopyWith<_SaveMemoryGameImages> get copyWith => __$SaveMemoryGameImagesCopyWithImpl<_SaveMemoryGameImages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveMemoryGameImages&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._keptUrls, _keptUrls)&&const DeepCollectionEquality().equals(other._newFiles, _newFiles));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_keptUrls),const DeepCollectionEquality().hash(_newFiles));

@override
String toString() {
  return 'HomeEvent.saveMemoryGameImages(category: $category, keptUrls: $keptUrls, newFiles: $newFiles)';
}


}

/// @nodoc
abstract mixin class _$SaveMemoryGameImagesCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveMemoryGameImagesCopyWith(_SaveMemoryGameImages value, $Res Function(_SaveMemoryGameImages) _then) = __$SaveMemoryGameImagesCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, List<String> keptUrls, List<File> newFiles
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveMemoryGameImagesCopyWithImpl<$Res>
    implements _$SaveMemoryGameImagesCopyWith<$Res> {
  __$SaveMemoryGameImagesCopyWithImpl(this._self, this._then);

  final _SaveMemoryGameImages _self;
  final $Res Function(_SaveMemoryGameImages) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? keptUrls = null,Object? newFiles = null,}) {
  return _then(_SaveMemoryGameImages(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == keptUrls ? _self._keptUrls : keptUrls // ignore: cast_nullable_to_non_nullable
as List<String>,null == newFiles ? _self._newFiles : newFiles // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _DeleteFiles implements HomeEvent {
  const _DeleteFiles(this.category, final  List<int> filesIndexes): _filesIndexes = filesIndexes;
  

 final  CategoryModel category;
 final  List<int> _filesIndexes;
 List<int> get filesIndexes {
  if (_filesIndexes is EqualUnmodifiableListView) return _filesIndexes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filesIndexes);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteFilesCopyWith<_DeleteFiles> get copyWith => __$DeleteFilesCopyWithImpl<_DeleteFiles>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteFiles&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._filesIndexes, _filesIndexes));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_filesIndexes));

@override
String toString() {
  return 'HomeEvent.deleteFiles(category: $category, filesIndexes: $filesIndexes)';
}


}

/// @nodoc
abstract mixin class _$DeleteFilesCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$DeleteFilesCopyWith(_DeleteFiles value, $Res Function(_DeleteFiles) _then) = __$DeleteFilesCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, List<int> filesIndexes
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$DeleteFilesCopyWithImpl<$Res>
    implements _$DeleteFilesCopyWith<$Res> {
  __$DeleteFilesCopyWithImpl(this._self, this._then);

  final _DeleteFiles _self;
  final $Res Function(_DeleteFiles) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? filesIndexes = null,}) {
  return _then(_DeleteFiles(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == filesIndexes ? _self._filesIndexes : filesIndexes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _UploadSurprise implements HomeEvent {
  const _UploadSurprise(this.category, final  List<Widget> widgets): _widgets = widgets;
  

 final  CategoryModel category;
 final  List<Widget> _widgets;
 List<Widget> get widgets {
  if (_widgets is EqualUnmodifiableListView) return _widgets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_widgets);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadSurpriseCopyWith<_UploadSurprise> get copyWith => __$UploadSurpriseCopyWithImpl<_UploadSurprise>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadSurprise&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._widgets, _widgets));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_widgets));

@override
String toString() {
  return 'HomeEvent.uploadSurprise(category: $category, widgets: $widgets)';
}


}

/// @nodoc
abstract mixin class _$UploadSurpriseCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$UploadSurpriseCopyWith(_UploadSurprise value, $Res Function(_UploadSurprise) _then) = __$UploadSurpriseCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, List<Widget> widgets
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$UploadSurpriseCopyWithImpl<$Res>
    implements _$UploadSurpriseCopyWith<$Res> {
  __$UploadSurpriseCopyWithImpl(this._self, this._then);

  final _UploadSurprise _self;
  final $Res Function(_UploadSurprise) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? widgets = null,}) {
  return _then(_UploadSurprise(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == widgets ? _self._widgets : widgets // ignore: cast_nullable_to_non_nullable
as List<Widget>,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveQuizAnswer implements HomeEvent {
  const _SaveQuizAnswer(this.category, this.question, this.index, this.score);
  

 final  CategoryModel category;
 final  QuestionModel question;
 final  int index;
 final  int score;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveQuizAnswerCopyWith<_SaveQuizAnswer> get copyWith => __$SaveQuizAnswerCopyWithImpl<_SaveQuizAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveQuizAnswer&&(identical(other.category, category) || other.category == category)&&(identical(other.question, question) || other.question == question)&&(identical(other.index, index) || other.index == index)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,category,question,index,score);

@override
String toString() {
  return 'HomeEvent.saveQuizAnswer(category: $category, question: $question, index: $index, score: $score)';
}


}

/// @nodoc
abstract mixin class _$SaveQuizAnswerCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveQuizAnswerCopyWith(_SaveQuizAnswer value, $Res Function(_SaveQuizAnswer) _then) = __$SaveQuizAnswerCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, QuestionModel question, int index, int score
});


$CategoryModelCopyWith<$Res> get category;$QuestionModelCopyWith<$Res> get question;

}
/// @nodoc
class __$SaveQuizAnswerCopyWithImpl<$Res>
    implements _$SaveQuizAnswerCopyWith<$Res> {
  __$SaveQuizAnswerCopyWithImpl(this._self, this._then);

  final _SaveQuizAnswer _self;
  final $Res Function(_SaveQuizAnswer) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? question = null,Object? index = null,Object? score = null,}) {
  return _then(_SaveQuizAnswer(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as QuestionModel,null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<$Res> get question {
  
  return $QuestionModelCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}

/// @nodoc


class _SaveWishes implements HomeEvent {
  const _SaveWishes(this.category, this.wishes);
  

 final  CategoryModel category;
 final  WishesModel wishes;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveWishesCopyWith<_SaveWishes> get copyWith => __$SaveWishesCopyWithImpl<_SaveWishes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveWishes&&(identical(other.category, category) || other.category == category)&&(identical(other.wishes, wishes) || other.wishes == wishes));
}


@override
int get hashCode => Object.hash(runtimeType,category,wishes);

@override
String toString() {
  return 'HomeEvent.saveWishes(category: $category, wishes: $wishes)';
}


}

/// @nodoc
abstract mixin class _$SaveWishesCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveWishesCopyWith(_SaveWishes value, $Res Function(_SaveWishes) _then) = __$SaveWishesCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, WishesModel wishes
});


$CategoryModelCopyWith<$Res> get category;$WishesModelCopyWith<$Res> get wishes;

}
/// @nodoc
class __$SaveWishesCopyWithImpl<$Res>
    implements _$SaveWishesCopyWith<$Res> {
  __$SaveWishesCopyWithImpl(this._self, this._then);

  final _SaveWishes _self;
  final $Res Function(_SaveWishes) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? wishes = null,}) {
  return _then(_SaveWishes(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == wishes ? _self.wishes : wishes // ignore: cast_nullable_to_non_nullable
as WishesModel,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WishesModelCopyWith<$Res> get wishes {
  
  return $WishesModelCopyWith<$Res>(_self.wishes, (value) {
    return _then(_self.copyWith(wishes: value));
  });
}
}

/// @nodoc


class _SaveMemoryScore implements HomeEvent {
  const _SaveMemoryScore(this.category, this.score);
  

 final  CategoryModel category;
 final  int score;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveMemoryScoreCopyWith<_SaveMemoryScore> get copyWith => __$SaveMemoryScoreCopyWithImpl<_SaveMemoryScore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveMemoryScore&&(identical(other.category, category) || other.category == category)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,category,score);

@override
String toString() {
  return 'HomeEvent.saveMemoryScore(category: $category, score: $score)';
}


}

/// @nodoc
abstract mixin class _$SaveMemoryScoreCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveMemoryScoreCopyWith(_SaveMemoryScore value, $Res Function(_SaveMemoryScore) _then) = __$SaveMemoryScoreCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, int score
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveMemoryScoreCopyWithImpl<$Res>
    implements _$SaveMemoryScoreCopyWith<$Res> {
  __$SaveMemoryScoreCopyWithImpl(this._self, this._then);

  final _SaveMemoryScore _self;
  final $Res Function(_SaveMemoryScore) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? score = null,}) {
  return _then(_SaveMemoryScore(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveTimeCapsule implements HomeEvent {
  const _SaveTimeCapsule(this.category, this.letter, this.openDate);
  

 final  CategoryModel category;
 final  String letter;
 final  DateTime openDate;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveTimeCapsuleCopyWith<_SaveTimeCapsule> get copyWith => __$SaveTimeCapsuleCopyWithImpl<_SaveTimeCapsule>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveTimeCapsule&&(identical(other.category, category) || other.category == category)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.openDate, openDate) || other.openDate == openDate));
}


@override
int get hashCode => Object.hash(runtimeType,category,letter,openDate);

@override
String toString() {
  return 'HomeEvent.saveTimeCapsule(category: $category, letter: $letter, openDate: $openDate)';
}


}

/// @nodoc
abstract mixin class _$SaveTimeCapsuleCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveTimeCapsuleCopyWith(_SaveTimeCapsule value, $Res Function(_SaveTimeCapsule) _then) = __$SaveTimeCapsuleCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, String letter, DateTime openDate
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveTimeCapsuleCopyWithImpl<$Res>
    implements _$SaveTimeCapsuleCopyWith<$Res> {
  __$SaveTimeCapsuleCopyWithImpl(this._self, this._then);

  final _SaveTimeCapsule _self;
  final $Res Function(_SaveTimeCapsule) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? letter = null,Object? openDate = null,}) {
  return _then(_SaveTimeCapsule(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as String,null == openDate ? _self.openDate : openDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveTimeCapsuleLetter implements HomeEvent {
  const _SaveTimeCapsuleLetter(this.category, this.letter);
  

 final  CategoryModel category;
 final  String letter;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveTimeCapsuleLetterCopyWith<_SaveTimeCapsuleLetter> get copyWith => __$SaveTimeCapsuleLetterCopyWithImpl<_SaveTimeCapsuleLetter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveTimeCapsuleLetter&&(identical(other.category, category) || other.category == category)&&(identical(other.letter, letter) || other.letter == letter));
}


@override
int get hashCode => Object.hash(runtimeType,category,letter);

@override
String toString() {
  return 'HomeEvent.saveTimeCapsuleLetter(category: $category, letter: $letter)';
}


}

/// @nodoc
abstract mixin class _$SaveTimeCapsuleLetterCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveTimeCapsuleLetterCopyWith(_SaveTimeCapsuleLetter value, $Res Function(_SaveTimeCapsuleLetter) _then) = __$SaveTimeCapsuleLetterCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, String letter
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveTimeCapsuleLetterCopyWithImpl<$Res>
    implements _$SaveTimeCapsuleLetterCopyWith<$Res> {
  __$SaveTimeCapsuleLetterCopyWithImpl(this._self, this._then);

  final _SaveTimeCapsuleLetter _self;
  final $Res Function(_SaveTimeCapsuleLetter) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? letter = null,}) {
  return _then(_SaveTimeCapsuleLetter(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveParentStats implements HomeEvent {
  const _SaveParentStats(this.category, final  Map<String, double> stats): _stats = stats;
  

 final  CategoryModel category;
 final  Map<String, double> _stats;
 Map<String, double> get stats {
  if (_stats is EqualUnmodifiableMapView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_stats);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveParentStatsCopyWith<_SaveParentStats> get copyWith => __$SaveParentStatsCopyWithImpl<_SaveParentStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveParentStats&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._stats, _stats));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_stats));

@override
String toString() {
  return 'HomeEvent.saveParentStats(category: $category, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$SaveParentStatsCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveParentStatsCopyWith(_SaveParentStats value, $Res Function(_SaveParentStats) _then) = __$SaveParentStatsCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, Map<String, double> stats
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveParentStatsCopyWithImpl<$Res>
    implements _$SaveParentStatsCopyWith<$Res> {
  __$SaveParentStatsCopyWithImpl(this._self, this._then);

  final _SaveParentStats _self;
  final $Res Function(_SaveParentStats) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? stats = null,}) {
  return _then(_SaveParentStats(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveMilestones implements HomeEvent {
  const _SaveMilestones(this.category, final  List<(MilestoneModel milestone, File? image)> milestones): _milestones = milestones;
  

 final  CategoryModel category;
 final  List<(MilestoneModel milestone, File? image)> _milestones;
 List<(MilestoneModel milestone, File? image)> get milestones {
  if (_milestones is EqualUnmodifiableListView) return _milestones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_milestones);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveMilestonesCopyWith<_SaveMilestones> get copyWith => __$SaveMilestonesCopyWithImpl<_SaveMilestones>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveMilestones&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._milestones, _milestones));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_milestones));

@override
String toString() {
  return 'HomeEvent.saveMilestones(category: $category, milestones: $milestones)';
}


}

/// @nodoc
abstract mixin class _$SaveMilestonesCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveMilestonesCopyWith(_SaveMilestones value, $Res Function(_SaveMilestones) _then) = __$SaveMilestonesCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, List<(MilestoneModel milestone, File? image)> milestones
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveMilestonesCopyWithImpl<$Res>
    implements _$SaveMilestonesCopyWith<$Res> {
  __$SaveMilestonesCopyWithImpl(this._self, this._then);

  final _SaveMilestones _self;
  final $Res Function(_SaveMilestones) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? milestones = null,}) {
  return _then(_SaveMilestones(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == milestones ? _self._milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<(MilestoneModel milestone, File? image)>,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveLookAlike implements HomeEvent {
  const _SaveLookAlike(this.category, final  Map<String, String> ownerAnswers, {final  Map<String, File> childImages = const {}, this.ownerImage, this.partnerImage}): _ownerAnswers = ownerAnswers,_childImages = childImages;
  

 final  CategoryModel category;
 final  Map<String, String> _ownerAnswers;
 Map<String, String> get ownerAnswers {
  if (_ownerAnswers is EqualUnmodifiableMapView) return _ownerAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ownerAnswers);
}

 final  Map<String, File> _childImages;
@JsonKey() Map<String, File> get childImages {
  if (_childImages is EqualUnmodifiableMapView) return _childImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_childImages);
}

 final  File? ownerImage;
 final  File? partnerImage;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveLookAlikeCopyWith<_SaveLookAlike> get copyWith => __$SaveLookAlikeCopyWithImpl<_SaveLookAlike>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveLookAlike&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._ownerAnswers, _ownerAnswers)&&const DeepCollectionEquality().equals(other._childImages, _childImages)&&(identical(other.ownerImage, ownerImage) || other.ownerImage == ownerImage)&&(identical(other.partnerImage, partnerImage) || other.partnerImage == partnerImage));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_ownerAnswers),const DeepCollectionEquality().hash(_childImages),ownerImage,partnerImage);

@override
String toString() {
  return 'HomeEvent.saveLookAlike(category: $category, ownerAnswers: $ownerAnswers, childImages: $childImages, ownerImage: $ownerImage, partnerImage: $partnerImage)';
}


}

/// @nodoc
abstract mixin class _$SaveLookAlikeCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveLookAlikeCopyWith(_SaveLookAlike value, $Res Function(_SaveLookAlike) _then) = __$SaveLookAlikeCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, Map<String, String> ownerAnswers, Map<String, File> childImages, File? ownerImage, File? partnerImage
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveLookAlikeCopyWithImpl<$Res>
    implements _$SaveLookAlikeCopyWith<$Res> {
  __$SaveLookAlikeCopyWithImpl(this._self, this._then);

  final _SaveLookAlike _self;
  final $Res Function(_SaveLookAlike) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? ownerAnswers = null,Object? childImages = null,Object? ownerImage = freezed,Object? partnerImage = freezed,}) {
  return _then(_SaveLookAlike(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == ownerAnswers ? _self._ownerAnswers : ownerAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,childImages: null == childImages ? _self._childImages : childImages // ignore: cast_nullable_to_non_nullable
as Map<String, File>,ownerImage: freezed == ownerImage ? _self.ownerImage : ownerImage // ignore: cast_nullable_to_non_nullable
as File?,partnerImage: freezed == partnerImage ? _self.partnerImage : partnerImage // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _SaveLookAlikeAnswers implements HomeEvent {
  const _SaveLookAlikeAnswers(this.category, final  Map<String, String> answers): _answers = answers;
  

 final  CategoryModel category;
 final  Map<String, String> _answers;
 Map<String, String> get answers {
  if (_answers is EqualUnmodifiableMapView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_answers);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveLookAlikeAnswersCopyWith<_SaveLookAlikeAnswers> get copyWith => __$SaveLookAlikeAnswersCopyWithImpl<_SaveLookAlikeAnswers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveLookAlikeAnswers&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._answers, _answers));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_answers));

@override
String toString() {
  return 'HomeEvent.saveLookAlikeAnswers(category: $category, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$SaveLookAlikeAnswersCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SaveLookAlikeAnswersCopyWith(_SaveLookAlikeAnswers value, $Res Function(_SaveLookAlikeAnswers) _then) = __$SaveLookAlikeAnswersCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, Map<String, String> answers
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SaveLookAlikeAnswersCopyWithImpl<$Res>
    implements _$SaveLookAlikeAnswersCopyWith<$Res> {
  __$SaveLookAlikeAnswersCopyWithImpl(this._self, this._then);

  final _SaveLookAlikeAnswers _self;
  final $Res Function(_SaveLookAlikeAnswers) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? answers = null,}) {
  return _then(_SaveLookAlikeAnswers(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _ResetLookAlike implements HomeEvent {
  const _ResetLookAlike(this.category);
  

 final  CategoryModel category;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetLookAlikeCopyWith<_ResetLookAlike> get copyWith => __$ResetLookAlikeCopyWithImpl<_ResetLookAlike>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetLookAlike&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'HomeEvent.resetLookAlike(category: $category)';
}


}

/// @nodoc
abstract mixin class _$ResetLookAlikeCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ResetLookAlikeCopyWith(_ResetLookAlike value, $Res Function(_ResetLookAlike) _then) = __$ResetLookAlikeCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$ResetLookAlikeCopyWithImpl<$Res>
    implements _$ResetLookAlikeCopyWith<$Res> {
  __$ResetLookAlikeCopyWithImpl(this._self, this._then);

  final _ResetLookAlike _self;
  final $Res Function(_ResetLookAlike) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_ResetLookAlike(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc
mixin _$HomeState {

 EventModel? get event;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);





@override
String toString() {
  return 'HomeState(event: $event)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 EventModel? event
});


$EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? event = freezed,}) {
  return _then(_self.copyWith(
event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( ErrorMessage value)?  errorMessage,TResult Function( OpenAddDialog value)?  openAddDialog,TResult Function( NavigateToAddText value)?  navigateToAddText,TResult Function( NavigateToAddPictures value)?  navigateToAddPictures,TResult Function( NavigateToAddVideos value)?  navigateToAddVideos,TResult Function( NavigateToAddQuizGame value)?  navigateToAddQuizGame,TResult Function( NavigateToAddBirthdayCalendar value)?  navigateToAddBirthdayCalendar,TResult Function( NavigateToAddBirthdaySurprise value)?  navigateToAddBirthdaySurprise,TResult Function( NavigateToAddWishesList value)?  navigateToAddWishesList,TResult Function( NavigateToAddMemoryGame value)?  navigateToAddMemoryGame,TResult Function( NavigateToAddTimeCapsule value)?  navigateToAddTimeCapsule,TResult Function( NavigateToAddBabyLetter value)?  navigateToAddBabyLetter,TResult Function( NavigateToAddParentStats value)?  navigateToAddParentStats,TResult Function( NavigateToAddMilestones value)?  navigateToAddMilestones,TResult Function( NavigateToAddLookAlike value)?  navigateToAddLookAlike,TResult Function( OpenEditAgain value)?  openEditAgain,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case OpenAddDialog() when openAddDialog != null:
return openAddDialog(_that);case NavigateToAddText() when navigateToAddText != null:
return navigateToAddText(_that);case NavigateToAddPictures() when navigateToAddPictures != null:
return navigateToAddPictures(_that);case NavigateToAddVideos() when navigateToAddVideos != null:
return navigateToAddVideos(_that);case NavigateToAddQuizGame() when navigateToAddQuizGame != null:
return navigateToAddQuizGame(_that);case NavigateToAddBirthdayCalendar() when navigateToAddBirthdayCalendar != null:
return navigateToAddBirthdayCalendar(_that);case NavigateToAddBirthdaySurprise() when navigateToAddBirthdaySurprise != null:
return navigateToAddBirthdaySurprise(_that);case NavigateToAddWishesList() when navigateToAddWishesList != null:
return navigateToAddWishesList(_that);case NavigateToAddMemoryGame() when navigateToAddMemoryGame != null:
return navigateToAddMemoryGame(_that);case NavigateToAddTimeCapsule() when navigateToAddTimeCapsule != null:
return navigateToAddTimeCapsule(_that);case NavigateToAddBabyLetter() when navigateToAddBabyLetter != null:
return navigateToAddBabyLetter(_that);case NavigateToAddParentStats() when navigateToAddParentStats != null:
return navigateToAddParentStats(_that);case NavigateToAddMilestones() when navigateToAddMilestones != null:
return navigateToAddMilestones(_that);case NavigateToAddLookAlike() when navigateToAddLookAlike != null:
return navigateToAddLookAlike(_that);case OpenEditAgain() when openEditAgain != null:
return openEditAgain(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( ErrorMessage value)  errorMessage,required TResult Function( OpenAddDialog value)  openAddDialog,required TResult Function( NavigateToAddText value)  navigateToAddText,required TResult Function( NavigateToAddPictures value)  navigateToAddPictures,required TResult Function( NavigateToAddVideos value)  navigateToAddVideos,required TResult Function( NavigateToAddQuizGame value)  navigateToAddQuizGame,required TResult Function( NavigateToAddBirthdayCalendar value)  navigateToAddBirthdayCalendar,required TResult Function( NavigateToAddBirthdaySurprise value)  navigateToAddBirthdaySurprise,required TResult Function( NavigateToAddWishesList value)  navigateToAddWishesList,required TResult Function( NavigateToAddMemoryGame value)  navigateToAddMemoryGame,required TResult Function( NavigateToAddTimeCapsule value)  navigateToAddTimeCapsule,required TResult Function( NavigateToAddBabyLetter value)  navigateToAddBabyLetter,required TResult Function( NavigateToAddParentStats value)  navigateToAddParentStats,required TResult Function( NavigateToAddMilestones value)  navigateToAddMilestones,required TResult Function( NavigateToAddLookAlike value)  navigateToAddLookAlike,required TResult Function( OpenEditAgain value)  openEditAgain,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case ErrorMessage():
return errorMessage(_that);case OpenAddDialog():
return openAddDialog(_that);case NavigateToAddText():
return navigateToAddText(_that);case NavigateToAddPictures():
return navigateToAddPictures(_that);case NavigateToAddVideos():
return navigateToAddVideos(_that);case NavigateToAddQuizGame():
return navigateToAddQuizGame(_that);case NavigateToAddBirthdayCalendar():
return navigateToAddBirthdayCalendar(_that);case NavigateToAddBirthdaySurprise():
return navigateToAddBirthdaySurprise(_that);case NavigateToAddWishesList():
return navigateToAddWishesList(_that);case NavigateToAddMemoryGame():
return navigateToAddMemoryGame(_that);case NavigateToAddTimeCapsule():
return navigateToAddTimeCapsule(_that);case NavigateToAddBabyLetter():
return navigateToAddBabyLetter(_that);case NavigateToAddParentStats():
return navigateToAddParentStats(_that);case NavigateToAddMilestones():
return navigateToAddMilestones(_that);case NavigateToAddLookAlike():
return navigateToAddLookAlike(_that);case OpenEditAgain():
return openEditAgain(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( ErrorMessage value)?  errorMessage,TResult? Function( OpenAddDialog value)?  openAddDialog,TResult? Function( NavigateToAddText value)?  navigateToAddText,TResult? Function( NavigateToAddPictures value)?  navigateToAddPictures,TResult? Function( NavigateToAddVideos value)?  navigateToAddVideos,TResult? Function( NavigateToAddQuizGame value)?  navigateToAddQuizGame,TResult? Function( NavigateToAddBirthdayCalendar value)?  navigateToAddBirthdayCalendar,TResult? Function( NavigateToAddBirthdaySurprise value)?  navigateToAddBirthdaySurprise,TResult? Function( NavigateToAddWishesList value)?  navigateToAddWishesList,TResult? Function( NavigateToAddMemoryGame value)?  navigateToAddMemoryGame,TResult? Function( NavigateToAddTimeCapsule value)?  navigateToAddTimeCapsule,TResult? Function( NavigateToAddBabyLetter value)?  navigateToAddBabyLetter,TResult? Function( NavigateToAddParentStats value)?  navigateToAddParentStats,TResult? Function( NavigateToAddMilestones value)?  navigateToAddMilestones,TResult? Function( NavigateToAddLookAlike value)?  navigateToAddLookAlike,TResult? Function( OpenEditAgain value)?  openEditAgain,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case OpenAddDialog() when openAddDialog != null:
return openAddDialog(_that);case NavigateToAddText() when navigateToAddText != null:
return navigateToAddText(_that);case NavigateToAddPictures() when navigateToAddPictures != null:
return navigateToAddPictures(_that);case NavigateToAddVideos() when navigateToAddVideos != null:
return navigateToAddVideos(_that);case NavigateToAddQuizGame() when navigateToAddQuizGame != null:
return navigateToAddQuizGame(_that);case NavigateToAddBirthdayCalendar() when navigateToAddBirthdayCalendar != null:
return navigateToAddBirthdayCalendar(_that);case NavigateToAddBirthdaySurprise() when navigateToAddBirthdaySurprise != null:
return navigateToAddBirthdaySurprise(_that);case NavigateToAddWishesList() when navigateToAddWishesList != null:
return navigateToAddWishesList(_that);case NavigateToAddMemoryGame() when navigateToAddMemoryGame != null:
return navigateToAddMemoryGame(_that);case NavigateToAddTimeCapsule() when navigateToAddTimeCapsule != null:
return navigateToAddTimeCapsule(_that);case NavigateToAddBabyLetter() when navigateToAddBabyLetter != null:
return navigateToAddBabyLetter(_that);case NavigateToAddParentStats() when navigateToAddParentStats != null:
return navigateToAddParentStats(_that);case NavigateToAddMilestones() when navigateToAddMilestones != null:
return navigateToAddMilestones(_that);case NavigateToAddLookAlike() when navigateToAddLookAlike != null:
return navigateToAddLookAlike(_that);case OpenEditAgain() when openEditAgain != null:
return openEditAgain(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EventModel? event)?  initial,TResult Function( EventModel? event,  String? text)?  loading,TResult Function( EventModel? event)?  loaded,TResult Function( EventModel? event,  AppErrorType errorType)?  errorMessage,TResult Function( EventModel? event)?  openAddDialog,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddText,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddPictures,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddVideos,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddQuizGame,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddBirthdayCalendar,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddBirthdaySurprise,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddWishesList,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddMemoryGame,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddTimeCapsule,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddBabyLetter,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddParentStats,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddMilestones,TResult Function( EventModel? event,  CategoryModel category)?  navigateToAddLookAlike,TResult Function( EventModel? event,  CategoryModel category)?  openEditAgain,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.event);case Loading() when loading != null:
return loading(_that.event,_that.text);case Loaded() when loaded != null:
return loaded(_that.event);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.event,_that.errorType);case OpenAddDialog() when openAddDialog != null:
return openAddDialog(_that.event);case NavigateToAddText() when navigateToAddText != null:
return navigateToAddText(_that.event,_that.category);case NavigateToAddPictures() when navigateToAddPictures != null:
return navigateToAddPictures(_that.event,_that.category);case NavigateToAddVideos() when navigateToAddVideos != null:
return navigateToAddVideos(_that.event,_that.category);case NavigateToAddQuizGame() when navigateToAddQuizGame != null:
return navigateToAddQuizGame(_that.event,_that.category);case NavigateToAddBirthdayCalendar() when navigateToAddBirthdayCalendar != null:
return navigateToAddBirthdayCalendar(_that.event,_that.category);case NavigateToAddBirthdaySurprise() when navigateToAddBirthdaySurprise != null:
return navigateToAddBirthdaySurprise(_that.event,_that.category);case NavigateToAddWishesList() when navigateToAddWishesList != null:
return navigateToAddWishesList(_that.event,_that.category);case NavigateToAddMemoryGame() when navigateToAddMemoryGame != null:
return navigateToAddMemoryGame(_that.event,_that.category);case NavigateToAddTimeCapsule() when navigateToAddTimeCapsule != null:
return navigateToAddTimeCapsule(_that.event,_that.category);case NavigateToAddBabyLetter() when navigateToAddBabyLetter != null:
return navigateToAddBabyLetter(_that.event,_that.category);case NavigateToAddParentStats() when navigateToAddParentStats != null:
return navigateToAddParentStats(_that.event,_that.category);case NavigateToAddMilestones() when navigateToAddMilestones != null:
return navigateToAddMilestones(_that.event,_that.category);case NavigateToAddLookAlike() when navigateToAddLookAlike != null:
return navigateToAddLookAlike(_that.event,_that.category);case OpenEditAgain() when openEditAgain != null:
return openEditAgain(_that.event,_that.category);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EventModel? event)  initial,required TResult Function( EventModel? event,  String? text)  loading,required TResult Function( EventModel? event)  loaded,required TResult Function( EventModel? event,  AppErrorType errorType)  errorMessage,required TResult Function( EventModel? event)  openAddDialog,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddText,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddPictures,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddVideos,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddQuizGame,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddBirthdayCalendar,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddBirthdaySurprise,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddWishesList,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddMemoryGame,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddTimeCapsule,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddBabyLetter,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddParentStats,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddMilestones,required TResult Function( EventModel? event,  CategoryModel category)  navigateToAddLookAlike,required TResult Function( EventModel? event,  CategoryModel category)  openEditAgain,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.event);case Loading():
return loading(_that.event,_that.text);case Loaded():
return loaded(_that.event);case ErrorMessage():
return errorMessage(_that.event,_that.errorType);case OpenAddDialog():
return openAddDialog(_that.event);case NavigateToAddText():
return navigateToAddText(_that.event,_that.category);case NavigateToAddPictures():
return navigateToAddPictures(_that.event,_that.category);case NavigateToAddVideos():
return navigateToAddVideos(_that.event,_that.category);case NavigateToAddQuizGame():
return navigateToAddQuizGame(_that.event,_that.category);case NavigateToAddBirthdayCalendar():
return navigateToAddBirthdayCalendar(_that.event,_that.category);case NavigateToAddBirthdaySurprise():
return navigateToAddBirthdaySurprise(_that.event,_that.category);case NavigateToAddWishesList():
return navigateToAddWishesList(_that.event,_that.category);case NavigateToAddMemoryGame():
return navigateToAddMemoryGame(_that.event,_that.category);case NavigateToAddTimeCapsule():
return navigateToAddTimeCapsule(_that.event,_that.category);case NavigateToAddBabyLetter():
return navigateToAddBabyLetter(_that.event,_that.category);case NavigateToAddParentStats():
return navigateToAddParentStats(_that.event,_that.category);case NavigateToAddMilestones():
return navigateToAddMilestones(_that.event,_that.category);case NavigateToAddLookAlike():
return navigateToAddLookAlike(_that.event,_that.category);case OpenEditAgain():
return openEditAgain(_that.event,_that.category);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EventModel? event)?  initial,TResult? Function( EventModel? event,  String? text)?  loading,TResult? Function( EventModel? event)?  loaded,TResult? Function( EventModel? event,  AppErrorType errorType)?  errorMessage,TResult? Function( EventModel? event)?  openAddDialog,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddText,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddPictures,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddVideos,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddQuizGame,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddBirthdayCalendar,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddBirthdaySurprise,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddWishesList,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddMemoryGame,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddTimeCapsule,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddBabyLetter,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddParentStats,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddMilestones,TResult? Function( EventModel? event,  CategoryModel category)?  navigateToAddLookAlike,TResult? Function( EventModel? event,  CategoryModel category)?  openEditAgain,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.event);case Loading() when loading != null:
return loading(_that.event,_that.text);case Loaded() when loaded != null:
return loaded(_that.event);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.event,_that.errorType);case OpenAddDialog() when openAddDialog != null:
return openAddDialog(_that.event);case NavigateToAddText() when navigateToAddText != null:
return navigateToAddText(_that.event,_that.category);case NavigateToAddPictures() when navigateToAddPictures != null:
return navigateToAddPictures(_that.event,_that.category);case NavigateToAddVideos() when navigateToAddVideos != null:
return navigateToAddVideos(_that.event,_that.category);case NavigateToAddQuizGame() when navigateToAddQuizGame != null:
return navigateToAddQuizGame(_that.event,_that.category);case NavigateToAddBirthdayCalendar() when navigateToAddBirthdayCalendar != null:
return navigateToAddBirthdayCalendar(_that.event,_that.category);case NavigateToAddBirthdaySurprise() when navigateToAddBirthdaySurprise != null:
return navigateToAddBirthdaySurprise(_that.event,_that.category);case NavigateToAddWishesList() when navigateToAddWishesList != null:
return navigateToAddWishesList(_that.event,_that.category);case NavigateToAddMemoryGame() when navigateToAddMemoryGame != null:
return navigateToAddMemoryGame(_that.event,_that.category);case NavigateToAddTimeCapsule() when navigateToAddTimeCapsule != null:
return navigateToAddTimeCapsule(_that.event,_that.category);case NavigateToAddBabyLetter() when navigateToAddBabyLetter != null:
return navigateToAddBabyLetter(_that.event,_that.category);case NavigateToAddParentStats() when navigateToAddParentStats != null:
return navigateToAddParentStats(_that.event,_that.category);case NavigateToAddMilestones() when navigateToAddMilestones != null:
return navigateToAddMilestones(_that.event,_that.category);case NavigateToAddLookAlike() when navigateToAddLookAlike != null:
return navigateToAddLookAlike(_that.event,_that.category);case OpenEditAgain() when openEditAgain != null:
return openEditAgain(_that.event,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements HomeState {
  const Initial(this.event);
  

@override final  EventModel? event;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);





@override
String toString() {
  return 'HomeState.initial(event: $event)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,}) {
  return _then(Initial(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class Loading implements HomeState {
  const Loading(this.event, {this.text});
  

@override final  EventModel? event;
 final  String? text;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);





@override
String toString() {
  return 'HomeState.loading(event: $event, text: $text)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, String? text
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? text = freezed,}) {
  return _then(Loading(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class Loaded implements HomeState {
  const Loaded(this.event);
  

@override final  EventModel? event;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);





@override
String toString() {
  return 'HomeState.loaded(event: $event)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,}) {
  return _then(Loaded(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class ErrorMessage implements HomeState {
  const ErrorMessage(this.event, this.errorType);
  

@override final  EventModel? event;
 final  AppErrorType errorType;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'HomeState.errorMessage(event: $event, errorType: $errorType)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, AppErrorType errorType
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? errorType = null,}) {
  return _then(ErrorMessage(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as AppErrorType,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class OpenAddDialog implements HomeState {
  const OpenAddDialog(this.event);
  

@override final  EventModel? event;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenAddDialogCopyWith<OpenAddDialog> get copyWith => _$OpenAddDialogCopyWithImpl<OpenAddDialog>(this, _$identity);





@override
String toString() {
  return 'HomeState.openAddDialog(event: $event)';
}


}

/// @nodoc
abstract mixin class $OpenAddDialogCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $OpenAddDialogCopyWith(OpenAddDialog value, $Res Function(OpenAddDialog) _then) = _$OpenAddDialogCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$OpenAddDialogCopyWithImpl<$Res>
    implements $OpenAddDialogCopyWith<$Res> {
  _$OpenAddDialogCopyWithImpl(this._self, this._then);

  final OpenAddDialog _self;
  final $Res Function(OpenAddDialog) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,}) {
  return _then(OpenAddDialog(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class NavigateToAddText implements HomeState {
  const NavigateToAddText(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddTextCopyWith<NavigateToAddText> get copyWith => _$NavigateToAddTextCopyWithImpl<NavigateToAddText>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddText(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddTextCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddTextCopyWith(NavigateToAddText value, $Res Function(NavigateToAddText) _then) = _$NavigateToAddTextCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddTextCopyWithImpl<$Res>
    implements $NavigateToAddTextCopyWith<$Res> {
  _$NavigateToAddTextCopyWithImpl(this._self, this._then);

  final NavigateToAddText _self;
  final $Res Function(NavigateToAddText) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddText(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddPictures implements HomeState {
  const NavigateToAddPictures(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddPicturesCopyWith<NavigateToAddPictures> get copyWith => _$NavigateToAddPicturesCopyWithImpl<NavigateToAddPictures>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddPictures(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddPicturesCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddPicturesCopyWith(NavigateToAddPictures value, $Res Function(NavigateToAddPictures) _then) = _$NavigateToAddPicturesCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddPicturesCopyWithImpl<$Res>
    implements $NavigateToAddPicturesCopyWith<$Res> {
  _$NavigateToAddPicturesCopyWithImpl(this._self, this._then);

  final NavigateToAddPictures _self;
  final $Res Function(NavigateToAddPictures) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddPictures(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddVideos implements HomeState {
  const NavigateToAddVideos(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddVideosCopyWith<NavigateToAddVideos> get copyWith => _$NavigateToAddVideosCopyWithImpl<NavigateToAddVideos>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddVideos(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddVideosCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddVideosCopyWith(NavigateToAddVideos value, $Res Function(NavigateToAddVideos) _then) = _$NavigateToAddVideosCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddVideosCopyWithImpl<$Res>
    implements $NavigateToAddVideosCopyWith<$Res> {
  _$NavigateToAddVideosCopyWithImpl(this._self, this._then);

  final NavigateToAddVideos _self;
  final $Res Function(NavigateToAddVideos) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddVideos(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddQuizGame implements HomeState {
  const NavigateToAddQuizGame(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddQuizGameCopyWith<NavigateToAddQuizGame> get copyWith => _$NavigateToAddQuizGameCopyWithImpl<NavigateToAddQuizGame>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddQuizGame(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddQuizGameCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddQuizGameCopyWith(NavigateToAddQuizGame value, $Res Function(NavigateToAddQuizGame) _then) = _$NavigateToAddQuizGameCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddQuizGameCopyWithImpl<$Res>
    implements $NavigateToAddQuizGameCopyWith<$Res> {
  _$NavigateToAddQuizGameCopyWithImpl(this._self, this._then);

  final NavigateToAddQuizGame _self;
  final $Res Function(NavigateToAddQuizGame) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddQuizGame(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddBirthdayCalendar implements HomeState {
  const NavigateToAddBirthdayCalendar(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddBirthdayCalendarCopyWith<NavigateToAddBirthdayCalendar> get copyWith => _$NavigateToAddBirthdayCalendarCopyWithImpl<NavigateToAddBirthdayCalendar>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddBirthdayCalendar(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddBirthdayCalendarCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddBirthdayCalendarCopyWith(NavigateToAddBirthdayCalendar value, $Res Function(NavigateToAddBirthdayCalendar) _then) = _$NavigateToAddBirthdayCalendarCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddBirthdayCalendarCopyWithImpl<$Res>
    implements $NavigateToAddBirthdayCalendarCopyWith<$Res> {
  _$NavigateToAddBirthdayCalendarCopyWithImpl(this._self, this._then);

  final NavigateToAddBirthdayCalendar _self;
  final $Res Function(NavigateToAddBirthdayCalendar) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddBirthdayCalendar(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddBirthdaySurprise implements HomeState {
  const NavigateToAddBirthdaySurprise(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddBirthdaySurpriseCopyWith<NavigateToAddBirthdaySurprise> get copyWith => _$NavigateToAddBirthdaySurpriseCopyWithImpl<NavigateToAddBirthdaySurprise>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddBirthdaySurprise(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddBirthdaySurpriseCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddBirthdaySurpriseCopyWith(NavigateToAddBirthdaySurprise value, $Res Function(NavigateToAddBirthdaySurprise) _then) = _$NavigateToAddBirthdaySurpriseCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddBirthdaySurpriseCopyWithImpl<$Res>
    implements $NavigateToAddBirthdaySurpriseCopyWith<$Res> {
  _$NavigateToAddBirthdaySurpriseCopyWithImpl(this._self, this._then);

  final NavigateToAddBirthdaySurprise _self;
  final $Res Function(NavigateToAddBirthdaySurprise) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddBirthdaySurprise(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddWishesList implements HomeState {
  const NavigateToAddWishesList(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddWishesListCopyWith<NavigateToAddWishesList> get copyWith => _$NavigateToAddWishesListCopyWithImpl<NavigateToAddWishesList>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddWishesList(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddWishesListCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddWishesListCopyWith(NavigateToAddWishesList value, $Res Function(NavigateToAddWishesList) _then) = _$NavigateToAddWishesListCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddWishesListCopyWithImpl<$Res>
    implements $NavigateToAddWishesListCopyWith<$Res> {
  _$NavigateToAddWishesListCopyWithImpl(this._self, this._then);

  final NavigateToAddWishesList _self;
  final $Res Function(NavigateToAddWishesList) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddWishesList(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddMemoryGame implements HomeState {
  const NavigateToAddMemoryGame(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddMemoryGameCopyWith<NavigateToAddMemoryGame> get copyWith => _$NavigateToAddMemoryGameCopyWithImpl<NavigateToAddMemoryGame>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddMemoryGame(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddMemoryGameCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddMemoryGameCopyWith(NavigateToAddMemoryGame value, $Res Function(NavigateToAddMemoryGame) _then) = _$NavigateToAddMemoryGameCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddMemoryGameCopyWithImpl<$Res>
    implements $NavigateToAddMemoryGameCopyWith<$Res> {
  _$NavigateToAddMemoryGameCopyWithImpl(this._self, this._then);

  final NavigateToAddMemoryGame _self;
  final $Res Function(NavigateToAddMemoryGame) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddMemoryGame(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddTimeCapsule implements HomeState {
  const NavigateToAddTimeCapsule(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddTimeCapsuleCopyWith<NavigateToAddTimeCapsule> get copyWith => _$NavigateToAddTimeCapsuleCopyWithImpl<NavigateToAddTimeCapsule>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddTimeCapsule(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddTimeCapsuleCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddTimeCapsuleCopyWith(NavigateToAddTimeCapsule value, $Res Function(NavigateToAddTimeCapsule) _then) = _$NavigateToAddTimeCapsuleCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddTimeCapsuleCopyWithImpl<$Res>
    implements $NavigateToAddTimeCapsuleCopyWith<$Res> {
  _$NavigateToAddTimeCapsuleCopyWithImpl(this._self, this._then);

  final NavigateToAddTimeCapsule _self;
  final $Res Function(NavigateToAddTimeCapsule) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddTimeCapsule(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddBabyLetter implements HomeState {
  const NavigateToAddBabyLetter(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddBabyLetterCopyWith<NavigateToAddBabyLetter> get copyWith => _$NavigateToAddBabyLetterCopyWithImpl<NavigateToAddBabyLetter>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddBabyLetter(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddBabyLetterCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddBabyLetterCopyWith(NavigateToAddBabyLetter value, $Res Function(NavigateToAddBabyLetter) _then) = _$NavigateToAddBabyLetterCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddBabyLetterCopyWithImpl<$Res>
    implements $NavigateToAddBabyLetterCopyWith<$Res> {
  _$NavigateToAddBabyLetterCopyWithImpl(this._self, this._then);

  final NavigateToAddBabyLetter _self;
  final $Res Function(NavigateToAddBabyLetter) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddBabyLetter(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddParentStats implements HomeState {
  const NavigateToAddParentStats(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddParentStatsCopyWith<NavigateToAddParentStats> get copyWith => _$NavigateToAddParentStatsCopyWithImpl<NavigateToAddParentStats>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddParentStats(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddParentStatsCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddParentStatsCopyWith(NavigateToAddParentStats value, $Res Function(NavigateToAddParentStats) _then) = _$NavigateToAddParentStatsCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddParentStatsCopyWithImpl<$Res>
    implements $NavigateToAddParentStatsCopyWith<$Res> {
  _$NavigateToAddParentStatsCopyWithImpl(this._self, this._then);

  final NavigateToAddParentStats _self;
  final $Res Function(NavigateToAddParentStats) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddParentStats(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddMilestones implements HomeState {
  const NavigateToAddMilestones(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddMilestonesCopyWith<NavigateToAddMilestones> get copyWith => _$NavigateToAddMilestonesCopyWithImpl<NavigateToAddMilestones>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddMilestones(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddMilestonesCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddMilestonesCopyWith(NavigateToAddMilestones value, $Res Function(NavigateToAddMilestones) _then) = _$NavigateToAddMilestonesCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddMilestonesCopyWithImpl<$Res>
    implements $NavigateToAddMilestonesCopyWith<$Res> {
  _$NavigateToAddMilestonesCopyWithImpl(this._self, this._then);

  final NavigateToAddMilestones _self;
  final $Res Function(NavigateToAddMilestones) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddMilestones(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class NavigateToAddLookAlike implements HomeState {
  const NavigateToAddLookAlike(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToAddLookAlikeCopyWith<NavigateToAddLookAlike> get copyWith => _$NavigateToAddLookAlikeCopyWithImpl<NavigateToAddLookAlike>(this, _$identity);





@override
String toString() {
  return 'HomeState.navigateToAddLookAlike(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $NavigateToAddLookAlikeCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $NavigateToAddLookAlikeCopyWith(NavigateToAddLookAlike value, $Res Function(NavigateToAddLookAlike) _then) = _$NavigateToAddLookAlikeCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$NavigateToAddLookAlikeCopyWithImpl<$Res>
    implements $NavigateToAddLookAlikeCopyWith<$Res> {
  _$NavigateToAddLookAlikeCopyWithImpl(this._self, this._then);

  final NavigateToAddLookAlike _self;
  final $Res Function(NavigateToAddLookAlike) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(NavigateToAddLookAlike(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class OpenEditAgain implements HomeState {
  const OpenEditAgain(this.event, this.category);
  

@override final  EventModel? event;
 final  CategoryModel category;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenEditAgainCopyWith<OpenEditAgain> get copyWith => _$OpenEditAgainCopyWithImpl<OpenEditAgain>(this, _$identity);





@override
String toString() {
  return 'HomeState.openEditAgain(event: $event, category: $category)';
}


}

/// @nodoc
abstract mixin class $OpenEditAgainCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $OpenEditAgainCopyWith(OpenEditAgain value, $Res Function(OpenEditAgain) _then) = _$OpenEditAgainCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, CategoryModel category
});


@override $EventModelCopyWith<$Res>? get event;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$OpenEditAgainCopyWithImpl<$Res>
    implements $OpenEditAgainCopyWith<$Res> {
  _$OpenEditAgainCopyWithImpl(this._self, this._then);

  final OpenEditAgain _self;
  final $Res Function(OpenEditAgain) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? category = null,}) {
  return _then(OpenEditAgain(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
