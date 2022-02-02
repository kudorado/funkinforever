package fmf.characters;
import state.*;
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
		addOffset('idle', -6, 1);
        addOffset("hey", -6, 1);
        addOffset('scared', -6, 1);

        addOffset("singUP", -56, -1);
        addOffset("singRIGHT", -5, -3);
        addOffset("singLEFT", -51, -1);
        addOffset("singDOWN", -16, -1);

        addOffset("singUPmiss", -41, 1);
        addOffset("singRIGHTmiss", -45, -2);
        addOffset("singLEFTmiss", -14, -2);
        addOffset("singDOWNmiss", -11, -5);

        addOffset('hit', -37, 1);
        addOffset('hurt', -37, 1);
        addOffset('scared', -6, 1);
        addOffset('dodge', -16, 1);


		playAnim('idle');
		flipX = false;
	
	}
}
