import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.blueAccent.shade700,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RouteGeneratorKeys.cadastroServico,
                  );
                },
                child: const Text(
                  'Cadastro de serviço teste',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.orange.shade300,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RouteGeneratorKeys.cadastroCliente,
                  );
                },
                child: const Text(
                  'Cadastro de cliente teste',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.green.shade300,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RouteGeneratorKeys.ordemDeServicoPage,
                  );
                },
                child: const Text(
                  'Cadastro de ordem de serviço teste',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.green.shade300,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RouteGeneratorKeys.ordemDeServicoObservacao,
                  );
                },
                child: const Text(
                  'Cadastro de ordem de serviço teste',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
