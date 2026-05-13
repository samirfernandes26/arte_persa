import 'package:device_client_information/device_client_information.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:fp/fp.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum MenuItem {
  painel,
  gamificacao,
  gamificacaoColecao,
  sincronizacao,
  erros,
  mapa,
  cidadaos,
  logradouros,
  escalaRisco,
  visitas,
  relatorios,
  central,
  sobre,
  manutencao,
}

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key, this.menuSelected});

  final MenuItem? menuSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remoteConfig = FirebaseRemoteConfig.instance;

    List<Menu> menus = [
      Menu(
        label: 'home',
        icon: Icons.dashboard,
        enabled: remoteConfig.getBool('painel'),
        selected: menuSelected == MenuItem.painel,
        onTap: () async {
          if (menuSelected == MenuItem.painel) return;
          await navigate(
            navigator: context.navigator,
            routeName: RouteGeneratorKeys.painel,
          );
        },
      ),
    ];

    return ref
        .watch(getMeProvider)
        .maybeWhen(
          data: (userLogged) => Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(child: _renderUserInfo(userLogged, context)),
                Expanded(
                  child: ListView(
                    children: [
                      ...menus
                          .where((menu) => menu.enabled == true)
                          .map(
                            (menu) => _renderMenuItem(
                              context: context,
                              label: menu.label,
                              icon: menu.icon,
                              selected: menu.selected ?? false,
                              onTap: menu.onTap,
                            ),
                          ),
                    ],
                  ),
                ),
                _renderMenuItem(
                  context: context,
                  selected: false,
                  label: 'Sair',
                  icon: Icons.logout,
                  onTap: () async {
                    bool? result = await showDialog<bool>(
                      context: context,
                      builder: (context) => ConfirmacaoDialog(
                        title: 'Atenção!',
                        description: 'Deseja realmente sair do aplicativo?',
                        onPressedConfirmation: () {
                          context.navigator.pop(true);
                        },
                        onPressedNegation: () {
                          context.navigator.pop(false);
                        },
                      ),
                    );
                    if (result == true && context.mounted) {
                      final response = await ref
                          .read(logoutServiceProvider)
                          .execute();

                      if (response.left is ServiceException &&
                          context.mounted) {
                        return Messages.showErrors(
                          'Não foi possível se desconectar.',
                          context,
                        );
                      }

                      if (context.mounted) {
                        Messages.showSuccess(
                          'Desconectado com sucesso.',
                          context,
                        );
                      }

                      if (context.mounted) {
                        navigate(
                          navigator: context.navigator,
                          routeName: RouteGeneratorKeys.authLogin,
                        );
                      }
                    }
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: DeviceClientInformation.getInformation(),
                    builder: (context, snapshot) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VERSÃO: ${snapshot.data?.applicationVersion ?? 'Carregando...'}',
                          overflow: TextOverflow.ellipsis,
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Device ID: ${snapshot.data?.deviceId ?? 'Carregando...'}',
                          overflow: TextOverflow.ellipsis,
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          orElse: () => const AppLoader(),
        );
  }

  Column _renderUserInfo(UserModel userLogged, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userLogged.nome,
                    overflow: TextOverflow.ellipsis,
                    style: context.theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'OCUPAÇÃO: ${userLogged.ocupacao.toUpperCase()}',
          // overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: context.theme.textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'UBS: ${userLogged.unidade}',
          // overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: context.theme.textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'EQUIPE: ${userLogged.equipe}',
          // overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: context.theme.textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  ListTile _renderMenuItem({
    required BuildContext context,
    required String label,
    required IconData icon,
    void Function()? onTap,
    bool selected = false,
  }) {
    return ListTile(
      selected: selected,
      leading: Icon(icon, color: context.theme.colorScheme.onPrimary),
      title: Text(
        label,
        style: context.theme.textTheme.titleMedium?.copyWith(
          color: context.theme.colorScheme.onPrimary,
          fontWeight: selected ? FontWeight.w700 : FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }

  Future<void> navigate({
    required NavigatorState navigator,
    required String routeName,
  }) => navigator.pushNamedAndRemoveUntil(routeName, (route) => false);
}

class Menu {
  String label;

  IconData icon;

  bool? selected = false;

  void Function()? onTap;

  bool enabled;

  Menu({
    required this.label,
    required this.icon,
    required this.enabled,
    this.onTap,
    this.selected,
  });
}
