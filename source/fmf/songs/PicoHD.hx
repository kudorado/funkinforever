package fmf.songs;

import reactor.*;
import ui.*;
import fmf.characters.*;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;

class PicoHD extends SongPlayerHD
{
	var cameraTwn:FlxTween;

	var phillyCityLights:FlxTypedGroup<FlxSprite>;
	var phillyTrain:FlxSprite;
	var trainSound:FlxSound;

	var trainMoving:Bool = false;
	var trainFrameTiming:Float = 0;

	var trainCars:Int = 8;
	var trainFinishing:Bool = false;
	var trainCooldown:Int = 0;

	var startedMoving:Bool = false;

	var curLight:Int = 0;

	override function loadLua()
	{
	}

	function trainStart():Void
	{
		if (FlxG.save.data.distractions)
		{
			trainMoving = true;
			if (!trainSound.playing)
				trainSound.play(true);
		}
	}

	function updateTrainPos():Void
	{
		if (FlxG.save.data.distractions)
		{
			if (trainSound.time >= 4700)
			{
				startedMoving = true;
				gf.playAnim('hairBlow');
			}

			if (startedMoving)
			{
				// //@notrace("moving: " + phillyTrain.x);

				phillyTrain.x -= 400;

				if (phillyTrain.x < -2000 && !trainFinishing)
				{
					phillyTrain.x = -1150;
					trainCars -= 1;

					if (trainCars <= 0)
						trainFinishing = true;
				}

				if (phillyTrain.x < -4000 && trainFinishing)
					trainReset();
			}
		}
	}

	function trainReset():Void
	{
		if (FlxG.save.data.distractions)
		{
			gf.playAnim('hairFall');

			phillyTrain.x = FlxG.width + 200;
			trainMoving = false;
			trainSound.stop();
			trainSound.time = 0;

			trainCars = 8;
			trainFinishing = false;
			startedMoving = false;

			new FlxTimer().start(0.5, function(tmr:FlxTimer)
			{
				gf.playAnim('danceRight');
			});
		}
	}

	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('bg/week_hd/week3/philly/sky', 'mods'));
		bg.scrollFactor.set(0.1, 0.1);
		gameState.add(bg);

		var city:FlxSprite = new FlxSprite(-10).loadGraphic(Paths.image('bg/week_hd/week3/philly/city', 'mods'));
		city.scrollFactor.set(0.3, 0.3);
		city.setGraphicSize(Std.int(city.width * 0.85));
		city.updateHitbox();
		gameState.add(city);

		phillyCityLights = new FlxTypedGroup<FlxSprite>();
		if (FlxG.save.data.distractions)
		{
			gameState.add(phillyCityLights);
		}

		for (i in 0...5)
		{
			var light:FlxSprite = new FlxSprite(city.x).loadGraphic(Paths.image('bg/week_hd/week3/philly/win' + i, 'mods'));
			light.scrollFactor.set(0.3, 0.3);
			light.visible = false;
			light.setGraphicSize(Std.int(light.width * 0.85));
			light.updateHitbox();
			light.antialiasing = true;
			phillyCityLights.add(light);
		}

		var streetBehind:FlxSprite = new FlxSprite(0, 50).loadGraphic(Paths.image('bg/week_hd/week3/philly/behindTrain', 'mods'));
		gameState.add(streetBehind);

		phillyTrain = new FlxSprite(2000, 360).loadGraphic(Paths.image('bg/week_hd/week3/philly/train', 'mods'));

		if (FlxG.save.data.distractions)
		{
			gameState.add(phillyTrain);
		}

		trainSound = new FlxSound().loadEmbedded(Paths.sound('train_passes'));
		FlxG.sound.list.add(trainSound);

		var street:FlxSprite = new FlxSprite(0, streetBehind.y).loadGraphic(Paths.image('bg/week_hd/week3/philly/street', 'mods'));
		street.scale.x = 1;
		gameState.add(street);
	}

	override function getDadVersion()
	{
		return new CharacterPE('pico');
    }

    override function getGFVersion()
    {
        return new CharacterPE('gf-pico');
    }

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x -= 100;
		gameState.defaultCamZoom = 1;
		gameState.targetCamFollow.y -= 80;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x += 100;
		gameState.defaultCamZoom = 1;
		gameState.targetCamFollow.y -= 80;
	}

	override function midSongEventUpdate(curBeat:Int):Void
	{
		if (gameState.gfStep())
		{
			switch (GameState.CURRENT_SONG)
			{
				case 'pico':
					picoMidSongEvent(curBeat);

				case 'philly':
					phillyMidSongEvent(curBeat);

				case 'blammed':
					blammedMidSongEvent(curBeat);
			}
		}

		updateTrain(curBeat);
	}

	function updateTrain(curBeat:Int)
	{
		if (!trainMoving)
			trainCooldown += 1;

		if (curBeat % 4 == 0)
		{
			phillyCityLights.forEach(function(light:FlxSprite)
			{
				light.visible = false;
			});

			curLight = FlxG.random.int(0, phillyCityLights.length - 1);

			phillyCityLights.members[curLight].visible = true;
		}

		if (curBeat % 8 == 4 && FlxG.random.bool(30) && !trainMoving && trainCooldown > 8)
		{
			if (FlxG.save.data.distractions)
			{
				trainCooldown = FlxG.random.int(-4, 0);
				trainStart();
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (trainMoving)
		{
			// //@notrace('update train: ' + elapsed);
			trainFrameTiming += elapsed;

			if (trainFrameTiming >= 1 / 24)
			{
				updateTrainPos();
				trainFrameTiming = 0;
			}
		}
	}

	function picoMidSongEvent(curBeat:Int)
	{
		if (curBeat < 250)
		{
			// Beats to skip or to stop GF from cheering
			if (curBeat != 184 && curBeat != 216)
			{
				if (curBeat % 16 == 8 && curBeat >= 32 && !trainMoving)
				{
					gf.playAnimForce('cheer', 0.5);
				}
			}
		}
	}

	function phillyMidSongEvent(curBeat:Int)
	{
		if (curBeat < 250)
		{
			// Beats to skip or to stop GF from cheering
			if (curBeat != 184 && curBeat != 216)
			{
				if (curBeat % 16 == 8 && !trainMoving)
				{
					gf.playAnimForce('cheer', 0.5);
				}
			}
		}
	}

	function blammedMidSongEvent(curBeat:Int)
	{
		if (curBeat > 30 && curBeat < 190)
		{
			if (curBeat < 90 || curBeat > 128)
			{
				if (curBeat % 4 == 2)
				{
					gf.playAnimForce('cheer', 0.5);
				}
			}
		}
	}

	override function createGF()
	{
		super.createGF();
		gf.y += 80;
	}

	override function createBF(){
		super.createBF();
		bf.y += 80;
	}

	override function createDad(){
		super.createDad();
		dad.y += 80;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/finnandjake/icon-jake', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}
