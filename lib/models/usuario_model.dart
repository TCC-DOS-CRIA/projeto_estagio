import 'package:meta/meta.dart' show required;

class Usuario_model {
  String nome;
  String email;
  String telefone;
  String img_usuario;

  Usuario_model(
      {this.nome = "",
      this.email = "",
      this.telefone= "",
      this.img_usuario=""});

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "email":email,
        "telefone":telefone,
        "img_usuario":img_usuario
    };
  static Usuario_model fromJson(Map<String, dynamic> json) {
    return Usuario_model(
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      img_usuario: json['img_usuario']
    );

    
  }
  
}
