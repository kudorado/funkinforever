package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Monika extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/monika/monika', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
	
		animation.addByPrefix('idle', 'Angry Senpai Idle instance 10', 24, false);
		animation.addByPrefix('singUP', 'Angry Senpai UP NOTE instance 10', 24, false);
		animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE instance 10', 24, false);
		animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE instance 10', 24, false);
		animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE instance 10', 24, false);
	
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset('idle', 0, 0);
		dad.addOffset("singUP", -71, -7);
		dad.addOffset("singRIGHT", 35, -33);
		dad.addOffset("singLEFT", -16, -16);
		dad.addOffset("singDOWN", -41, -75);

		dad.scale.x = 4;
		dad.scale.y = 4;

		dad.x -= 100;
		dad.y += 300;

	
		dad.flipX = true;

	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}