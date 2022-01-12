package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class GarcelloDeadSus extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/garcellodead/garcello_dead', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Garcello idle', 24, false);
		animation.addByPrefix('singUP', 'Garcello Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'Garcello Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'Garcello Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'Garcello Sing Note DOWN0', 24, false);

		animation.addByPrefix('coolGuy', 'Garcello coolguy', 15, false);

		animation.addByPrefix('singUPmiss', 'Garcello Sing Note UP MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Garcello Sing Note LEFT MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Garcello Sing Note RIGHT MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Garcello Sing Note DOWN MISS', 1, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	

		addOffset('coolGuy',-4, -22);
		addOffset('idle',-2, -38);

		addOffset('singUP', -3, -38);
		addOffset('singRIGHT', -10 , -33);
		addOffset('singLEFT', -3, -35);
		addOffset('singDOWN', -3, -21);
		
		addOffset('singUPmiss', -2, -37);
		addOffset('singRIGHTmiss', -14 , -29);
		addOffset('singLEFTmiss', -3, -35);
		addOffset('singDOWNmiss', -4, -21);
		


		playAnim('idle');
		flipX = true;

	}	

	
}
