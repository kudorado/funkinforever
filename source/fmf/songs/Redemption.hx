package fmf.songs;
import state.*;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Redemption extends Sadness	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/trollgephase4', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        gamePlayState.defaultCamZoom = 1;

		whito.loadGraphic(Paths.image('bg/blueballs_incident/redemp/white', 'mods'));
		whito.antialiasing = true;
		gamePlayState.add(whito);

		whito2.loadGraphic(Paths.image('bg/blueballs_incident/redemp/white', 'mods'));
		whito2.antialiasing = true;
		whito2.alpha = 0;
		
		soe.loadGraphic(Paths.image('bg/blueballs_incident/redemp/sad', 'mods'));
		soe.antialiasing = true;
		soe.scrollFactor.set(0.9, 0.9);
		soe.y -= 100;
		
		soe.active = false;
		gamePlayState.add(soe);
		
		sur.loadGraphic(Paths.image('bg/blueballs_incident/redemp/foreground', 'mods'));
		sur.active = false;
		gamePlayState.add(sur);

		sura.loadGraphic(Paths.image('bg/blueballs_incident/redemp/aaa', 'mods'));
		// sura.active = false;
		sura.alpha = 0;
		
		gfanim.frames = Paths.getSparrowAtlas('bg/blueballs_incident/redemp/gfanim', 'mods');
		gfanim.animation.addByPrefix('Symbol 1','Symbol 1',12, false);
		gfanim.antialiasing = true;
		gfanim.alpha = 0;
		gfanim.x = 1270;
		gfanim.y = 91;
	
		gamePlayState.add(gfanim);

		bfanim.frames = Paths.getSparrowAtlas('bg/blueballs_incident/redemp/bfanim', 'mods');
		bfanim.animation.addByPrefix('BF idle dance','BF idle dance',12, false);
		bfanim.antialiasing = true;
		gamePlayState.add(bfanim);
		bfanim.alpha = 0;
		bfanim.x = 1513;
		bfanim.y = 496;

		gamePlayState.add(sura); 
		gamePlayState.add(whito2);

	}



	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'IncidentSadSIdle0', 12, false);
		animation.addByPrefix('singUP', 'IncidentSadSing0', 24, false);
		animation.addByPrefix('singRIGHT', 'IncidentSadSing0', 24, false);
		animation.addByPrefix('singLEFT', 'IncidentSadSing0', 24, false);
		animation.addByPrefix('singDOWN', 'IncidentSadSing0', 24, false);
		animation.addByPrefix('speak', 'IncidentSadSpeaking0', 24, false);
		animation.addByPrefix('smile', 'IncidentSadSmile0', 24, false);

		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0, 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
		dad.addOffset('talk', 0, 0);

		dad.dance();
        dad.scale.x = 1.2;
        dad.scale.y = 1.2;
		dad.x = 702;
		dad.y = 315;
	
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowBF();

		gamePlayState.defaultCamZoom = 0.7;
		gamePlayState.targetCamFollow.x += 150;
		gamePlayState.targetCamFollow.y -= 100;
	}

	override function midSongStepUpdate()
	{
		switch (gamePlayState.curStep)
		{
			case 2 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 22 | 24 | 26 | 28 | 30 | 32 | 34 | 36 | 44 | 47 | 50 | 53 | 56 | 59 | 62 | 65 | 68 | 73 | 76 | 79 | 82 | 99 | 103 | 106 | 109 | 112 | 115 | 117:
				dad.playAnim("speak", true);
			case 38 | 85 | 120:
				dad.playAnim("idle", false);
			case 92:
				bf.playAnim('singRIGHT');
				gamePlayState.defaultCamZoom = 1;
			case 128:
				gamePlayState.camHUD.alpha = 1;
			case 256 | 288 | 320 | 336 | 352:
				soe.alpha -= 0.1;
			case 360 | 368 | 384:
				sur.alpha -= 0.3;
				soe.alpha -= 0.1;

			case 640:
				new FlxTimer().start(0.3, function(tmr3:FlxTimer)
				{
					dad.alpha -= 0.05;
					if (dad.alpha > 0)
					{
						tmr3.reset(0.1);
					}
				});
			case 672:
				FlxG.camera.flash(0xFFEBEBEB, 3);
				bfanim.alpha = 1;
				gfanim.alpha = 1;
				bf.alpha = 0;
				gf.alpha = 0;
			case 674:
				soe.alpha = 1;
				gamePlayState.defaultCamZoom = 1.2;
				gfanim.animation.play('Symbol 1', false);
				bfanim.animation.play('BF idle dance', false);
			case 700:
				new FlxTimer().start(0.3, function(tmr3:FlxTimer)
				{
					whito2.alpha += 0.1;
					
					if (whito2.alpha < 1)
					{
						tmr3.reset(0.05);
					}
				});
			case 750:
				FlxG.sound.play(Paths.sound('thank'));
				sura.alpha = 1;
			case 790:
				new FlxTimer().start(0.3, function(tmr3:FlxTimer)
				{
					whito2.alpha -= 0.1;
					
					if (whito2.alpha > 0)
					{
						tmr3.reset(0.1);
					}
				});
		}

		if (true)
		{
			switch (gamePlayState.curStep)
			{
				case 256 | 288 | 320 | 336 | 352 | 360 | 368 | 384:
					FlxG.camera.flash(0xFFEBEBEB, 1);
			}
		}

		if (gamePlayState.curStep > 638)
		{
			dad.playAnim("smile", true);
		}	

		if (gamePlayState.curStep > 100)
		{
			gamePlayState.health = 2;
		}
	}

		
}
