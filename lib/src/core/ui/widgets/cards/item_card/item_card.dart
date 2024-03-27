import 'dart:io';

import 'package:arte_persa/src/core/ui/widgets/tiles/observacao_tile/observacao_tile.dart';
import 'package:arte_persa/src/model/item_model.dart';
import 'package:flutter/material.dart';

part './components.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _renderLabel(
                          titulo: 'Tipo do item',
                          conteudo: item.tipoItem,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        _renderLabel(
                          titulo: 'Nome do Item',
                          conteudo: item.nomeDoItem,
                        ),
                      ],
                    ),
                  ),
                  if (item.fotoProduto?.pathLocal != null)
                    renderImage(
                      pathImage: item.fotoProduto!.pathLocal!,
                      borderRadio: 10.0,
                      size: 62,
                    )
                  else if (item.fotoProduto?.pathDownloadImage != null)
                    renderImage(
                      pathImage: item.fotoProduto!.pathDownloadImage!,
                      borderRadio: 10.0,
                      size: 62,
                    )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              _renderLabel(
                titulo: 'Numéro de Observaçoes',
                conteudo: item.observacoes!.length.toString(),
              ),
              if (item.observacoes != null)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: item.observacoes?.length ?? 0,
                  itemBuilder: (context, index) {
                    final observacaoData = item.observacoes?[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      child: ObservacaoTile(
                        image: observacaoData!.image,
                        descricao: observacaoData.observacao,
                      ),
                    );
                  },
                ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Servicos selecionados',
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  if (item.nomeDosServicos != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: item.nomeDosServicos?.length ?? 0,
                        itemBuilder: (context, index) {
                          final nomeServico = item.nomeDosServicos![index];
                          return Row(
                            children: [
                              const Icon(
                                Icons.check_sharp,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                nomeServico,
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              _renderLabel(
                titulo: 'Valor do serviço',
                conteudo: item.total?.toString().replaceAll('.', ',') ?? '0,00',
                colorConteudo: Colors.orange.shade300,
                fontSizeConteudo: 24,
                fontWeightConteudo: FontWeight.w900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
