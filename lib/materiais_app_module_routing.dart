import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_dependencies/flutter_dependencies.dart';
import 'package:materiais_app/materiais_app_module.dart';
import 'package:materiais_app/presentation/views/views.dart';
import 'package:pcp/pcp.dart';

abstract class MateriaisAppModuleRouting {
  static const BasePath root = BasePath('/');
  static const BasePath login = BasePath('/login');

  static List<ModularRoute> get routes => [
        ChildRoute(root.path,
            child: (_, args) => MateriaisHomePage(), guards: [LoginGuard()]),
        ChildRoute(login.path,
            child: (context, args) => LoginPage(
                  productLogo:
                      'https://s3.sa-east-1.amazonaws.com/imagens.nasajon/logos/sistemas-web/versao-padrao/icone-mais-nome/nova-marca/logo-padrao_meu-trabalho_icone-nome.svg',
                  buttonColor: Theme.of(context).primaryColor,
                  loadingURL:
                      'https://s3.sa-east-1.amazonaws.com/imagens.nasajon/geral/sistemas/departamento-pessoal-e-recursos-humanos/loader/loader_meu-trabalho.gif',
                  tokenURL:
                      'https://auth.dev.nasajonsistemas.com.br/auth/realms/DEV/protocol/openid-connect/token',
                  profileURL:
                      'https://estoqueapi.nasajonsistemas.com.br/profile',
                  clientId: 'pcp_api',
                  clientSecret: 's3S4jow4RXsk84QkyOBuuOdOy0c8URVI',
                  accessGranted: () => Nav.navigate(root.path),
                )),
        ModuleRoute(
          PcpRouting.root.path,
          module: PcpModule(),
          guards: [LoginGuard(), AsyncBindsGuard()],
        ),
      ];
}

class LoginGuard extends RouteGuard {
  LoginGuard() : super(redirectTo: MateriaisAppModuleRouting.login.path);

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return LoginSessionRepository.accessToken != null &&
        LoginSessionRepository.accessToken!.isNotEmpty;
  }
}

class AsyncBindsGuard extends RouteGuard {
  AsyncBindsGuard() : super();

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<MateriaisAppModule>();

    return true;
  }
}
