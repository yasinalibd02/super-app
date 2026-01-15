import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame_audio/flame_audio.dart';

void main() {
  runApp(
    GameWidget(
      game: FlappyBirdGame(),
      overlayBuilderMap: {
        'GameOver': (context, FlappyBirdGame game) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'GAME OVER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Score: ${game.score}',
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      game.overlays.remove('GameOver');
                      game.resetGame();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text('Restart'),
                  ),
                ],
              ),
            ),
          );
        },
      },
    ),
  );
}

class FlappyBirdGame extends FlameGame
    with TapCallbacks, HasCollisionDetection {
  late Bird bird;
  late TextComponent scoreText;
  int score = 0;
  bool isGameOver = false;
  double speed = 200;

  late Timer pipeTimer;

  @override
  Color backgroundColor() => const Color(0xFF71C5CF);

  @override
  Future<void> onLoad() async {
    // Load audio assets
    try {
      await FlameAudio.audioCache.loadAll(['hit.wav', 'point.wav']);
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }

    add(Cloud(position: Vector2(100, 100)));
    add(Cloud(position: Vector2(300, 50)));
    add(Cloud(position: Vector2(50, 300)));

    add(Ground());

    bird = Bird();
    add(bird);

    scoreText = TextComponent(
      text: '0',
      position: Vector2(size.x / 2, 50),
      anchor: Anchor.topCenter,
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    add(scoreText);

    pipeTimer = Timer(2.0, onTick: spawnPipes, repeat: true);
    pipeTimer.start();
  }

  @override
  void update(double dt) {
    if (isGameOver) return;
    super.update(dt);
    pipeTimer.update(dt);
    scoreText.text = score.toString();
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (isGameOver) return;
    bird.jump();
    HapticFeedback.lightImpact();
  }

  void spawnPipes() {
    const double pipeGap = 160;
    final double midY = size.y / 2;
    final double pipeY = midY + (Random().nextDouble() * 200 - 100);

    add(
      Pipe(
        isTop: false,
        position: Vector2(size.x + 50, pipeY + pipeGap / 2),
        size: Vector2(70, size.y - (pipeY + pipeGap / 2) - 50),
      ),
    );

    add(
      Pipe(
        isTop: true,
        position: Vector2(size.x + 50, pipeY - pipeGap / 2),
        size: Vector2(70, pipeY - pipeGap / 2),
      ),
    );

    add(
      ScoreTrigger(position: Vector2(size.x + 50, 0), size: Vector2(1, size.y)),
    );
  }

  void gameOver() {
    if (isGameOver) return;
    isGameOver = true;
    HapticFeedback.heavyImpact();
    // Play sound "pop" (using hit.wav as requested/available)
    try {
      FlameAudio.play('hit.wav');
    } catch (e) {
      debugPrint("Error playing hit.wav: $e");
    }
    overlays.add('GameOver');
    pauseEngine();
  }

  void resetGame() {
    score = 0;
    scoreText.text = '0';
    isGameOver = false;

    children.whereType<Pipe>().forEach((p) => p.removeFromParent());
    children.whereType<ScoreTrigger>().forEach((p) => p.removeFromParent());

    bird.reset();
    resumeEngine();
  }
}

class Bird extends PositionComponent
    with CollisionCallbacks, HasGameReference<FlappyBirdGame> {
  double velocityY = 0;
  final double gravity = 1000;
  final double jumpForce = -350;

  Bird() : super(size: Vector2(40, 30), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    position = Vector2(100, game.size.y / 2);

    add(
      CircleComponent(
        radius: 15,
        paint: Paint()..color = const Color(0xFF4FC3F7),
        anchor: Anchor.center,
        position: size / 2,
      ),
    );

    add(
      CircleComponent(
        radius: 6,
        paint: Paint()..color = Colors.white,
        position: Vector2(28, 10),
        anchor: Anchor.center,
      ),
    );
    add(
      CircleComponent(
        radius: 2,
        paint: Paint()..color = Colors.black,
        position: Vector2(30, 10),
        anchor: Anchor.center,
      ),
    );

    add(
      PolygonComponent(
        [Vector2(0, 0), Vector2(10, 5), Vector2(0, 10)],
        paint: Paint()..color = const Color(0xFFFFB703),
        position: Vector2(28, 18),
        anchor: Anchor.centerLeft,
      ),
    );

    add(
      CircleComponent(
        radius: 8,
        paint: Paint()..color = Colors.white.withValues(alpha: 0.5),
        position: Vector2(15, 18),
        anchor: Anchor.center,
      ),
    );

    // Scale the bird up slightly as per previous request
    scale = Vector2.all(1.5);

    add(CircleHitbox(radius: 15, position: size / 2, anchor: Anchor.center));
  }

  @override
  void update(double dt) {
    super.update(dt);

    velocityY += gravity * dt;
    position.y += velocityY * dt;

    angle = (velocityY / 500).clamp(-0.5, 0.5);

    if (position.y < 0) {
      position.y = 0;
      velocityY = 0;
    }
  }

  void jump() {
    velocityY = jumpForce;
  }

  void reset() {
    position = Vector2(100, game.size.y / 2);
    velocityY = 0;
    angle = 0;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Pipe || other is Ground) {
      game.gameOver();
    } else if (other is ScoreTrigger) {
      game.score++;
      try {
        FlameAudio.play('point.wav');
      } catch (e) {
        debugPrint("Error playing point.wav: $e");
      }
      other.removeFromParent();
    }
  }
}

