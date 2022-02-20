package;

import state.*;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class StrumNote extends FlxSprite
{
	private var colorSwap:ColorSwap;
	public var resetAnim:Float = 0;
	private var noteData:Int = 0;
	public var direction:Float = 30;//plan on doing scroll directions soon -bb

	private var player:Int;
	
	public var texture(default, set):String = null;
	private function set_texture(value:String):String {
		trace('set texture shit: ' + value);
		if(texture != value) {
			texture = value;
			reloadNote();
		}
		return value;
	}

	public function new(x:Float, y:Float, leData:Int, player:Int)
	{
		noteData = leData;
		this.player = player;
		this.noteData = leData;
		super(x, y);

		var skin:String = 'assets';
		// if(GameState.SONG.arrowSkin != null && GameState.SONG.arrowSkin.length > 1) skin = GameState.SONG.arrowSkin;
			// texture = skin; // Load texture and anims

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		if (resetAnim > 0)
		{
			resetAnim -= elapsed;
			if (resetAnim <= 0)
			{
				playAnim('static');
				resetAnim = 0;
			}
		}
		// // if(animation.curAnim != null){ //my bad i was upset
		// if (animation.curAnim.name == 'confirm' && !GameState.isPixelStage)
		// {
		// 	centerOrigin();
		// 	// }
		// }

		super.update(elapsed);
	}

	public function reloadNote()
	{
		var lastAnim:String = null;
		if (animation.curAnim != null)
			lastAnim = animation.curAnim.name;

		var kudoradoHandsome = /*really*/ true;
		if (kudoradoHandsome)
		{
			var daTexture = FunkinLua.daPath + "images/" + texture;
			
			frames = Paths.getSparrowAtlas(daTexture, FunkinLua.daLibrary);
			animation.addByPrefix('green', 'arrowUP');
			animation.addByPrefix('blue', 'arrowDOWN');
			animation.addByPrefix('purple', 'arrowLEFT');
			animation.addByPrefix('red', 'arrowRIGHT');

			antialiasing = true; // true; //ClientPrefs.globalAntialiasing;
			setGraphicSize(Std.int(width * 0.7));

			switch (Math.abs(noteData))
			{
				case 0:
					animation.addByPrefix('static', 'arrowLEFT');
					animation.addByPrefix('pressed', 'left press', 24, false);
					animation.addByPrefix('confirm', 'left confirm', 24, false);
				case 1:
					animation.addByPrefix('static', 'arrowDOWN');
					animation.addByPrefix('pressed', 'down press', 24, false);
					animation.addByPrefix('confirm', 'down confirm', 24, false);
				case 2:
					animation.addByPrefix('static', 'arrowUP');
					animation.addByPrefix('pressed', 'up press', 24, false);
					animation.addByPrefix('confirm', 'up confirm', 24, false);
				case 3:
					animation.addByPrefix('static', 'arrowRIGHT');
					animation.addByPrefix('pressed', 'right press', 24, false);
					animation.addByPrefix('confirm', 'right confirm', 24, false);
			}
		}
		updateHitbox();

		if (lastAnim != null)
		{
			playAnim(lastAnim, true);
		}
	}

	public function playAnim(anim:String, ?force:Bool = false)
	{
		animation.play(anim, force);
		// centerOffsets();
		// centerOrigin();
		// if (animation.curAnim == null || animation.curAnim.name == 'static')
		// {
		// 	colorSwap.hue = 0;
		// 	colorSwap.saturation = 0;
		// 	colorSwap.brightness = 0;
		// }
		// else
		// {
		// 	colorSwap.hue = ClientPrefs.arrowHSV[noteData % 4][0] / 360;
		// 	colorSwap.saturation = ClientPrefs.arrowHSV[noteData % 4][1] / 100;
		// 	colorSwap.brightness = ClientPrefs.arrowHSV[noteData % 4][2] / 100;

		// 	if (animation.curAnim.name == 'confirm' && !GameState.isPixelStage)
		// 	{
		// 		centerOrigin();
		// 	}
		// }
	}
}
