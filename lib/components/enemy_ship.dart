import 'package:flame/components.dart';
import 'dart:math';

import '../Base/space_shooter_game.dart';

class EnemyShip extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  EnemyShip() : super(size: Vector2(64, 64));

  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('enemy_ship.png');
    position = Vector2(_random.nextDouble() * (gameRef.size.x - size.x),
        -size.y); // Spawn at random x, off-screen
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += 100 * dt; // Move enemy down

    if (position.y > gameRef.size.y) {
      removeFromParent(); // Remove enemy if it goes off-screen
    }
  }
}
