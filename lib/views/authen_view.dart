import 'package:flutter/material.dart';
import 'package:webcomu/_comon/colors.dart';
import 'package:webcomu/componets/decoration_field_auth.dart';
import 'package:webcomu/service/authentication_servidor.dart';

class AutenticationTela extends StatefulWidget {
  const AutenticationTela({super.key});

  @override
  State<AutenticationTela> createState() => _AutenticationTelaState();
}

class _AutenticationTelaState extends State<AutenticationTela> {
  bool queroEntrar = true;
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  AuthenticatorService _authservice = AuthenticatorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      //stack colocar um elemento acima do outro começando por baixo
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Mycolors.azulBaixoGradiente,
                    Mycolors.azulTopoGradiente,
                  ],
                  //regra de ordem das cores parte de cima
                  begin: Alignment.topCenter,
                  //regra de ondem das cores parte de baixo
                  end: Alignment.bottomCenter),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 428,
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        "Traino Safo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 48),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("Email"),
                        validator: (String? value) {
                          if (value == null) {
                            return "o email não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "email é muito curto";
                          }
                          if (!value.contains("@")) {
                            return "O email não é valido";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _nomeController,
                        decoration: getAuthenticationInputDecoration("senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "a senha não pode ser vazia";
                          }
                          if (value.length < 5) {
                            return "senha muito curta";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            TextFormField(
                              decoration:
                                  getAuthenticationInputDecoration("Nome"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                          onPressed: () {
                            botaoPrinciapalClicado();
                          },
                          child: Text((queroEntrar) ? "Entrar" : "Cadastrar")),
                      const SizedBox(height: 15),
                      Divider(color: Colors.black),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        },
                        child: Text(
                          (queroEntrar)
                              ? "Ainda não possui uma conta? cadastre-se"
                              : "ja possuir uma conta ? entre",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  botaoPrinciapalClicado() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String nome = _nomeController.text;
    if (_formkey.currentState!.validate()) {
      if (queroEntrar) {
        print("Estou entrando");
      } else {
        print("cadastro validado");
        print("${_emailController.text}");
        print("${_senhaController.text}");
        print("${_nomeController.text}");
        _authservice.cadastrarUser(nome: nome, senha: senha, email: email);
      }
    } else {
      print("form invalido");
    }
  }
}
