package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class NonsenseSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc_updated/nonsense/nonsense', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Idle0', 18, false);
	
		animation.addByPrefix('singUP', 'NoteUp0', 24, false);
		animation.addByPrefix('singRIGHT', 'NoteRight0', 24, false);
		animation.addByPrefix('singLEFT', 'NoteLeft0', 24, false);
		animation.addByPrefix('singDOWN', 'NoteDown0', 24, false);
		
		animation.addByPrefix('singUPmiss', 'NoteUp MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'NoteRight MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'NoteLeft MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'NoteDown MISS0', 1, false);
		

		playAnim('idle');
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle');

		addOffset("singUP", 0, 0);
		addOffset("singRIGHT", 16, 10);
		addOffset("singLEFT", 28, -10);
		addOffset("singDOWN", -3, -17);

		addOffset("singUPmiss", 10, 16);
		addOffset("singRIGHTmiss", 28, -11);
		addOffset("singLEFTmiss", -5, -19);
		addOffset("singDOWNmiss", 28, -58);


		flipX = true;
	}
	

}
