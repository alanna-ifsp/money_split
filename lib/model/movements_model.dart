class MovimentModel {
  String? nomeDevedor;
  String? nomePagador;
  int? valor;
  String? descricao;
  String? categoria;

  MovimentModel();

  get getNomePagador => this.nomePagador;

  set setNomePagador(nomePagador) => this.nomePagador = nomePagador;

  get getNomeDevedor => this.nomeDevedor;

  set setNomeDevedor(nomeDevedor) => this.nomeDevedor = nomeDevedor;

  get getValor => this.valor;

  set setValor(valor) => this.valor = valor;

  get getDescricao => this.descricao;

  set setDescricao(descricao) => this.descricao = descricao;

  get getCategoria => this.categoria;

  set setCategoria(categoria) => this.categoria = categoria;

  MovimentModel.fromMap(map) {
    this.nomeDevedor = map["nomeDevedor"];
    this.nomePagador = map["nomePagador"];
    this.valor = map["valor"];
    this.descricao = map["descricao"];
    this.categoria = map["categoria"];
  }

  toMap() {
    var map = <String, dynamic>{};
    map["nomeDevedor"] = nomeDevedor;
    map["nomePagador"] = nomePagador;
    map["valor"] = valor;
    map["descricao"] = descricao;
    map["categoria"] = categoria;

    return map;
  }

  List<MovimentModel> movimentList = [];

  MovimentModel.withData(
      {nomeDevedor = "",
      nomePagador = "",
      valor = 0,
      descricao = "",
      categoria = ""}) {
    this.nomeDevedor = nomeDevedor;
    this.nomePagador = nomePagador;
    this.valor = valor;
    this.descricao = descricao;
    this.categoria = categoria;
  }
}
