package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	var offsetX:Float;

	public var scrollable:Bool;

	public function new()
	{
		super();
		scrollFactor.set();
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
			if (y < 100)
			{
				visible = false;
			}
			else
				visible = true;
		}
	
	}
}
