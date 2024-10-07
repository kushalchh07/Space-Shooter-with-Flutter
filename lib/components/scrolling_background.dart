import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../Base/space_shooter_game.dart';

class ScrollingBackground extends Component with HasGameRef<SpaceShooterGame> {
  late SpriteComponent _background1;
  late SpriteComponent _background2;
  final double speed = 100;

  @override
  Future<void> onLoad() async {
    _background1 =
        SpriteComponent(sprite: await gameRef.loadSprite('background.png'));
    _background2 =
        SpriteComponent(sprite: await gameRef.loadSprite('background.png'));

    _background1.position = Vector2(0, 0);
    _background2.position = Vector2(0, -gameRef.size.y);

    add(_background1);
    add(_background2);
  }

  @override
  void update(double dt) {
    super.update(dt);

    _background1.position.y += speed * dt;
    _background2.position.y += speed * dt;

    if (_background1.position.y >= gameRef.size.y) {
      _background1.position.y = -gameRef.size.y;
    }

    if (_background2.position.y >= gameRef.size.y) {
      _background2.position.y = -gameRef.size.y;
    }
  }
}
