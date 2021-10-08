package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Carol extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/carol/carol', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'BF idle dance', 24, false);

		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -2, 2);

		dad.addOffset("singUP", -2, 10);
		dad.addOffset("singRIGHT", 42, 3);
		dad.addOffset("singLEFT", -50, -11);
		dad.addOffset("singDOWN", -13, -3);

		dad.playAnim("idle");
		dad.flipX = true;

	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}