package;
import flixel.util.FlxTimer;
import state.*;
import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreePlayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	var offsetX:Float;

	public var scrollable:Bool;

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
			setPosition(sprTracker.x + sprTracker.width + 10 + offsetX, sprTracker.y - 30);
		
		if (scrollable)
		{
			if (y < AlphabetShit.daVisible + 15)
			{
				visible = false;
			}
			else
				visible = true;
		}
	
	}
}
