import 'dart:math';

import 'package:black_jack_game/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BlackJackGame extends StatefulWidget {
  const BlackJackGame({super.key});

  @override
  State<BlackJackGame> createState() => _BlackJackGameState();
}

class _BlackJackGameState extends State<BlackJackGame> {
  bool _juegoComenzado = false;

  //Mazos
  List<Image> misCartas = [];
  List<Image> repartidorCartas = [];

  //Cartas
  String? repartidorPrimeraCarta;
  String? repartidorSegundaCarta;
  String? jugadorPrimeraCarta;
  String? jugadorSegundaCarta;

  //Puntajes
  int jugadorPtj = 0;
  int repartidorPtj = 0;

  final Map<String, int> mazo = {
    'assets/cartas/2.1.png': 2,
    'assets/cartas/2.2.png': 2,
    'assets/cartas/2.3.png': 2,
    'assets/cartas/2.4.png': 2,
    'assets/cartas/3.1.png': 3,
    'assets/cartas/3.2.png': 3,
    'assets/cartas/3.3.png': 3,
    'assets/cartas/3.4.png': 3,
    'assets/cartas/4.1.png': 4,
    'assets/cartas/4.2.png': 4,
    'assets/cartas/4.3.png': 4,
    'assets/cartas/4.4.png': 4,
    'assets/cartas/5.1.png': 5,
    'assets/cartas/5.2.png': 5,
    'assets/cartas/5.3.png': 5,
    'assets/cartas/5.4.png': 5,
    'assets/cartas/6.1.png': 6,
    'assets/cartas/6.2.png': 6,
    'assets/cartas/6.3.png': 6,
    'assets/cartas/6.4.png': 6,
    'assets/cartas/7.1.png': 7,
    'assets/cartas/7.2.png': 7,
    'assets/cartas/7.3.png': 7,
    'assets/cartas/7.4.png': 7,
    'assets/cartas/8.1.png': 8,
    'assets/cartas/8.2.png': 8,
    'assets/cartas/8.3.png': 8,
    'assets/cartas/8.4.png': 8,
    'assets/cartas/9.1.png': 9,
    'assets/cartas/9.2.png': 9,
    'assets/cartas/9.3.png': 9,
    'assets/cartas/9.4.png': 9,
    'assets/cartas/10.1.png': 10,
    'assets/cartas/10.2.png': 10,
    'assets/cartas/10.3.png': 10,
    'assets/cartas/10.4.png': 10,
    'assets/cartas/J1.png': 10,
    'assets/cartas/J2.png': 10,
    'assets/cartas/J3.png': 10,
    'assets/cartas/J4.png': 10,
    'assets/cartas/Q1.png': 10,
    'assets/cartas/Q2.png': 10,
    'assets/cartas/Q3.png': 10,
    'assets/cartas/Q4.png': 10,
    'assets/cartas/K1.png': 10,
    'assets/cartas/K2.png': 10,
    'assets/cartas/K3.png': 10,
    'assets/cartas/K4.png': 10,
    'assets/cartas/A1.png': 11,
    'assets/cartas/A2.png': 11,
    'assets/cartas/A3.png': 11,
    'assets/cartas/A4.png': 11,
  };
  Map<String, int> cartasEnJuego = {};
  @override
  void initState() {
    super.initState();
    cartasEnJuego.addAll(mazo);
  }

//Reiniciar ronda y mazo
  void cambiarCartas() {
    //Empezar nueva ronda con mazo completo
    cartasEnJuego = {};
    cartasEnJuego.addAll(mazo);

    //Reiniciar cartas e imagenes de cartas
    misCartas = [];
    repartidorCartas = [];

    Random random = Random();
    var cartaMazo = cartasEnJuego.keys.length;

    //Keys de cartas 1 y 2 para el repartidor
    String carta1Key = cartasEnJuego.keys.elementAt(random.nextInt(cartaMazo));
    cartasEnJuego.removeWhere(
        (key, value) => key == carta1Key); //borrar esa carta del mazo en juego

    String carta2Key = cartasEnJuego.keys.elementAt(random.nextInt(cartaMazo));
    cartasEnJuego.removeWhere((key, value) => key == carta2Key);

    //Keys de cartas 1 y 2 para el Jugador
    String carta3Key = cartasEnJuego.keys.elementAt(random.nextInt(cartaMazo));
    cartasEnJuego.removeWhere((key, value) => key == carta3Key);

    String carta4Key = cartasEnJuego.keys.elementAt(random.nextInt(cartaMazo));
    cartasEnJuego.removeWhere((key, value) => key == carta4Key);

    //Asignar las cartas al repartidor
    repartidorPrimeraCarta = carta1Key;
    repartidorSegundaCarta = carta2Key;

    //Asignar las carta al jugador
    jugadorPrimeraCarta = carta3Key;
    jugadorSegundaCarta = carta4Key;

    //Mostrar las imágenes
    repartidorCartas.add(Image.asset(repartidorPrimeraCarta!));
    repartidorCartas.add(Image.asset(repartidorSegundaCarta!));

    misCartas.add(Image.asset(jugadorPrimeraCarta!));
    misCartas.add(Image.asset(jugadorSegundaCarta!));
  }

//Agregar carta a jugador
  void agregarCarta() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _juegoComenzado
          ? SafeArea(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Dealer\'s score'),
                    Container(
                      height: 200,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: ((context, index) {
                            //TODO:- Return Dealer's Cards here
                            return Container();
                          })),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('Player\'s score'),
                    Container(
                      height: 200,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: ((context, index) {
                            //TODO:- Return Dealer's Cards here
                            return Container();
                          })),
                    )
                  ],
                ),
                Column(children: [
                  MaterialButton(
                    color: kColor3,
                    onPressed: () {},
                    child: Text('Another card'),
                  ),
                  MaterialButton(
                    color: kColor3,
                    onPressed: () {},
                    child: Text('Next round'),
                  )
                ]),
              ],
            ))
          : Center(
              child: MaterialButton(
                color: kColor3,
                minWidth: 150,
                child: Text(
                  'Empezar juego',
                  style: TextStyle(color: Colors.white70),
                ),
                onPressed: (() {
                  setState(() {
                    _juegoComenzado = true;
                  });
                }),
              ),
            ),
    );
  }
}
