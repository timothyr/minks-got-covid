package;

import kha.Assets;
import kha.Sound;
import kha.graphics2.Graphics;
import kha.Image;

class EnemySpawner {
    private var enemyImage: Image;
    private var activeAnimation: Animation;
    private var explodeAnimation: Animation;
    private var explodeSound: Sound;
    private var minSpawnX: Int;
    private var maxSpawnX: Int;
    private var maxPositionY: Int;
    private var spawnMinTime: Float;
    private var spawnMaxTime: Float;
    private var spawnNextTime: Float;
    private var currentTime: Float;
    private var enemies: Array<Enemy>;

    public function new(spawnMinTime: Float, spawnMaxTime: Float, 
                        ?minSpawnX: Int = 0, maxSpawnX: Int = 0, maxPositionY: Int = 600) {
        setAssets();
        this.spawnMinTime = spawnMinTime;
        this.spawnMaxTime = spawnMaxTime;
        this.minSpawnX = minSpawnX;
        this.maxSpawnX = maxSpawnX;
        this.maxPositionY = maxPositionY;
        currentTime = 0;
        enemies = new Array<Enemy>();
        spawnNextTime = generateRandomSpawnTime(spawnMinTime, spawnMaxTime);
    }

    private function generateRandomSpawnTime(minTime: Float, maxTime: Float): Float {
        return minTime + Math.random() * (maxTime - minTime);
    }

    private function generateRandomX(minSpawnX, maxSpawnX): Int {
        return Std.random(maxSpawnX - minSpawnX) + minSpawnX;
    }

    private function setAssets() {
        this.enemyImage = Assets.images.enemy;
        var explodeFrames = new Array<Image>();
        explodeFrames.push(Assets.images.smokeOrange0);
        explodeFrames.push(Assets.images.smokeOrange1);
        explodeFrames.push(Assets.images.smokeOrange2);
        explodeFrames.push(Assets.images.smokeOrange3);
        activeAnimation = new Animation(1, [enemyImage], PlayState.Loop);
        explodeAnimation = new Animation(0.1, explodeFrames, PlayState.Once);
        explodeSound = Assets.sounds.enemyExplosion;

    }

    private function spawn(x: Int, y: Int): Void {
        for (enemy in enemies) {
            if (!enemy.isActive) {
                enemy.activate(x, y);
                return;
            }
        }

        enemies.push(new Enemy(x, y, activeAnimation, explodeAnimation, explodeSound));
    }

    public function update(deltaTime: Float) {
        currentTime += deltaTime;

        // Spawn new enemy if cooldown is up
        if (currentTime >= spawnNextTime) {
            currentTime = 0;
            spawnNextTime = generateRandomSpawnTime(spawnMinTime, spawnMaxTime);
            spawn(generateRandomX(minSpawnX, maxSpawnX - enemyImage.width), -enemyImage.height);
        }

        // Update all enemies
        for (enemy in enemies) {
            enemy.update(deltaTime);

            if (enemy.isActive && enemy.y > maxPositionY) {
                enemy.isActive = false;
            }
        }
    }

    public function render(g: Graphics) {
        for (enemy in enemies) {
            enemy.render(g);
        }
    }

    public function getActiveEnemies(): Array<Enemy> {
        var actives = new Array<Enemy>();

        for (enemy in enemies) {
            if (enemy.isActive) {
                actives.push(enemy);
            }
        }

        return actives;
    }
}