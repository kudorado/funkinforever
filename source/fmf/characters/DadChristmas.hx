package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class DadChristmas extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/parents/dad', "mods");
		frames = tex;
	
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Parent Christmas Idle", 24, false);
		animation.addByPrefix('singUP', "Parent Up Note Dad0", 24, false);
		animation.addByPrefix('singDOWN', "Parent Down Note Dad0", 24, false);
		animation.addByPrefix('singLEFT', 'Parent Left Note Dad0', 24, false);
		animation.addByPrefix('singRIGHT', 'Parent Right Note Dad0', 24, false);

		animation.addByPrefix('singUPmiss', "Parent Up Note Dad MISS", 1, false);
		animation.addByPrefix('singDOWNmiss', "Parent Down Note Dad MISS", 1, false);
		animation.addByPrefix('singLEFTmiss', 'Parent Left Note Dad MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Parent Right Note Dad MISS', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -24, 104);
		
		addOffset("singUP", -19, 110);
		addOffset("singRIGHT", -19, 103);
		addOffset("singLEFT", 182, 102);
		addOffset("singDOWN", 122, 102);

		addOffset("singUPmiss", -19, 110);
		addOffset("singRIGHTmiss", -19, 103);
		addOffset("singLEFTmiss", 182, 102);
		addOffset("singDOWNmiss", 122, 102);


		playAnim('idle');
		flipX = true;

		this.scale.x = 0.84;
		this.scale.y = 0.84;

	}
	

}
