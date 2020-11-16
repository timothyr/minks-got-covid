package;

import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Image;
import kha.Scaler;
import kha.System;

class Game {
	private static var bgColor = Color.fromValue(0x77004d);

	public static inline var screenWidth = 800;
	public static inline var screenHeight = 600;
	public static inline var gunSpeed = 0.25;

	private var backbuffer:Image;
	private var controls:Controls;
	private var timer:Timer;
	private var initialized = false;
	private var mink:Mink;

	public function new() {
		Assets.loadEverything(loadingFinished);
	}

	private function loadingFinished():Void {
		initialized = true;

		// create a buffer to draw to
		backbuffer = Image.createRenderTarget(screenWidth, screenHeight);

		controls = new Controls();
		timer = new Timer();
		Keyboard.get().notify(keyDown, keyUp);

		setupMink();
	}

	public function render(framebuffer:Framebuffer): Void {
		if (!initialized) {
			return;
		}

		var g = backbuffer.g2;

		// clear our backbuffer using graphics2
		g.begin(bgColor);
		mink.render(g);
		g.end();

		// draw our backbuffer onto the active framebuffer
		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();

		update();
	}

	private function setupMink() {
		// create player
		var minkImg = Assets.images.bear;
		mink = new Mink(Std.int(screenWidth / 2) - Std.int(minkImg.width / 2), Std.int(screenHeight / 2) - Std.int(minkImg.height / 2), minkImg);
		mink.attachGun(new Gun(gunSpeed, Assets.images.bullet, Assets.sounds.bulletSound));
	}

	private function update() {
		timer.update();
		updateMink();
	}

	private function updateMink() {
		mink.update(controls, timer.deltaTime);

		// limit mink to the width of the screen
		if (mink.x < 0) {
			mink.x = 0;
		} else if (mink.x + mink.width > screenWidth) {
			mink.x = screenWidth - mink.width;
		}

		// limit mink to the height of the screen
		if (mink.y < 0) {
			mink.y = 0;
		} else if (mink.y + mink.height > screenHeight) {
			mink.y = screenHeight - mink.height;
		}
	}

	private function keyDown(key:KeyCode):Void {
		controls.keyDown(key);
	}

	private function keyUp(key:KeyCode):Void {
		controls.keyUp(key);
	}
}
