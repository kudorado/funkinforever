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

class LuciSarv extends SongPlayer
{
	var startY:Float;
	var speed:Float = 200;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/lucisarv/luci_sarv', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
	
		animation.addByPrefix('idle', "LuciferSarvIdle0", 24, false);
		animation.addByPrefix('singUP', "LuciferSarvUp0", 24, false);
		animation.addByPrefix('singDOWN', "LuciferSarvDown0", 24, false);
		animation.addByPrefix('singLEFT', 'LuciferSarvLeft0', 24, false);
		animation.addByPrefix('singRIGHT', 'LuciferSarvRight0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset("idle", 0, 0);

		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singDOWN", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);

		dad.y -= 100;
		dad.x -= 150;
		
		startY = dad.y + 100;


	}

	var sillyHotBabe:Bool = true;
	var counter:Float;
	var direction:Float = 1;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sillyHotBabe)
		{
			dad.y += Math.sin(200) * direction;
			counter += elapsed;
			if (counter >= 2.5)
			{
				direction *= -1;
				counter = 0;
			}
		}
	}
	
	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}