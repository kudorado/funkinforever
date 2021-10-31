package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Roro extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/roro/roroAssets', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'Roro Idle0', 24, false);

		animation.addByPrefix('singUP', 'Roro Up Note0', 24, false);
		animation.addByPrefix('singDOWN', 'Roro Down Note0', 24, false);
		animation.addByPrefix('singLEFT', 'Roro Left Note0', 24, false);
		animation.addByPrefix('singRIGHT', 'Roro Right Note0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset('idle', 0, 0);

		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", -0, -0);
		dad.addOffset("singLEFT", 0, -0);
		dad.addOffset("singDOWN", -0, -0);

		dad.scale.x = 0.85;
		dad.scale.y = 0.85;

		dad.flipX = true;

	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}