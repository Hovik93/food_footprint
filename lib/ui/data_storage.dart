import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  static const String productInfoKey = 'product_information';

  /// Сохраняет данные в SharedPreferences
  static Future<void> saveProductInformation(
      List<Map<String, dynamic>> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(productInfoKey, jsonEncode(data));
  }

  /// Загружает данные из SharedPreferences
  static Future<List<Map<String, dynamic>>?> getProductInformation() async {
    final prefs = await SharedPreferences.getInstance();
    final dataString = prefs.getString(productInfoKey);

    if (dataString != null) {
      // Преобразуем строку в список карт
      final List<dynamic> decodedList = jsonDecode(dataString);
      return decodedList.map((e) => Map<String, dynamic>.from(e)).toList();
    }
    return null;
  }

  /// Проверяет, существуют ли данные в SharedPreferences
  static Future<bool> hasProductInformation() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(productInfoKey);
  }

  /// Удаляет данные из SharedPreferences
  static Future<void> clearProductInformation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(productInfoKey);
  }

  /// Изменяет состояние isFavorite для указанного продукта
  static Future<void> toggleFavorite(
      String category, String productName) async {
    final data = await getProductInformation();

    if (data != null) {
      final categoryIndex =
          data.indexWhere((categoryData) => categoryData.containsKey(category));
      if (categoryIndex != -1) {
        final categoryData = data[categoryIndex];
        final productDetails = categoryData[category][productName];
        if (productDetails != null) {
          final isFavorite = productDetails['isFavorite'] ?? false;
          productDetails['isFavorite'] = !isFavorite;
          await saveProductInformation(data); // Сохраняем обновленные данные
        }
      }
    }
  }
}
