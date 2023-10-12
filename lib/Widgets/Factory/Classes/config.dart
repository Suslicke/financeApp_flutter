import 'dart:io';

import 'package:finance/Widgets/Factory/Classes/android_factory.dart';
import 'package:finance/Widgets/Factory/Classes/ios_factory.dart';

import '../Interfaces/abstract_factory.dart';

class Config {
  static Config? _instance;
  Factory? _factory;

  Config.init() {
    if (Platform.isAndroid) {
      _factory = AndroidFactory();
    } else if (Platform.isIOS) {
      _factory = IOSFactory();
    } else {
      _factory = null;
    }
  }

  Factory? get getFactory => _factory;

  factory Config() {
    _instance ??= Config.init();
    return _instance!;
  }
}
