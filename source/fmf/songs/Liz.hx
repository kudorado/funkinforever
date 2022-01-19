package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Liz extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/liz/liz_assets', "mods");
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'liz idle0', 24, false);//

		animation.addByPrefix('singUP', 'liz up pose0', 24, false);//
		animation.addByPrefix('singLEFT', 'liz left pose0', 24, false);//
		animation.addByPrefix('singRIGHT', 'liz right pose0', 24, false);//
		animation.addByPrefix('singDOWN', 'liz down pose0', 24, false);//

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset('idle', 0, 0);

		dad.addOffset("singUP", 25, -28);
		dad.addOffset("singRIGHT", -53, -29);
		dad.addOffset("singLEFT", 50, -6);
		dad.addOffset("singDOWN", 46, -10);

		dad.playAnim("idle");
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}