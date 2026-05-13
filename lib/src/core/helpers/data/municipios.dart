Map<int, String> ufMap = {for (var uf in ufData) uf["id"]: uf["uf"]};

List<Map<String, dynamic>> municipiosData = localidadeData
    .where((element) => element["tipo_localidade_id"] == 1)
    .map((element) => {...element, 'uf': ufMap[element["uf_id"]]})
    .toList();
