import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import 'package:projeto_estagio/services/produto_services.dart';

class HomeController extends GetxController {
  bool _loading = true;
  bool get loading => _loading;

  List<ProdutoModel> _produtos = [];
  List<ProdutoModel> get produtos => _produtos;

  Map<String, ProdutoModel> _carrinho = Map();
  Map<String, ProdutoModel> get carrinho => _carrinho;

  RxList<ProdutoModel> itemsCarrinho = RxList<ProdutoModel>([]);

  @override
  void onInit() {
    super.onInit();
    print("Status começou");
  }

  @override
  void onReady() {
    super.onReady();
    this.carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    final data = await ProdutoServices.instance.getProdutos();
    this._produtos = data;
    this._loading = false;
    update(['produtos']);
  }

  listaCarrinho(int index, bool noCarrinho) {
    ProdutoModel produto = this._produtos[index];
    this.produtos[index].noCarrinho = noCarrinho;
    if (noCarrinho) {
      this._carrinho[produto.nome] = produto;
    } else {
      this._carrinho.remove(produto.nome);
    }
    update(['produto', 'listaCarrinho']);
  }

  double valorTotal() => produtos.fold<double>(
        0.0,
        (previousValue, element) =>
            previousValue + (element.quantidade * element.preco),
      );

  void increment(index) {
    update();
  }

  void decrement(index) {
    update();
  }
}
