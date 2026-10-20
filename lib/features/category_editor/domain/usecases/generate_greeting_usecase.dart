import 'package:easy_birthday/features/category_editor/domain/repositories/greeting_repository.dart';

class GenerateGreetingUseCase {
  final GreetingRepository repository;
  GenerateGreetingUseCase(this.repository);

  Future<String> call(String prompt) => repository.generateGreeting(prompt);
}
