package reactor;

import flixel.util.FlxTimer;
import flixel.FlxSprite;

class Icon extends FlxSprite
{
	/**
	 * Used for FreePlayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	var offsetX:Float;

	public var scrollable:Bool;
	public var centerX:Bool;

	public function changeIcon(char:String) {
		//todo
		// if(this.char != char) {
		// 	var name:String = 'icons/' + char;
		// 	if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
		// 	if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
		// 	var file:Dynamic = Paths.image(name);

		// 	loadGraphic(file); //Load stupidly first for getting the file size
		// 	loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
		// 	iconOffsets[0] = (width - 150) / 2;
		// 	iconOffsets[1] = (width - 150) / 2;
		// 	updateHitbox();

		// 	animation.add(char, [0, 1], 0, false, isPlayer);
		// 	animation.play(char);
		// 	this.char = char;

		// 	antialiasing = ClientPrefs.globalAntialiasing;
		// 	if(char.endsWith('-pixel')) {
		// 		antialiasing = false;
		// 	}
		// }
	}
	public function new()
	{
		super();
		scrollFactor.set();
		visible = false;
		
		if (scrollable)
		{
			new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				visible = true;
			});
		}


	}

	public function setOffsetX(offset:Float)
	{
		offsetX = offset;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
		{
			#if Portrait
			setPosition(sprTracker.x + sprTracker.width + 10 + offsetX, sprTracker.y - 30);
			if (centerX)
			{
				screenCenter(X);
				x -= 25;
			}
			#else
			setPosition(sprTracker.x + sprTracker.width + 10 + offsetX, sprTracker.y - 30);
			#end

		}

		if (scrollable)
		{
			// if (y < AlphabetShit.daVisible)
			// {
			// 	visible = false;
			// }
			// else
			visible = true;
		}
	
	}
}
