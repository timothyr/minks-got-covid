package;

import kha.graphics2.Graphics;
import kha.Image;

class Bullet implements Hitboxed {
    private var image: Image;

    public var hitbox: Hitbox;

    public var x: Int;
    public var y: Int;
    public var speed: Int = 600;
    public var isActive: Bool = true;

    public function new(x: Int, y: Int, image: Image) {
        this.image = image;
        hitbox = new Hitbox(x, y, 0, 0, image.width, image.height);
        activate(x, y);
    }

    public function hit(): Void {
        isActive = false;
    }

    public function activate(x: Int, y: Int) {
        this.x = x;
        this.y = y;
        isActive = true;
    }

    public function render(g: Graphics): Void {
        if (!isActive) {
            return;
        }

        g.drawImage(image, x, y);
    }

    public function update(deltaTime: Float): Void {
        if (!isActive) {
            return;
        }

        y -= Math.round(speed * deltaTime);
        hitbox.updatePosition(x, y);
    }
}