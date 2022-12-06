import 'package:flutter_core/flutter_core.dart';

import 'i18n.g.dart';

class MateriaisI18n extends Translation<I18nPt> {
  late final AppLocale _appLocale;

  MateriaisI18n() : _appLocale = AppLocaleUtils.findDeviceLocale();

  @override
  I18nPt get translations => _appLocale.build();
}

final tr = MateriaisI18n().translations;
