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

			var game = new KhaShmup();
			System.notifyOnFrames(function (framebuffers) { game.render(framebuffers[0]); });


			// // Just loading everything is ok for small projects
			// Assets.loadEverything(function () {
			// 	// Avoid passing update/render directly,
			// 	// so replacing them via code injection works
			// 	Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
			// });
		});
	}
}
