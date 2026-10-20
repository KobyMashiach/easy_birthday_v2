import 'dart:io';

import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class UploadMediaUseCase {
  final EventRepository repository;
  UploadMediaUseCase(this.repository);

  Future<String> call({
    required String folder,
    required File file,
    String? fileName,
  }) => repository.uploadMedia(folder: folder, file: file, fileName: fileName);
}
