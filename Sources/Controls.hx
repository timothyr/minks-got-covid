package;

import kha.input.KeyCode;

class Controls {
    public var left: Bool;
    public var right: Bool;
    public var up: Bool;
    public var down: Bool;

    public function new() {}

    public function keyDown (key: KeyCode) {
        switch (key) {
            case Left:
            case A:
                left = true;
            case Right:
            case D:
                right = true;
            case Up:
            case W:
                up = true;
            case Down:
            case S:
                down = true;
            default:
                // no-op
        }
    }

    public function keyUp (key: KeyCode) {
        switch (key) {
            case Left:
            case A:
                left = false;
            case Right:
            case D:
                right = false;
            case Up:
            case W:
                up = false;
            case Down:
            case S:
                down = false;
            default:
                // no-op
        }
    }

}