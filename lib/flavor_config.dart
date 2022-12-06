import 'package:flutter_core/flutter_core.dart';

class FlavorConfig {
  static Flavor? appFlavor;

  /// Returns a tittle associated with the current [Flavor]
  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Materiais dev';
      case Flavor.hml:
        return 'Materiais hml';
      case Flavor.prod:
        return 'Materiais';
      default:
        return 'Materiais';
    }
  }
}
