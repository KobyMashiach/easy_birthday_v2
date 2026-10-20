import 'package:easy_birthday/features/category_editor/data/datasources/greeting_remote_data_source.dart';
import 'package:easy_birthday/features/category_editor/domain/repositories/greeting_repository.dart';

class GreetingRepositoryImpl implements GreetingRepository {
  final GreetingRemoteDataSource remoteDataSource;

  GreetingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> generateGreeting(String prompt) =>
      remoteDataSource.generateGreeting(prompt);
}
