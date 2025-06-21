
import 'package:flame/game.dart';

class FilaGame extends FlameGame {
  int vidas = 3;
  int faseAtual = 1;
  double paciencia = 100;

  @override
  Future<void> onLoad() async {
    // Carregar imagens e sons aqui
  }

  @override
  void update(double dt) {
    paciencia -= dt * 4;
    if (paciencia <= 0) {
      vidas--;
      if (vidas > 0) {
        paciencia = 100;
      } else {
        faseAtual = 1;
        vidas = 3;
        paciencia = 100;
      }
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Desenhar elementos do jogo aqui
  }
}
