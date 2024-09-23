import 'package:flutter/material.dart';
import 'package:webcomu/_comon/colors.dart';
import 'package:webcomu/models/exerciciomodelo.dart';
import 'package:webcomu/models/sentimentomodelo.dart';

class Exerciciotela extends StatelessWidget {
  Exerciciotela({super.key});

  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "EXE001",
      nome: "remada baixa",
      treino: "treino A",
      comoFazer: "segura a barra e puxa");

  final List<Sentimentomodelo> listaSentimentos = [
    Sentimentomodelo(
        id: "SE001", sentindo: "pouca ativação hoje", data: "2024-09-15"),
    Sentimentomodelo(
        id: "SE001", sentindo: "muita ativação hoje", data: "2024-09-21"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "${exercicioModelo.nome}" + " teste",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              exercicioModelo.treino,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Mycolors.azulEscuro,
        elevation: 0,
        toolbarHeight: 72,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_card),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.all(8),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              // width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Envia foto')),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Tirar foto')),
                ],
              ),
            ),

            const SizedBox(height: 12),
            Text("como fazer",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
            Text(
              exercicioModelo.comoFazer,
            ),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Divider(
                color: Colors.black,
              ),
            ), //dividir texto
            const SizedBox(height: 12),
            Text(
              "como estou me sentindo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index) {
                Sentimentomodelo sentimentoAgora = listaSentimentos[index];
                return ListTile(
                  title: Text(sentimentoAgora.sentindo),
                  subtitle: Text(sentimentoAgora.data),

                  //tirar o padding padrao
                  contentPadding: EdgeInsets.zero,

                  //leading proprieadae para botar icones no incio
                  leading: Icon(Icons.double_arrow_rounded),

                  //proprieada para botar icone no final
                  trailing: IconButton(
                      onPressed: () {
                        print("Deletar " + "${sentimentoAgora.sentindo}");
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
