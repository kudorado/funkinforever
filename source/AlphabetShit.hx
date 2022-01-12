package;
import state.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxTimer;

using StringTools;

/**
 * Loosley based on FlxTypeText lolol
 */
class AlphabetShit extends Alphabet
{
	public static var daVisible:Float = 90;

	public function new(x:Float, y:Float, text:String = "", ?bold:Bool = false, typed:Bool = false, shouldMove:Bool = false)
	{
		super(x, y, text, bold, typed, shouldMove);
		visible = false;
		
		new FlxTimer().start(0.1, function(tmr:FlxTimer)
		{
			visible = true;
		});
	}

		
	override function update(elapsed:Float)
	{
		if (isMenuItem)
		{
			var scaledY = FlxMath.remapToRange(targetY, 0, 1, 0, 1.3);
			y = FlxMath.lerp(y, (scaledY * 80) + (FlxG.height * 0.25), 0.30);
			screenCenter(X);
		}

		super.update(elapsed);

		if(y < daVisible)
			visible = false;
		else 
			visible = true;
	}
}
