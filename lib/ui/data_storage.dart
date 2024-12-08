import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  static const String productInfoKey = 'product_information';

  static Future<void> saveProductInformation(
      List<Map<String, dynamic>> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(productInfoKey, jsonEncode(data));
  }

  static Future<List<Map<String, dynamic>>?> getProductInformation() async {
    final prefs = await SharedPreferences.getInstance();
    final dataString = prefs.getString(productInfoKey);

    if (dataString != null) {
      final List<dynamic> decodedList = jsonDecode(dataString);
      return decodedList.map((e) => Map<String, dynamic>.from(e)).toList();
    }
    return null;
  }

  static Future<bool> hasProductInformation() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(productInfoKey);
  }

  static Future<void> clearProductInformation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(productInfoKey);
  }

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

  static const String alternativesKey = 'alternatives_data';

  static Future<void> saveAlternatives(List<Map<String, dynamic>> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(alternativesKey, jsonEncode(data));
  }

  static Future<List<Map<String, dynamic>>?> getAlternatives() async {
    final prefs = await SharedPreferences.getInstance();
    final dataString = prefs.getString(alternativesKey);

    if (dataString != null) {
      final dataList = jsonDecode(dataString) as List;
      return dataList.map((e) => Map<String, dynamic>.from(e)).toList();
    }
    return null;
  }

  static Future<bool> hasAlternatives() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(alternativesKey);
  }

  static Future<void> clearAlternatives() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(alternativesKey);
  }

  static Future<void> toggleAlternativeFavorite(
      String category, String alternativeName) async {
    final prefs = await SharedPreferences.getInstance();
    final data = await getAlternatives();

    if (data != null) {
      for (var categoryData in data) {
        if (categoryData.containsKey(category)) {
          final alternatives = categoryData[category] as Map<String, dynamic>;
          for (var altKey in alternatives.keys) {
            final alternativeData =
                alternatives[altKey] as Map<String, dynamic>;
            final items = alternativeData['items'] as List;

            for (var item in items) {
              if (item['name'] == alternativeName) {
                item['isFavorite'] = !(item['isFavorite'] ?? false);
                break;
              }
            }
          }
        }
      }

      await prefs.setString(alternativesKey, jsonEncode(data));
    }
  }
}
