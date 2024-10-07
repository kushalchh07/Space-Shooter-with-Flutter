import 'package:flame/components.dart';
import 'package:space_shooter/components/bullet.dart';

import '../Base/space_shooter_game.dart';

class PlayerShip extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  PlayerShip() : super(size: Vector2(64, 64));

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('player_ship.png');
    position = Vector2(gameRef.size.x / 2 - size.x / 2,
        gameRef.size.y - size.y - 20); // Place the ship near the bottom
  }

  void moveLeft() {
    if (position.x > 0) {
      position.x -= 10; // Adjust movement speed
    }
  }

  void moveRight() {
    if (position.x < gameRef.size.x - size.x) {
      position.x += 10; // Adjust movement speed
    }
  }

  void shoot() {
    final bullet = Bullet()
      ..position = position +
          Vector2(size.x / 2 - 4, -size.y / 2); // Spawn bullet from center
    gameRef.add(bullet);
  }
}
