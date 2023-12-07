import 'dart:ffi';

class MovimentModel
{
  String? nomeDevedor; 
  String? nomePagador;
  int?  valor; 
  String? descricao;
  String? categoria; 

get getNomePagador => this.nomePagador;

set setNomePagador( nomePagador) => this.nomePagador = nomePagador;


get getNomeDevedor => this.nomeDevedor;

set setNomeDevedor( nomeDevedor) => this.nomeDevedor = nomeDevedor;


get getValor => this.valor; 

set setValor(valor) => this.valor = valor; 


get getDescricao => this.descricao;

set setDescricao( descricao) => this.descricao = descricao;

get getCategoria => this.categoria; 

set setCategoria (categoria)=> this.categoria = categoria;

  toMap() {


    var map = <String, dynamic>{};
    map["nomeDevedor"] = nomeDevedor;
    map["nomePagador"] = nomePagador;
    map["valor"] = valor;
    map["descricao"] = descricao;
    map["categoria"] =  categoria;

    return map;

  } 




}

