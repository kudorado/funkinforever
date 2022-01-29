package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class EsManifest extends SongPlayer
{

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/skymad/sky_mad_assets', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations()
	{
		super.createDadAnimations();

		dad.animation.addByPrefix('idle', 'Sky mad idle', 24, false);

		dad.animation.addByPrefix('singUP', 'Sky mad up0', 24, false);
		dad.animation.addByPrefix('singRIGHT', 'Sky mad right0', 24, false);
		dad.animation.addByPrefix('singDOWN', 'Sky mad down0', 24, false);
		dad.animation.addByPrefix('singLEFT', 'Sky mad left0', 24, false);

		dad.animation.addByPrefix('singUP-alt', 'Sky mad up0', 24, false);
		dad.animation.addByPrefix('singRIGHT-alt', 'Sky mad right0', 24, false);
		dad.animation.addByPrefix('singDOWN-alt', 'Sky mad down0', 24, false);
		dad.animation.addByPrefix('singLEFT-alt', 'Sky mad left0', 24, false);

	}


	override function createDadAnimationOffsets()
	{
		super.createDadAnimationOffsets();
		dad.addOffset('idle', 0, 0);

		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);

		dad.addOffset("singUP-alt", 0, 0);
		dad.addOffset("singRIGHT-alt", 0, 0);
		dad.addOffset("singLEFT-alt", 0, 0);
		dad.addOffset("singDOWN-alt", 0, 0);

		dad.x -= 250;
		dad.y += 50;

		dad.scale.x = 1.25;
		dad.scale.y = 1.25;

	}
		
	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('gf_skins/manifest/gf', "mods");
		gf.frames = tex;
	}

	override function createGFAnimationOffsets()
	{
		gf.addOffset('idle', 0, 0);
		gf.addOffset('sad', 0, 0);

		gf.x -= 175;
		gf.y -= 200;

	}

	override function createGFAnimations()
	{
		gf.animation.addByPrefix("idle", 'GF idle0');
		gf.animation.addByPrefix('sad', 'GF miss0');
	}

	override function getGFVersion()
	{
		return new GFIdle();
	}

	override function createBF()
	{
		super.createBF();
		
		bf.x += 200;
		bf.y += 25;
	}

	override function createStoryBF()
	{
		changePc('bf');

		bf.x += 200;
		bf.y += 25;
	}
	

	override function loadMap()
	{

		gameState.defaultCamZoom = 0.8;

		var hallowTex = Paths.getSparrowAtlas('bg/sky/bg', 'mods');
		var bg = new FlxSprite(-200, -200);
		bg.frames = hallowTex;
		bg.animation.addByPrefix('idle', 'Bg_manifest0');
		bg.animation.play('idle');
		bg.antialiasing = true;

		bg.scale.x = 2.5;
		bg.scale.y = 2.5;

		bg.x += 400;
		bg.y += 300;

		gameState.add(bg);

	}
	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{
			case 32:
				//gospel
				changeDad('gospel');
				sillyHotBabe = true;
				dad.x -= 150;
				dad.y -= 100;

			case 46:
				//selever
				changePc('selever');
				bf.x += 200;
				// bf.y ;


			case 64:
				//nene
				changeDad('nene');
				sillyHotBabe = false;

				dad.x += 15;
				dad.y += 75;


			case 74:
				//pico
				changePc("pico");

				bf.x += 150;
				bf.y += 25;

			case 84:
				//drunk annie
				changeDad("drunkannie");

				dad.x -= 200;
				dad.y -= 50;

			case 94:
				//garcello
				changePc("garcello");
				bf.x += 150;


			case 105:
				//monika
				changeDad('monika');
				dad.x += 25;

				
			case 119:
				//senpaighosty bf
				changePc("senpai ghosty");
				bf.x += 150;

			case 136:
				//gf crazy
				changeDad('gf-mad');
				dad.x -= 50;
				dad.y += 50;

			case 152:
				//brother
				changePc("brother");
				bf.x += 50;
				bf.y -= 50;

			case 168:
				//mom
				changeDad('milf');

			case 173:
				changePc("mom angel");
				bf.x += 100;

			case 180:
				changeDad("sunday");
				dad.x -= 150;
				dad.y -= 100;

			case 185:
				changePc("carol");
				bf.x += 150;
				bf.y -= 50;

			case 192:
				changeDad("pompom");

				dad.x -= 100;
				dad.y += 50;


			case 198:
				changePc("kapi");	
				bf.x += 125;
				bf.y -= 75;

			case 205:
				//hex
				changeDad("roro");
				dad.x -= 400;	
				dad.y -= 75;
			
			case 209:
				changePc("anchor");
				bf.x += 100;
				bf.y -= 25;


			case 216:
				changeDad("chara");
				dad.x -= 150;
				dad.y = 450;


			case 232:
				changePc("sans");	
				bf.x += 75;
				bf.y = 220;

			case 248:
				changeDad("ballistic");
				dad.x += 100;
				dad.y = 185;

			case 264:
				changePc("agoti crazy");
				bf.x += 100;
				bf.y += 25;

			case 280:
				changeDad("disappearance");
				
				dad.x = 150;
				dad.y = 185;
				// dad.x -= 300;
				// dad.y -= 100;

			case 311:
				changeDad('guraamelia');
				dad.x -= 200;
				dad.y += 75;

				changePc('hex');
				bf.x +=	 150;
				bf.y -= 50;

			case 342:
				changePc("botan");
				bf.x += 50;
				bf.y += 0;
			
			case 376:
				changeDad("genocide");
				dad.x += 525;
				dad.y += 50;

			case 392:
				changePc("ex gf");
				bf.x += 100;
				bf.y -= 85;

			case 408:
				changeDad("tord");
				dad.x -= 150;
				dad.y += 75;

			case 415:
				changePc("tom");
				bf.x += 250;
				bf.y += 25;



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
			direction += elapsed;
			if (direction >= 2.5)
			{
				direction *= -1;
				counter = 0;
			}
		}
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid2'), true, 150, 150);
		icon.animation.add('dad', [2, 3], 0, false, false);
		icon.animation.play("dad");
	}

	override function createCharacters()
	{
		super.createCharacters();
	}
}