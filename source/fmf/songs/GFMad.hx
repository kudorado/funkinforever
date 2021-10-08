package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class GFMad extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/gfmad/madGF', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', "gf Idle Dance0", 24, false);
		
		animation.addByPrefix('singUP', "gf Up note0", 24, false);
		animation.addByPrefix('singDOWN', "gf Down Note0", 24, false);
		animation.addByPrefix('singLEFT', 'gf NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'gf Note Right0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset("idle", 0, 0);
		
		dad.addOffset("singUP", 32, 0);
		dad.addOffset("singDOWN", -78, 1);
		dad.addOffset("singRIGHT", 27, -1);
		dad.addOffset("singLEFT", 91, -1);

		dad.flipX = true;

		dad.x -= 150;
		dad.y += 50;


	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}