package fmf.songs;
import state.*;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class EsAnimal extends SongPlayer
{

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/drunkannie/drunkAnnie', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations()
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'monster idle0', 24, false);
		animation.addByPrefix('singUP', 'monster up note0', 24, false);
		animation.addByPrefix('singDOWN', 'monster down0', 24, false);
		animation.addByPrefix('singLEFT', 'Monster left note0', 24, false);
		animation.addByPrefix('singRIGHT', 'Monster Right note0', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets()
	{

		dad.addOffset('idle', 0, 0);

		dad.addOffset("singUP", -19, 50);
		dad.addOffset("singRIGHT", -46, 0);
		dad.addOffset("singLEFT", -41, 0);
		dad.addOffset("singDOWN", -37, -90);

		dad.x -= 200;
		
	}

	override function createGF()
	{
		super.createGF();
	}

	override function createBF()
	{
		super.createBF();
		bf.x += 200;
	}

	override function loadMap()
	{

		gamePlayState.defaultCamZoom = 0.8;

		
		var bg:FlxSprite = new FlxSprite(-600, -600).loadGraphic(Paths.image('bg/annie/evilBG', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;

		var stageFront:FlxSprite = new FlxSprite(-650, 700).loadGraphic(Paths.image('bg/annie/evilSnow', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		stageFront.scale.x = 1.5;
		stageFront.scale.y = 1.5;

		gamePlayState.add(bg);
		gamePlayState.add(stageFront);

	}
	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{
			case 20:
				changeDad("monster");
				dad.x -= 225;

			case 28:
				changePc("spooky");
				bf.x += 100;
				bf.y -= 50;

			case 40:
				changeDad("headache");
				dad.x -= 100;
				dad.y -= 50;

			case 48:
				changePc("matt");
				
				bf.x += 100;
				bf.y += 25;

			case 53:
				changeDad("miku");
				dad.x = 50;
				dad.y = 256;

			case 63:
				changePc("monika");
				bf.x += 100;
				bf.y += 50;

			case 72:
				changeDad("casanova");
				dad.x = -81;
				dad.y = 252;


			case 88:
				changePc("ruv");
				bf.x += 100;
				bf.y += 75;


			case 96:
				changeDad("hdsenpaimad");
				dad.scale.x = 1.2;
				dad.scale.y = 1.2;
				dad.x -= 25;
				dad.y -= 200;

			case 104:
				changePc("tankman");
				dad.y += 25;
				dad.x += 25;

			case 112:
				changeDad("liz");
				dad.x -= 225;
				dad.y += 200;

			case 128:
				changePc("playable gf");
				bf.x += 50;
				bf.y -= 75;

			case 144:
				changeDad("fresh");

				dad.x += 75;
				dad.y += 25;

			case 152:
				changePc("mom");
				bf.x += 100;

				
			case 160:
				changeDad("frisk");

				dad.x -= 175;
				dad.y += 300;


			case 168:
				changePc("sans");
				bf.x += 25;
				bf.y += 125;

			case 176:
				changeDad("lo-fight");
				dad.y += 75;
			
			case 184:
				changePc("hex");
				bf.x += 50;
				bf.y -= 50;


			case 192:
				changeDad("philly");
				dad.y += 225;


				changePc("kapi");

				bf.x += 50;

			case 212:
				changeDad("parasite");

				dad.y += 50;
				dad.x += 75;

			case 220:
				changePc("tabi");
				bf.x += 100;
				bf.y += 50;

			case 228:
				changeDad("tord");
				dad.x -= 200;
				dad.y += 125;

			case 244:
				changePc("tom");
				bf.x += 150;
				bf.y += 65;

			case 259:
				changeDad('carol');
				dad.x -= 150;
				dad.y += 150;

			case 268:
				changePc("sky tired");
				bf.x += 150;
				bf.y += 75;



		}
	}

	var sillyHotBabe:Bool;
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

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid2'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

	override function createCharacters()
	{
		super.createCharacters();
	}
}