class Pipe extends PositionComponent with HasGameReference<FlappyBirdGame> {
  final bool isTop;

  Pipe({required this.isTop, required Vector2 position, required Vector2 size})
    : super(
        position: position,
        size: size,
        anchor: isTop ? Anchor.bottomLeft : Anchor.topLeft,
      );

  @override
  Future<void> onLoad() async {
    add(
      RectangleComponent(
        size: size,
        paint: Paint()
          ..color = const Color(0xFF2D7DD2)
          ..style = PaintingStyle.fill,
      ),
    );

    add(
      RectangleComponent(
        size: size,
        paint: Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      ),
    );

    double capHeight = 25;
    double capWidth = size.x + 10;
    Vector2 capPos = isTop ? Vector2(-5, size.y - capHeight) : Vector2(-5, 0);

    add(
      RectangleComponent(
        size: Vector2(capWidth, capHeight),
        position: capPos,
        paint: Paint()..color = const Color(0xFF2D7DD2),
      ),
    );
    add(
      RectangleComponent(
        size: Vector2(capWidth, capHeight),
        position: capPos,
        paint: Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      ),
    );

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= game.speed * dt;

    if (position.x < -100) {
      removeFromParent();
    }
  }
}

class ScoreTrigger extends PositionComponent
    with HasGameReference<FlappyBirdGame> {
  ScoreTrigger({required Vector2 position, required Vector2 size})
    : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= game.speed * dt;
    if (position.x < -100) removeFromParent();
  }
}

class Ground extends PositionComponent with HasGameReference<FlappyBirdGame> {
  @override
  Future<void> onLoad() async {
    size = Vector2(game.size.x, 50);
    position = Vector2(0, game.size.y - 50);
    anchor = Anchor.topLeft;

    add(RectangleHitbox());

    add(
      RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xFFDED895), // Sand color
      ),
    );

    add(
      RectangleComponent(
        size: Vector2(size.x, 10),
        paint: Paint()..color = const Color(0xFF73BF2E),
      ),
    );
  }

  @override
  void update(double dt) {
    position.y = game.size.y - 50;
    size.x = game.size.x;
  }
}

class Cloud extends PositionComponent with HasGameReference<FlappyBirdGame> {
  Cloud({required Vector2 position}) : super(position: position);

  @override
  Future<void> onLoad() async {
    final paint = Paint()..color = Colors.white.withValues(alpha: 0.8);
    add(CircleComponent(radius: 30, paint: paint, position: Vector2(0, 0)));
    add(CircleComponent(radius: 40, position: Vector2(40, -10), paint: paint));
    add(CircleComponent(radius: 30, position: Vector2(80, 0), paint: paint));
  }

  @override
  void update(double dt) {
    position.x -= 20 * dt;
    if (position.x < -150) {
      position.x = game.size.x + 50;
      position.y = 50 + Random().nextDouble() * 200;
    }
  }
}
