import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

sealed class ClienteDao {
  // Busca toda a lista de cliente do firebase
  static Future<List<ClienteModel>> getClientes() async {
    List<ClienteModel> clientes = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final collectionCliente = fireStore.collection('clientes');
    QuerySnapshot<Map<String, dynamic>> snapshotCliente =
        await collectionCliente.get();

    for (var docCliente in snapshotCliente.docs) {
      ClienteModel cliente = ClienteModel.fromJson(docCliente.data());

      QuerySnapshot<Map<String, dynamic>> snapshotEndereco =
          await docCliente.reference.collection('enderecos').limit(1).get();

      if (snapshotEndereco.docs.isNotEmpty) {
        EnderecoModel endereco =
            EnderecoModel.fromJson(snapshotEndereco.docs.first.data());
        cliente.endereco = endereco;
      }

      clientes.add(cliente);
    }

    return clientes;
  }

  // Busca Apenas um cliente em especifico
  Future<ClienteModel?> buscarClientePorId(String clienteId) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    DocumentReference clienteRef =
        fireStore.collection('clientes').doc(clienteId);

    DocumentSnapshot snapshot = await clienteRef.get();

    if (snapshot.exists) {
      return ClienteModel.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  // Atualiza um unico cliente em especifico
  static Future<void> updateCliente({
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
