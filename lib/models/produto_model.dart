import 'package:meta/meta.dart' show required;

class ProdutoModel {
  final double preco;
  final String nome, descricao, categoria, image, dataexcluido;
  int quantidade;
  bool noCarrinho = false;
  bool excluido = false;

  ProdutoModel(
      {this.nome = "",
      this.preco = 0,
      this.categoria = "",
      this.descricao = "",
      this.quantidade = 0,
      this.excluido = false,
      this.dataexcluido = "",
      this.image = ""});

  static ProdutoModel fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
      descricao: json['descricao'],
      quantidade: json['qtd_estoque'],
      excluido: json['excluido'],
      dataexcluido: json['data_excluido'],
      image: json['img_produto'],
    );
  }
}
