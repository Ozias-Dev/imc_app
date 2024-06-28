import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc_app/consts/colors.dart';
class ResultatPage extends StatefulWidget {
  double taille;
  double poids;
  bool isHomme = true;
   ResultatPage({super.key, required this.poids, required this.taille, required this.isHomme});

  @override
  State<ResultatPage> createState() => _ResultatPageState();
}

class _ResultatPageState extends State<ResultatPage> {
  @override
  Widget build(BuildContext context) {
    double ImcCal = widget.poids/pow(widget.taille/100, 2);
    String resul = "";
    switch(ImcCal){
      case  < 18.5 :
       resul = "Maigreur";
      break;
      case > 18.5 && <25 :
       resul = "Normal";
      break;
      case > 25 && < 30:
       resul = "Surpoids";
      break;
      case > 30 && < 40:
       resul = "Obésité";
      break;
      case > 40 :
       resul = "Obésité Massive";
      break;
    }
    return Scaffold(
      backgroundColor: rredColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Votre IMC, est :", style: TextStyle(fontSize: 25, color: Colors.white),),
              Text(ImcCal.toStringAsFixed(1), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
              Text(resul, style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.restore, color: Colors.white,size: 40,))
            ],
          ),
        ),
      ),
    );
  }
}