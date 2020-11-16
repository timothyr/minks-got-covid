package;

import kha.graphics2.Graphics;
import kha.Image;

class Bullet {
    private var image: Image;

    public var x: Int;
    public var y: Int;
    public var speed: Int = 600;
    public var isActive: Bool = true;

    public function new(x: Int, y: Int, image: Image) {
        this.image = image;
        activate(x, y);
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
    }
}