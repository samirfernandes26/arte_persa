import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

sealed class ClienteDao {
  static Future<List<ClienteModel>> getAll() async {
    List<ClienteModel> clientes = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    final collectionCliente = fireStore.collection(
      'clientes',
    );

    QuerySnapshot<Map<String, dynamic>> snapshotCliente =
        await collectionCliente.get();

    for (var docCliente in snapshotCliente.docs) {
      ClienteModel cliente = ClienteModel.fromJson(
        docCliente.data(),
      );

      QuerySnapshot<Map<String, dynamic>> snapshotEndereco =
          await docCliente.reference
              .collection(
                'enderecos',
              )
              .limit(1)
              .get();

      if (snapshotEndereco.docs.isNotEmpty) {
        EnderecoModel endereco = EnderecoModel.fromJson(
          snapshotEndereco.docs.first.data(),
        );

        cliente.endereco = endereco;
      }

      clientes.add(cliente);
    }

    return clientes;
  }

  static Future<ClienteModel?> getById(dynamic clienteId) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference clienteRef = firestore
          .collection(
            'clientes',
          )
          .doc(clienteId);

      DocumentSnapshot clienteSnapshot = await clienteRef.get();

      if (clienteSnapshot.exists) {
        ClienteModel cliente = ClienteModel.fromJson(
          clienteSnapshot.data() as Map<String, dynamic>,
        );

        QuerySnapshot enderecoSnapshot = await clienteRef
            .collection(
              'enderecos',
            )
            .limit(1)
            .get();

        if (enderecoSnapshot.docs.isNotEmpty) {
          EnderecoModel endereco = EnderecoModel.fromJson(
            enderecoSnapshot.docs.first.data() as Map<String, dynamic>,
          );
          cliente.endereco = endereco;
        }

        return cliente;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> update({
    required String clienteId,
    required ClienteModel clienteAtualizado,
  }) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    DocumentReference clienteRef =
        fireStore.collection('clientes').doc(clienteId);

    await clienteRef.update(clienteAtualizado.toJson());
  }

  // Deleta um unico cliente em especifico
  static Future<void> deletarCliente(String clienteId) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    DocumentReference clienteRef =
        fireStore.collection('clientes').doc(clienteId);

    await clienteRef.delete();
  }
}
