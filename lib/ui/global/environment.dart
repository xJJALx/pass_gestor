import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class Environment {
  static String apiUrl = kIsWeb || Platform.isAndroid ? 'http://10.0.2.2:3000/api' : 'http://localhost:3000/api';
  static String socketUrl = kIsWeb || Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';
}
