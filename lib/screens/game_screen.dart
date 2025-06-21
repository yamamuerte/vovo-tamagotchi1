
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int vidas = 3;
  int fase = 1;
  int comida = 3;
  int remedios = 2;
  String status = 'Fase 1 - Vovó está esperando...';
  String sprite = 'assets/images/vovo_parada.png';

  void alimentar() {
    setState(() {
      if (comida > 0) {
        comida--;
        sprite = 'assets/images/vovo_comendo.png';
        status = 'Você alimentou a vovó!';
        proximaFase();
      } else {
        perderVida('Sem comida!');
      }
    });
  }

  void darRemedio() {
    setState(() {
      if (remedios > 0) {
        remedios--;
        sprite = 'assets/images/vovo_remedio.png';
        status = 'Você deu remédio pra vovó!';
        proximaFase();
      } else {
        perderVida('Sem remédio!');
      }
    });
  }

  void proximaFase() {
    if (fase < 10) {
      fase++;
      comida = 3 + fase;
      remedios = 2 + fase ~/ 2;
      sprite = 'assets/images/vovo_andando.png';
      status = 'Fase $fase - Vovó chegou na nova fila!';
    } else {
      status = 'Parabéns! Você completou todas as 10 fases!';
      sprite = 'assets/images/vovo_feliz.png';
    }
  }

  void perderVida(String motivo) {
    vidas--;
    if (vidas <= 0) {
      status = 'Game Over! Vovó ficou doente.';
      sprite = 'assets/images/vovo_triste.png';
    } else {
      status = motivo + ' Vovó ficou triste.';
      sprite = 'assets/images/vovo_triste.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('❤️ Vidas: $vidas'),
            Text('🧾 Fase: $fase'),
            Text('🍲 Comida: $comida'),
            Text('💊 Remédios: $remedios'),
            const SizedBox(height: 20),
            Image.asset(sprite, height: 200),
            const SizedBox(height: 20),
            Text(status, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: vidas > 0 ? alimentar : null, child: Text('Alimentar')),
            ElevatedButton(onPressed: vidas > 0 ? darRemedio : null, child: Text('Dar Remédio')),
          ],
        ),
      ),
    );
  }
}
