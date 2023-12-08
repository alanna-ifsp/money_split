import 'movements_model.dart';

class MovimentCollection {
  List<String> idList = [];
  List<MovimentModel> movimentList = [];

  MovimentCollection() {
    idList = [];
    movimentList = [];
  }

  int length() {
    return idList.length;
  }

  MovimentModel getMovimentAtIndex(int index) {
    MovimentModel user = movimentList[index];
    return MovimentModel.withData(
        nomeDevedor: user.getNomeDevedor,
        nomePagador: user.getNomePagador,
        valor: user.getValor,
        descricao: user.getDescricao,
        categoria: user.getCategoria);
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertUserOfId(String id, MovimentModel user) {
    int index = getIndexOfId(id);
    if (index != -1) {
      // Update
      movimentList[index] = MovimentModel.withData(
          nomeDevedor: user.getNomeDevedor,
          nomePagador: user.getNomePagador,
          valor: user.getValor,
          descricao: user.getDescricao,
          categoria: user.getCategoria);
    } else {
      // Insert
      idList.add(id);
      movimentList.add(
        MovimentModel.withData(
            nomeDevedor: user.getNomeDevedor,
            nomePagador: user.getNomePagador,
            valor: user.getValor,
            descricao: user.getDescricao,
            categoria: user.getCategoria),
      );
    }
  }

  updateUserOfId(String id, MovimentModel user) {
    int index = getIndexOfId(id);
    if (index != -1) {
      movimentList[index] = MovimentModel.withData(
          nomeDevedor: user.getNomeDevedor,
          nomePagador: user.getNomePagador,
          valor: user.getValor,
          descricao: user.getDescricao,
          categoria: user.getCategoria);
    }
  }

  deleteUserOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      movimentList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertUserOfId(String id, MovimentModel user) {
    idList.add(id);
    movimentList.add(
      MovimentModel.withData(
          nomeDevedor: user.getNomeDevedor,
          nomePagador: user.getNomePagador,
          valor: user.getValor,
          descricao: user.getDescricao,
          categoria: user.getCategoria),
    );
  }
}
