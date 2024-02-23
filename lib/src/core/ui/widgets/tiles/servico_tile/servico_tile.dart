import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';

import 'package:arte_persa/src/model/cadastro_servico_model.dart';

class ServicoTile extends StatelessWidget {
  const ServicoTile({
    Key? key,
    required this.servico,
  }) : super(key: key);

  final CadastroServicoModel servico;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        elevation: 2,
        child: InkWell(
          enableFeedback: true,
          onTap: () {
            Navigator.of(context).pushNamed(
              RouteGeneratorKeys.cadastroServico,
              arguments: {'servico': servico},
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    servico.nomeDoServico,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const Text(
                  '348,00',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  'MQ',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
