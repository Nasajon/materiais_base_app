import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';

import 'app_configuration.dart';
import 'bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kDebugMode) {
  //   await FormDataService.delete();
  // }
  // await FormDataService.load();

  await AppConfiguration.loadFlavor(Flavor.prod);

  // runApp(const AppWidget());
  await bootstrap();
}
