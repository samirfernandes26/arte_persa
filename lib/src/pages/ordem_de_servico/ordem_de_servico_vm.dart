import 'dart:io';

import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/image_model.dart';
import 'package:arte_persa/src/model/ordem_de_servico_model.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_observacao_page.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_state.dart';

part 'ordem_de_servico_vm.g.dart';

@riverpod
class OrdemDeServicoVm extends _$OrdemDeServicoVm {
  @override
  OrdemDeServicoState build() => OrdemDeServicoState.initial();
  // TODO: remover
  Future<void> teste(ServicoModel? servico, bool checkbox) async {
    const double largura = 2.69;
    const double comprimento = 6.9;
    const double area = largura * comprimento;

    List<ServicoModel>? servicos = state.servicos;

    int index = servicos!.indexOf(servico!);

    if (servico.metroQuadrado == true &&
        servico.valor != null &&
        checkbox == true) {
      servico.valorCalculo = area * servico.valor!;
    } else {
      servico.valorCalculo = null;
    }

    servicos[index] = servico;
    state = state.copyWith(
      servicos: servicos,
    );
  }

  cadastroDeItem(Map<String, dynamic> data){
    final batata = '';
  }
  
  int geradorDeNumeroDePedido() {
    // Obter a data e hora atual
    DateTime now = DateTime.now();

    // Formatar a data e hora
    String formattedDateTime = DateFormat('yy-MM-dd HH:mm:ss').format(now);

    // Remover os caracteres especiais da data e hora formatada
    String cleanFormattedDateTime =
        formattedDateTime.replaceAll(RegExp(r'[-: ]'), '');

    // Converter para um número inteiro
    int concatenatedDateTime = int.parse(cleanFormattedDateTime);

    // Saída
    return concatenatedDateTime;
  }

  Future<void> loadDataServicos() async {
    final loaderHandler = AsyncLoaderHandler()..start();

    List<ServicoModel> servicos = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    final collection = fireStore.collection('servicos');

    QuerySnapshot<Map<String, dynamic>> snapshot = await collection.get();

    for (var servico in snapshot.docs) {
      servicos.add(ServicoModel.fromJson(servico.data()));
    }

    state = state.copyWith(
      servicos: servicos,
      status: OrdemDeServicoStateStatus.loaded,
    );

    loaderHandler.close();
  }

  Future<void> loadDataClientes() async {
    List<ClienteModel> clientes = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    final collection = fireStore.collection('clientes');

    QuerySnapshot<Map<String, dynamic>> snapshot = await collection.get();

    for (var servico in snapshot.docs) {
      clientes.add(ClienteModel.fromJson(servico.data()));
    }

    state = state.copyWith(
      clientes: clientes,
      status: OrdemDeServicoStateStatus.loaded,
    );
  }

  // updateStatePagers(int page, Map<String, dynamic> data) {
  //   switch (page) {
  //     case 1:
  //       state = state.copyWith(
  //         paginaUm: data,
  //       );
  //       break;
  //     case 2:
  //       state = state.copyWith(
  //         paginaDois: data,
  //       );
  //       break;
  //     case 3:
  //       state = state.copyWith(
  //         paginatres: data,
  //       );
  //       break;
  //     case 4:
  //       state = state.copyWith(
  //         paginaquatro: data,
  //       );
  //       break;
  //   }
  // }

  // Future<void> getImageDeviceOrCam({
  //   required String numeroDaNota,
  //   required String tipoFoto,
  //   required String source,
  //   required String fileName,
  // }) async {
  //   ImagePicker imagePicker = ImagePicker();
  //   late XFile? resImage;
  //   if (source == 'Camera') {
  //     resImage = await imagePicker.pickImage(
  //       source: ImageSource.camera,
  //       maxWidth: 2000,
  //       maxHeight: 2000,
  //       imageQuality: 90,
  //     );
  //   }

  //   if (source == 'Galeria') {
  //     resImage = await imagePicker.pickImage(
  //       source: ImageSource.gallery,
  //       maxWidth: 2000,
  //       maxHeight: 2000,
  //       imageQuality: 90,
  //     );
  //   }

  //   if (resImage != null) {
  //     ImageModel imagem = ImageModel(
  //       pathLocal: resImage.path,
  //       fileName: "$fileName${geradorDeNumeroDePedido()}",
  //       pathService: "ordemDeServico/$numeroDaNota/$tipoFoto",
  //     );

  //     if(tipoFoto == 'Producao'){
  //       state = state.copyWith(imagemProduto: imagem);
  //     }else{
  //       // state = state.copyWith(imagemProduto: imagem);
  //     }

  //   }
  // }

  // Future<Map<String, dynamic>?> uploadImageservice(
  //     {required String numeroDaNota, required String tipoFoto}) async {
  //   late Either<ServiceException, ImageModel> response;

  //   ImagePicker imagePicker = ImagePicker();
  //   XFile? image = await imagePicker.pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 2000,
  //     maxHeight: 2000,
  //     imageQuality: 90,
  //   );

  //   if (image != null) {
  //     response = await ref.read(firebaseStorageServiceProvider).upload(
  //           file: File(image.path),
  //           fileName: 'teste_photo',
  //           pathService: "ordemDeServico/$numeroDaNota/$tipoFoto",
  //         );
  //   }

  //   switch (response) {
  //     case Success(value: final restImage):
  //       state = state.copyWith(
  //         status: OrdemDeServicoStateStatus.success,
  //         message: 'Cliente cadastrado com sucesso',
  //       );
        
  //       return state.ordemdeServico!.toJson();
  //     // loaderHandler.close();

  //     case Failure(exception: ServiceException(:final message)):
  //       state = state.copyWith(
  //         status: OrdemDeServicoStateStatus.error,
  //         message: message,
  //       );
  //     // loaderHandler.close();
  //   }
  // }

  // Future<ImageModel> reloadImage(ImageModel data) async {
  //   String pathDownloadImage =
  //       await ref.read(firebaseStorageServiceProvider).getDownLoadUrlByFileName(
  //             pathService: data.pathService!,
  //             fileName: data.fileName!,
  //           );

  //   ImageModel image = data.copyWith(pathDownloadImage: pathDownloadImage);
  //   return image;
  // }
}
