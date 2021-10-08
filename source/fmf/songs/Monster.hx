package fmf.songs;

import fmf.characters.*;
import flixel.FlxG;
import flixel.FlxSprite;

class Monster extends Spookez
{
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/monster/Monster_Assets', 'mods');
		var tex2 = Paths.getSparrowAtlas('pc/dad/dad_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}
		
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'monster idle', 24, false);
		animation.addByPrefix('danceLeft', 'monster idle', 24, false);
		animation.addByPrefix('danceRight', 'monster idle', 24, false);

		animation.addByPrefix('singUP', 'monster up note', 24, false);
		animation.addByPrefix('singDOWN', 'monster down', 24, false);
		animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
		animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -2, 3);
		dad.addOffset("singUP", -45, 56);
		dad.addOffset("singRIGHT", -56, 3);
		dad.addOffset("singLEFT", 25, 3);
		dad.addOffset("singDOWN", 12, -39);

		dad.dance();
	}
	override function createCharacters()
	{
		super.createCharacters();
		dad.x -= 100;
		dad.y -= 75;
	
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [19, 20], 0, false, false);
		icon.animation.play("dad");
	}

}