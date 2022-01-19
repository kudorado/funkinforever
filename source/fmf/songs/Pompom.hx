package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Pompom extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/pompom/pompommad_assets', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'Pompom sad idle0', 24, false);

		animation.addByPrefix('singUP', 'Pompom sad up0', 24, false);
		animation.addByPrefix('singDOWN', 'Pompom sad down0', 24, false);
		animation.addByPrefix('singLEFT', 'Pompom sad left0', 24, false);
		animation.addByPrefix('singRIGHT', 'Pompom sad right0', 24, false);


		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);

		dad.addOffset("singUP", 43, 11);
		dad.addOffset("singRIGHT", 35, -1);
		dad.addOffset("singLEFT", 38, 0);
		dad.addOffset("singDOWN", 49, -29);


	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}