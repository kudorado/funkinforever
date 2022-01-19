package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Nene extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/nene/Nene_FNF_assetss', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);//
		animation.addByPrefix('singUP', 'Pico Up note0', 2, false);//
		animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 2, false);//
		animation.addByPrefix('singRIGHT', 'Pico Note Right0', 2, false);//
		animation.addByPrefix('singDOWN', 'Pico Down Note0', 2, false);//

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset('idle', 0, 0);
		dad.addOffset("singUP", 43, 7);
		dad.addOffset("singRIGHT", -19, 0);
		dad.addOffset("singLEFT", 0, 0); 
		dad.addOffset("singDOWN", 0, 0);

		dad.flipX = true;
		dad.x -= 200;

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}