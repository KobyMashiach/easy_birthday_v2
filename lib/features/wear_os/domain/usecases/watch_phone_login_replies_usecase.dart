import 'package:easy_birthday/features/wear_os/data/models/phone_login_reply.dart';
import 'package:easy_birthday/features/wear_os/domain/repositories/wear_os_repository.dart';

class WatchPhoneLoginRepliesUseCase {
  final WearOsRepository repository;
  WatchPhoneLoginRepliesUseCase(this.repository);

  Stream<PhoneLoginReply> call() => repository.watchPhoneLoginReplies();
}
