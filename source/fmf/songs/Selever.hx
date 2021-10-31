package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Selever extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/selever/selever_sheet', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'SelIdle0', 24, false);

		animation.addByPrefix('singUP', 'SelUp0', 24, false);
		animation.addByPrefix('singDOWN', 'SelDown0', 24, false);
		animation.addByPrefix('singLEFT', 'SelLeft0', 24, false);
		animation.addByPrefix('singRIGHT', 'SelRight0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset('idle', 0, 60);

		dad.addOffset("singUP", 55, 121);
		dad.addOffset("singRIGHT", 151, 82);
		dad.addOffset("singLEFT", 171, 59);
		dad.addOffset("singDOWN", 114, 7);

		dad.playAnim("idle");
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}