import 'package:flame/components.dart';

import '../Base/space_shooter_game.dart';

class Bullet extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  Bullet() : super(size: Vector2(8, 16));

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('bullet.png');
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y -= 300 * dt; // Bullet moves up

    if (position.y < 0) {
      removeFromParent(); // Remove bullet if it goes off-screen
    }
  }
}
