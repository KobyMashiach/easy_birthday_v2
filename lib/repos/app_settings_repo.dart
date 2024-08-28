import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/models/app_settings_model/app_settings_model.dart';

class AppSettingsRepo {
  AppSettingsRepo(this.localDB);
  // final collection =
  //     FirebaseFirestore.instance.collection('all_lists_and_maps');
  final AppSettingsDataSource localDB;

  AppSettingsModel getAppSettings() {
    return localDB.getAppSettings();
  }

  Future<void> updateAppSettings(AppSettingsModel appSettings) async {
    await localDB.updateAppSettings(appSettings: appSettings);
  }

  // Future<List<dynamic>> getAllData() async {
  // final lastUpdateDB = localDB.getLastUpdate();
  // final lastUpdateFS =
  //     (await firestoreGetDataFromDoc(collection, 'last_update', "lastUpdate"))
  //         .toDate();
  // if (lastUpdateDB == null || !lastUpdateDB.isAtSameMomentAs(lastUpdateFS)) {
  //   QuerySnapshot querySnapshot = await collection.get();
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   localDB.saveAllData(allData);

  //   return allData;
  // } else {
  //   return localDB.getAllData();
  // }
  // }
}
