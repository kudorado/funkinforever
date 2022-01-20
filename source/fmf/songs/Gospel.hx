package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Gospel extends SongPlayer	
{

    override function getDadTex()
		{
			var tex = Paths.getSparrowAtlas('pc/lucisarv/luci_sarv', 'mods');
			dad.frames = tex;
		}
	
		override function loadMap()
		{
	
			gameState.defaultCamZoom = 0.75;
	
			var bg:FlxSprite = new FlxSprite(-200, -700).loadGraphic(Paths.image('bg/sacredmass/church3/base', 'mods'));
			bg.antialiasing = true;
			bg.scale.y = 1.3;
			bg.scale.x = 1.3;
			gameState.add(bg);
	
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
			dad.addOffset('idle', -7, -2);
			dad.addOffset("singUP", -15, 4);
			dad.addOffset("singRIGHT", -6, -1);
			dad.addOffset("singLEFT", -16, -3);
			dad.addOffset("singDOWN", -14, -8);
			dad.dance();
	
			dad.scale.x = 0.8;
			dad.scale.y = 0.8;
	
			dad.x -= 350;
			dad.y -= 300;
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
	
		
	
		override function createBFAnimationOffsets()
		{
			super.createBFAnimationOffsets();
			bf.y += 120;
			bf.x += 300;
		}
	
		override function createGFAnimationOffsets()
		{
			super.createGFAnimationOffsets();
		}
	
		public override function getDadIcon(icon:Icon)
		{
			icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
			icon.animation.add('dad', [34, 35], 0, false, false);
			icon.animation.play("dad");
		}

}