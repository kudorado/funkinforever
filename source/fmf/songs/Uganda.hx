package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Uganda extends Garcello
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/uganda/uganda', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', "Knuckles Oh No0", 24, false);
		animation.addByPrefix('singUP', "Knuckles Oh No0", 24, false);
		animation.addByPrefix('singDOWN', "Knuckles Oh No0", 24, false);
		animation.addByPrefix('singLEFT', 'Knuckles Oh No0', 24, false);
		animation.addByPrefix('singRIGHT', 'Knuckles Oh No0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}