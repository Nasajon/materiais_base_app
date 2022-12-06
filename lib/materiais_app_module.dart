import 'package:flutter_dependencies/flutter_dependencies.dart';
import 'package:materiais_app/materiais_app_bindings.dart';
import 'package:materiais_app/materiais_app_module_routing.dart';

class MateriaisAppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = MateriaisAppBindings.binds;

  @override
  final List<ModularRoute> routes = MateriaisAppModuleRouting.routes;
}
