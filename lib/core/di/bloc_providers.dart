import 'package:easy_birthday/core/di/app_dependencies.dart';
import 'package:provider/single_child_widget.dart';

/// App-wide blocs. Screen-scoped blocs are provided by their pages with
/// `XxxBloc.fromContext(context)`.
List<SingleChildWidget> buildBlocProviders(AppDependencies deps) {
  return [];
}
