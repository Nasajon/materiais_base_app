import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_dependencies/flutter_dependencies.dart';
import 'package:materiais_app/app_configuration.dart';

class MateriaisAppBindings {
  static List<Bind> get binds => [
        Bind.lazySingleton<Environment>((_) => AppConfiguration.environment),
        Bind<AppColorScheme>((_) => baseColorScheme),
        ..._infrastructure,
        ..._datasources,
        ..._repositories,
        ..._usecases,
        ..._viewModels,
      ];

  static List<Bind> get _infrastructure => [];

  static List<Bind> get _datasources => [];

  static List<Bind> get _repositories => [];

  static List<Bind> get _usecases => [];

  static List<Bind> get _viewModels => [];
}
