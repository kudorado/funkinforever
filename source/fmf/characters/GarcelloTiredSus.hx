package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class GarcelloTiredSus extends Boyfriend
{
	var trail:FlxTrail;

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/garcellotired/garcello_tired', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{

		animation.addByPrefix('idle', 'Garcellotired idle dance', 24, false);
		animation.addByPrefix('cough', 'Garcellotired cough', 24, false);
		animation.addByPrefix('singUP', 'Garcellotired Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'Garcellotired Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'Garcellotired Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'Garcellotired Sing Note DOWN0', 24, false);

		animation.addByPrefix('singUPmiss', 'Garcellotired Sing Note UP MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Garcellotired Sing Note RIGHT MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Garcellotired Sing Note LEFT MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Garcellotired Sing Note DOWN MISS', 1, false);

}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle',-2, -38);
		addOffset('singUP', 1, -41);
		addOffset('singRIGHT', -37 , -38);
		addOffset('singLEFT', 6, -40);
		addOffset('singDOWN', 7, -39);

		addOffset('singUPmiss', -2, -41);
		addOffset('singRIGHTmiss', -42 , -35);
		addOffset('singLEFTmiss', 8, -39);
		addOffset('singDOWNmiss', 6, -37);

		addOffset('cough', -2, -38);
	

		playAnim('idle');
		flipX = true;



	}



	
}
