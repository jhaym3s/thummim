import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferencesManager {
  static SharedPreferences? _prefs;
  //==================================================
  // If _prefs is null
  static Future<SharedPreferences> get _prefInstance async =>
      _prefs ?? (await SharedPreferences.getInstance());

  // Call this during the start of your app so that we can get
  // the pref instance once and use the same each time
  static Future<SharedPreferences> init() async {
    _prefs = await _prefInstance;
    return _prefs!;
  }

  //==================================================
  static String getString(String? strKey) {
    String strValue = '';
    if (_prefs!.getString(strKey!) != null) {
      strValue = _prefs!.getString(strKey)!;
    }
    return strValue;
  }

  static void setString(String? strKey, String? strValue) {
    if (strKey != null && strValue != null) {
      _prefs!.setString(strKey, strValue);
    }
  }

  //==================================================
  static int getInt(String? strKey) {
    int nValue = -1;
    if (strKey != null) {
      nValue = _prefs!.getInt(strKey)!;
    }
    return nValue;
  }

  static void setInt(String? strKey, int nValue) {
    if (strKey != null) {
      _prefs!.setInt(strKey, nValue);
    }
  }

  //==================================================
  static double getDouble(String? strKey) {
    double dValue = -1;
    if (strKey != null) {
      dValue = _prefs!.getDouble(strKey)!;
    }
    return dValue;
  }

  static void setDouble(String? strKey, double dValue) {
    if (strKey != null) {
      _prefs!.setDouble(strKey, dValue);
    }
  }

  //==================================================
  static bool getBool(String? strKey) {
    bool bValue = false;
    if (strKey != null) {
      bValue = _prefs!.getBool(strKey) ?? true;
    }
    return bValue;
  }

  static void setBool(String? strKey, bool bValue) {
    if (strKey != null) {
      _prefs!.setBool(strKey, bValue);
    }
  }

  //==================================================
  static List<String> getStringList(String? strKey) {
    List<String> listOfValue = [];
    if (strKey != null) {
      listOfValue = _prefs!.getStringList(strKey)!;
    }
    return listOfValue;
  }

  static void setStringList(String? strKey, List<String> listOfValue) {
    if (strKey != null) {
      _prefs!.setStringList(strKey, listOfValue);
    }
  }

  //==================================================
  static Object get(String? strKey) {
    Object obj = false;
    if (strKey != null) {
      obj = _prefs!.get(strKey)!;
    }
    return obj;
  }
  //==================================================
}