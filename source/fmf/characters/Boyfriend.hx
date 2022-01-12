package fmf.characters;
import state.*;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Boyfriend extends PlayableCharacter
{
	//whyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy

	override function createAnimationOffsets()
	{
		addOffset('idle', -6, -1);
		addOffset("singUP", -56, 30);
		addOffset("singRIGHT", 1, -8);
		addOffset("singLEFT", -50, -9);
		addOffset("singDOWN", -18, -53);

		addOffset("singUPmiss", -41, 25);
		addOffset("singRIGHTmiss", -45, 18);
		addOffset("singLEFTmiss", -2, 14);
		addOffset("singDOWNmiss", -10, -26);
		addOffset("hey", -6, 3);
		addOffset('scared', -7, -1);

		playAnim('idle');
		flipX = false;
	
	}
}
