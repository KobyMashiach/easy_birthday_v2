import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension NavigationX on BuildContext {
  /// Pops the current route when there is one to pop (no-op otherwise).
  void popIfPossible<T extends Object?>([T? result]) {
    if (canPop()) pop(result);
  }
}
