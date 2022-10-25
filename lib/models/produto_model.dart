import 'package:meta/meta.dart' show required;

class ProdutoModel {
  final int id;
  final double preco;
  final String nome, descricao, categoria, img_produto, data_excluido;
  int qtd_estoque;
  int quantidade;
  bool noCarrinho = false;
  bool selecionado = false;
  bool excluido = false;

  ProdutoModel(
      {this.id = 0,
      this.nome = "",
      this.preco = 0,
      this.categoria = "",
      this.descricao = "",
      this.qtd_estoque = 0,
      this.quantidade = 0,
      this.excluido = false,
      this.data_excluido = "",
      this.img_produto = ""});

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "preco": preco,
        "categoria": categoria,
        "descricao": descricao,
        "qtd_estoque": qtd_estoque,
        "quantidade": quantidade,
        "excluido": excluido,
        "data_excluido": data_excluido,
        "img_produto": img_produto
      };
  static ProdutoModel fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
      descricao: json['descricao'],
      qtd_estoque: json['qtd_estoque'],
      quantidade: json['quantidade'],
      excluido: json['excluido'],
      data_excluido: json['data_excluido'],
      img_produto: json['img_produto'],
    );
  }
}
