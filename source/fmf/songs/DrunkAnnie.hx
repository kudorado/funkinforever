package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class DrunkAnnie extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/drunkannie/drunkAnnie', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'monster idle0', 24, false);
		animation.addByPrefix('singUP', 'monster up note0', 24, false);
		animation.addByPrefix('singDOWN', 'monster down0', 24, false);
		animation.addByPrefix('singLEFT', 'Monster left note0', 24, false);
		animation.addByPrefix('singRIGHT', 'Monster Right note0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset('idle', 0, 0);

		dad.addOffset("singUP", -19, 50);
		dad.addOffset("singRIGHT", -46, 0);
		dad.addOffset("singLEFT", -41, 0);
		dad.addOffset("singDOWN", -37, -90);

		dad.playAnim("idle");
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}