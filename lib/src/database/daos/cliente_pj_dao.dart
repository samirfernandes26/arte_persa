import 'package:arte_persa/src/model/cliente_pj_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

sealed class ClientePjDao {
  static Future<List<ClientePjModel>> getAll() async {
    List<ClientePjModel> clientes = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    CollectionReference<Map<String, dynamic>> collectionCliente =
        fireStore.collection(
      'clientes_pj',
    );

    QuerySnapshot<Map<String, dynamic>> snapshotCliente =
        await collectionCliente.get();

    for (var docCliente in snapshotCliente.docs) {
      ClientePjModel cliente = ClientePjModel.fromJson(
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

  static Future<ClientePjModel?> getById(dynamic clienteId) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference clienteRef = firestore
          .collection(
            'clientes_pj',
          )
          .doc(clienteId);

      DocumentSnapshot clienteSnapshot = await clienteRef.get();

      if (clienteSnapshot.exists) {
        ClientePjModel cliente = ClientePjModel.fromJson(
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
    required ClientePjModel clienteAtualizado,
  }) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    DocumentReference clienteRef =
        fireStore.collection('clientes_pj').doc(clienteId);

    await clienteRef.update(clienteAtualizado.toJson());
  }

  // Deleta um unico cliente em especifico
  static Future<void> deletarCliente(String clienteId) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    DocumentReference clienteRef =
        fireStore.collection('clientes_pj').doc(clienteId);

    await clienteRef.delete();
  }
}
