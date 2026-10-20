import 'package:easy_birthday/features/wear_os/data/datasources/wear_os_local_data_source.dart';
import 'package:easy_birthday/features/wear_os/data/datasources/wear_os_phone_data_source.dart';
import 'package:easy_birthday/features/wear_os/data/models/phone_login_reply.dart';
import 'package:easy_birthday/features/wear_os/domain/repositories/wear_os_repository.dart';

class WearOsRepositoryImpl implements WearOsRepository {
  final WearOsLocalDataSource localDataSource;
  final WearOsPhoneDataSource phoneDataSource;

  WearOsRepositoryImpl({
    required this.localDataSource,
    WearOsPhoneDataSource? phoneDataSource,
  }) : phoneDataSource = phoneDataSource ?? WearOsPhoneDataSourceImpl();

  @override
  String? getSavedEventId() => localDataSource.getSavedEventId();

  @override
  Future<void> saveEventId(String eventId) =>
      localDataSource.saveEventId(eventId);

  @override
  Future<void> clearEventId() => localDataSource.clearEventId();

  @override
  Stream<PhoneLoginReply> watchPhoneLoginReplies() =>
      phoneDataSource.loginResponses.map(PhoneLoginReply.fromMessage);

  @override
  Future<void> sendPhoneLoginRequest() => phoneDataSource.sendLoginRequest();
}
