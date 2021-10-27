package fmf.characters;

import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class AgotiSus extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/agoti/AGOTI', 'mods');

		var tex2 = Paths.getSparrowAtlas('pc/agoti/AGOTI_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Agoti_Idle', 24, false);
		animation.addByPrefix('singUP', 'Agoti_Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Agoti_Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Agoti_Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Agoti_Down0', 24, false);

		animation.addByPrefix('singUPmiss', 'Agoti_Up MISS1', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Agoti_Right MISS1', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Agoti_Left MISS1', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Agoti_Down MISS1', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 150);

		addOffset('singUP', -47, 206);
		addOffset('singRIGHT', 150, 109);
		addOffset('singLEFT', 111, 184);
		addOffset('singDOWN', 61, -22);
		
		addOffset('singUPmiss', -57, 207);
		addOffset('singRIGHTmiss', 148, 110);
		addOffset('singLEFTmiss', 113, 178);
		addOffset('singDOWNmiss', 57, 6
		);
		
		playAnim('idle');
		flipX = true;


		this.scale.x = 1.5;
		this.scale.y = 1.5;


	}
	
}
