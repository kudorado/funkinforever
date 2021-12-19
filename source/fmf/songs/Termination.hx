package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Termination extends CensoryOverload	
{

    
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/qt/robot_404', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'KB404_DanceLeft0', 18, false);
		animation.addByPrefix('singUP', 'KB404_Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'KB404_Right0', 24, false);
		animation.addByPrefix('singLEFT', 'KB404_Left0', 24, false);
		animation.addByPrefix('singDOWN', 'KB404_Down0', 24, false);
		dad.animation = animation;
	}
    
	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 0);
		dad.addOffset("singUP", 17, 185);
		dad.addOffset("singRIGHT", -278, -26);
		dad.addOffset("singLEFT", 101, 173);
		dad.addOffset("singDOWN", 22, -42);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x = -230;
		dad.y = 97;
	}

}
