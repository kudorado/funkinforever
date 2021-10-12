package fmf.songs;

import fmf.songs.SongPlayer;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Miku extends SongPlayer
{
	
	public  override function loadMap()
	{
		super.loadMap();

	}

	public override function getDadTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/miku/miku', 'mods');
		dad.frames = tex;
	}

	// create animation for BF
	public override function createDadAnimations():Void
	
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);

		dad.animation = animation;
	}

	// create animation offset for BF
	public override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -5, -2);
		dad.addOffset("singUP", 7, -1);
		dad.addOffset("singRIGHT", 24, -1);
		dad.addOffset("singLEFT", -57, 0);
		dad.addOffset("singDOWN", -31, 1);

		dad.playAnim('idle');
		dad.flipX = true;

	}
	

}
