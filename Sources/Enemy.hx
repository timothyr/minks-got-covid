package;

import kha.graphics2.Graphics;
import kha.Image;

class Enemy {
    private var image: Image;

    public var x: Int;
    public var y: Int;
    public var width(get, null): Int;
    public var height(get, null): Int;
    public var speed = 200.0;
    public var isActive = true;

    public function get_width(): Int {
        return image.width;
    }

    public function get_height(): Int {
        return image.height;
    }

    public function new(x: Int, y: Int, image: Image): Void {
        this.image = image;
        activate(x, y);
    }

    public function activate(x: Int, y: Int): Void {
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

        y += Math.round(speed * deltaTime);
    }
}