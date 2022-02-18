package reactor;
import state.*;
import flixel.FlxSprite;

class LockIcon extends FlxSprite
{
	/**
	 * Used for FreePlayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new()
	{
		super();
		
		loadGraphic(Paths.image('lock', 'mods'));

		antialiasing = true;
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
