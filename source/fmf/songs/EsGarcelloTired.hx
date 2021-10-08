package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class EsGarcelloTired extends Garcello
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/garcellotired/garcello_tired', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Garcellotired idle dance', 24, false);
		animation.addByPrefix('cough', 'Garcellotired cough', 24, false);
		animation.addByPrefix('singUP', 'Garcellotired Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'Garcellotired Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'Garcellotired Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'Garcellotired Sing Note DOWN0', 24, false);

		animation.addByPrefix('singUP-alt', 'Garcellotired Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT-alt', 'Garcellotired Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT-alt', 'Garcellotired Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN-alt', 'Garcellotired Sing Note DOWN0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		super.createDadAnimationOffsets();

		dad.addOffset('cough',-2, -38);
		dad.addOffset('singUP-alt', -4, -38);
		dad.addOffset('singRIGHT-alt', -10 , -38);
		dad.addOffset('singLEFT-alt',33, -41);
		dad.addOffset('singDOWN-alt', -11, -42);
		

		dad.x -= 50;
		dad.y += 50;
 
	}
	override function createBF()
	{
		super.createBF();
		bf.y += 50;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}


	override function midSongEventUpdate(curBeat:Int)
	{
		switch(curBeat)
		{
			case 7:
				dad.playAnim('cough', true);
				dad.lockAnim(0.35, function()
				{
					dad.dance();
				});

			case 24:
				//annie
				changeDad('annie');

				dad.x -= 250;
				dad.y += 225;

			case 32:
				//gf
				changePc('playable gf');
				bf.y -= 50;
				
			case 41:

				changeDad('fresh');
				dad.x += 100;
				dad.y += 25;

			case 45:
				//dad angel
				changePc('dad angel');
				bf.y += 150;

			case 49:
				changeDad('milf');
				dad.x += 50;
				dad.y += 100;

			case 52:
				changePc('mom angel');
				bf.y += 100;
				
			case 60:
				changeDad('madness');

			case 62:
				changeDad('uganda');
				dad.x -= 450;
				dad.y += 50;

			case 64:
				changeDad('lila');				
				changePc('spooky');

				dad.x -= 200;
				dad.y -= 50;

				bf.x += 200;
				bf.y -= 50;

				case 66:
				changeDad('tom');
				changePc('tord');

				dad.x -= 200;
				bf.x += 250;

			case 68:
				changeDad('guraamelia');

				changePc('botan');

				dad.x -= 250;
				dad.y += 100;


			case 70:
				changeDad('my-battle');
				changePc('blantad');

			case 80:
				changePc('ex gf');
				bf.x += 150;

			case 88:
				changeDad('miku');

				dad.x -= 350;
				dad.y += 25;

			case 95:
				changePc('hex');

			case 105:
				changeDad('pico');
				dad.x += 50;
				dad.y += 225;

			case 111:
				bf.playAnim('jump', true);
				bf.lockAnim(0.35, function()
				{
					dad.dance();
				});
	

			case 113:
				changePc('nene');

			case 120:
				changeDad('lo-fight');
				dad.y += 50;

			case 128:
				changePc('agoti');
				bf.y += 50;
				bf.x += 100;

			case 136:
				changeDad("wocky");

				dad.scale.x = 1;
				dad.scale.y = 1;

				dad.x -= 225;
				dad.y += 25;


			case 152:
				changePc("liz");

			case 158:
				changeDad("sky");
				dad.x -= 100;
				dad.y -= 50;
				
				dad.scale.x = 1.2;
				dad.scale.y = 1.2;


			case 168:
				changeDad("hdsenpaimad");

				dad.scale.x = 1.25;
				dad.scale.y = 1.25;

				dad.y -= 100;

			case 176:
				changePc('tankman');

			case 182:
				changeDad('senpaighosty');

				dad.scale.x = 1;
				dad.scale.y = 1;

				dad.x -= 50;
				dad.y -= 200;



		}

	}

}