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

class AgotiCrazySus extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/agoticrazy/Alt_Agoti_Sprites_B', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Angry_Agoti_Idle', 24, false);
		animation.addByPrefix('singUP', 'Angry_Agoti_Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Angry_Agoti_Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Angry_Agoti_Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Angry_Agoti_Down0', 24, false);

		animation.addByPrefix('singUPmiss', 'Angry_Agoti_Up MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Angry_Agoti_Right MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Angry_Agoti_Left MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Angry_Agoti_Down MISS', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle',0, 0);
		addOffset('singUP', -42, 0);
		addOffset('singRIGHT', -115, 0);
		addOffset('singLEFT', 0, 0);
		addOffset('singDOWN', 0, 0);
		
		addOffset('singUPmiss', -42, 0);
		addOffset('singRIGHTmiss', -115, 0);
		addOffset('singLEFTmiss', 0, 0);
		addOffset('singDOWNmiss', 0, 0);


		playAnim('idle');
		flipX = true;

		this.scale.x = 2;
		this.scale.y = 2;

	}
	
}
