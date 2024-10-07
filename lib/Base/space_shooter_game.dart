import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:space_shooter/components/scrolling_background.dart';
import '../components/enemy_ship.dart';
import '../components/player_ship.dart';

class SpaceShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late PlayerShip player;
  late ScrollingBackground background;
  double enemySpawnTimer = 0;

  @override
  Future<void> onLoad() async {
    player = PlayerShip();
    background = ScrollingBackground();

    add(background);
    add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);

    enemySpawnTimer += dt;
    if (enemySpawnTimer > 2) {
      add(EnemyShip()); // Spawn enemy every 2 seconds
      enemySpawnTimer = 0;
    }
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    // Safely handle the gesture delta to move the player ship
    final delta = info.delta.primaryAxisDelta;

    if (delta != null) {
      if (delta < 0) {
        player.moveLeft();
      } else if (delta > 0) {
        player.moveRight();
      }
    }
  }

  @override
  void onTap() {
    player.shoot();
  }
}

extension on EventDelta {
  get primaryAxisDelta => null;
}
