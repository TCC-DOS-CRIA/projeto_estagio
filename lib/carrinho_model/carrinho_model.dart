import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import 'package:projeto_estagio/services/produto_services.dart';

class HomeController extends GetxController {
  bool _loading = true;

  HomeController(this.categoria);

  bool get loading => _loading;

  List<ProdutoModel> _produtos = [];
  List<ProdutoModel> get produtos => _produtos;

  Map<String, ProdutoModel> _carrinho = Map();
  Map<String, ProdutoModel> get carrinho => _carrinho;
  set carrinho(Map<String, ProdutoModel> a) {
    _carrinho = a;
  }

  final String categoria;

  Map<String, ProdutoModel> _detalhes = Map();
  Map<String, ProdutoModel> get detalhes => _detalhes;

  RxList<ProdutoModel> itemsCarrinho = RxList<ProdutoModel>([]);

  @override
  void onInit() {
    super.onInit();
    print("Status começou");
  }

  @override
  void onReady() {
    if (categoria == "") {
      super.onReady();
      carregarProdutos();
    } else {
      super.onReady();
      carregarProdutosCategoria(categoria);
    }
  }

  Future<void> carregarProdutos() async {
    final data = await ProdutoServices.instance.getProdutos();
    this._produtos = data;
    this._loading = false;
    update(['produtos']);
  }

  Future<void> carregarProdutosCategoria(String cat) async {
    final data = await ProdutoServices.instance.getProdutosByCategoria(cat);
    this._produtos = data;
    this._loading = false;
    update(['produtos']);
  }

  listaCarrinho(int index, bool noCarrinho) {
    ProdutoModel produto = this._produtos[index];
    this.produtos[index].noCarrinho = noCarrinho;
    if (noCarrinho) {
      this._carrinho[produto.nome] = produto;
      produto.quantidade = 1;
    } else {
      this._carrinho.remove(produto.nome);
      produto.quantidade = 0;
    }
    update(['produtos', 'carrinho']);
  }

  listaDetalhes(int index, bool selecionado) {
    ProdutoModel produto = this._produtos[index];
    this.produtos[index].selecionado = selecionado;
    if (selecionado) {
      this._detalhes[produto.nome] = produto;
    } else {
      this._detalhes.remove(produto.nome);
    }
    update(['produtos', 'detalhes']);
  }

  double valorTotal() => produtos.fold<double>(
        0.0,
        (previousValue, element) =>
            previousValue + ((element.quantidade) * element.preco),
      );

  void increment(index) {
    update();
  }

  void decrement(index) {
    update();
  }
}
