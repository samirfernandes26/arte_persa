import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDrawer extends ConsumerStatefulWidget {
  const CustomDrawer({super.key, required this.currentPage});

  final int currentPage;

  @override
  ConsumerState<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends ConsumerState<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    // final getMe = ref.watch(getMeProvider);

    return Drawer(
      backgroundColor: Colors.grey.shade900,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 48,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Image(
                        image: AssetImage(
                          ImagesConstants.artePersaLogo,
                        ),
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Samir Fernande de Lima',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Perfil: Adiministrador',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider()
              ],
            ),
          ),
          ListTile(
            selected: widget.currentPage == 0,
            leading: const Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            title: const Text(
              'Painel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteGeneratorKeys.home, (route) => false);
            },
          ),
          ListTile(
            selected: widget.currentPage == 1,
            leading: const Icon(
              Icons.person_add_sharp,
              color: Colors.white,
            ),
            title: const Text(
              'Cadastrar Cliente PF',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteGeneratorKeys.cadastroClientePf,
                (route) => false,
              );
            },
          ),
          ListTile(
            selected: widget.currentPage == 1,
            leading: const Icon(
              Icons.person_add_sharp,
              color: Colors.white,
            ),
            title: const Text(
              'Cadastrar Cliente PJ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteGeneratorKeys.cadastroClientePj,
                (route) => false,
              );
            },
          ),
          ListTile(
            selected: widget.currentPage == 2,
            leading: const Icon(
              // Icons.manage_accounts_sharp,
              Icons.manage_accounts_sharp,
              color: Colors.white,
            ),
            title: const Text(
              'Cadastrar usuario',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteGeneratorKeys.cadastrar,
                (route) => false,
              );
            },
          ),
          ListTile(
            selected: widget.currentPage == 3,
            leading: const Icon(
              Icons.note_add,
              color: Colors.white,
            ),
            title: const Text(
              'Cadastrar serviço',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteGeneratorKeys.cadastroServico,
                (route) => false,
              );
            },
          ),
          ListTile(
            selected: widget.currentPage == 4,
            leading: const Icon(
              Icons.assignment_add,
              color: Colors.white,
            ),
            title: const Text(
              'Nova Ordem de Serviço',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteGeneratorKeys.ordemDeServicoPage,
                (route) => false,
              );
            },
          ),
          ListTile(
            selected: widget.currentPage == 6,
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: const Text(
              'Sair',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //   RouteGeneratorKeys.authLogout,
              //   (route) => false,
              // );
            },
          ),
        ],
      ),
    );
  }
}
