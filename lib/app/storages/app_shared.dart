import 'dart:convert';

import 'package:romance_quotes/domain/model/quotes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageKey {
  static const prefsKeyFavorites = "PREFS_KEY_Favorites";
}

class AppShared {
  static SharedPreferences? share;

  static Future<SharedPreferences?> init() async {
    share ??= await SharedPreferences.getInstance();
    return share;
  }
}

class AppPreferences {
  static AppPreferences? _instance;

  AppPreferences._();

  static AppPreferences get instance => _instance ??= AppPreferences._();

  Future<void> saveFavorites(Quotes quotes) async {
    // Lấy danh sách chuỗi từ SharedPreferences
    final List<String>? quotesJsonList =
        AppShared.share?.getStringList(StorageKey.prefsKeyFavorites);

    // Chuyển đối tượng Quotes thành chuỗi JSON trước khi lưu
    final String quotesJson = jsonEncode(quotes.toJson());

    // Thêm chuỗi JSON mới vào danh sách
    quotesJsonList?.add(quotesJson);

    // Lưu danh sách mới vào SharedPreferences
    await AppShared.share
        ?.setStringList(StorageKey.prefsKeyFavorites, quotesJsonList ?? []);
  }

  List<Quotes> getFavorites() {
    // Lấy danh sách chuỗi từ SharedPreferences
    final List<String>? quotesJsonList =
        AppShared.share?.getStringList(StorageKey.prefsKeyFavorites);
    // Kiểm tra xem danh sách có tồn tại không
    if (quotesJsonList != null) {
      // Chuyển đổi mỗi chuỗi JSON thành đối tượng Quotes
      return quotesJsonList
          .map((json) => Quotes.fromJson(jsonDecode(json)))
          .toList();
    } else {
      // Nếu danh sách không tồn tại, trả về một danh sách rỗng
      return [];
    }
  }

  Future<void> deleteAllFavorites() async {
    // Xóa toàn bộ danh sách quotes từ SharedPreferences
    AppShared.share?.remove(StorageKey.prefsKeyFavorites);
  }
}
