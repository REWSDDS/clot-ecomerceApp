import 'package:get_storage/get_storage.dart';

class LocalDbService {
  static GetStorage getStorageIntance = GetStorage();

  static String nameKey = 'name';

  static void saveData({required String key, required dynamic value}) {
    getStorageIntance.write(key, value);
  }

  static void removeData() {
    getStorageIntance.erase();
  }
}
