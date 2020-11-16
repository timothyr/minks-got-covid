package;

import kha.Framebuffer;
import kha.System;

class Main {
	static function update(): Void {

	}

	static function render(framebuffer: Framebuffer): Void {

	}

	public static function main() {
		System.start({title: "Minks Got Covid", width: 800, height: 600}, function (_) {

			var game = new Game();
			System.notifyOnFrames(function (framebuffers) { game.render(framebuffers[0]); });
		});
	}
}
