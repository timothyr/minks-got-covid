package;

import kha.graphics2.Graphics;
import kha.Sound;
import kha.Image;
import kha.audio1.Audio;

class Gun {
    private var bulletImage: Image;
    private var bulletSound: Sound;
    private var shotInterval: Float;
    private var cooldownLeft: Float;
    private var bullets: Array<Bullet>;

    public function new(shotInterval: Float, bulletImage: Image, bulletSound: Sound) {
        this.shotInterval = shotInterval;
        this.bulletImage = bulletImage;
        this.bulletSound = bulletSound;
        cooldownLeft = 0;
        bullets = new Array<Bullet>();
    }

    public function shoot(x: Int, y: Int): Void {
        if (cooldownLeft <= 0) {
            Audio.play(bulletSound, false);
            cooldownLeft = shotInterval;
            var adjX: Int = x - Std.int(bulletImage.width / 2);

            for (bullet in bullets) {
                if (!bullet.isActive) {
                    bullet.activate(adjX, y);
                    return;
                }
            }

            bullets.push(new Bullet(adjX, y, bulletImage));
        }
    }

    public function update(deltaTime: Float) {
        cooldownLeft -= deltaTime;
        if (cooldownLeft < 0) {
            cooldownLeft = 0;
        }

        for (bullet in bullets) {
            bullet.update(deltaTime);

            if (bullet.isActive && bullet.y + bulletImage.height < 0) {
                bullet.isActive = false;
            }
        }
    }

    public function render(g: Graphics) {
        for (bullet in bullets) {
            bullet.render(g);
        }
    }

    public function getActiveBullets(): Array<Bullet> {
        var actives = new Array<Bullet>();

        for (bullet in bullets) {
            if (bullet.isActive) {
                actives.push(bullet);
            }
        }

        return actives;
    }
}