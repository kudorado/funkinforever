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
import flixel.util.FlxTimer;
import openfl.filters.ShaderFilter;
import flixel.group.FlxGroup.FlxTypedGroup;

class SatinPantiesHD extends SongPlayerHD
{
	var cameraTwn:FlxTween;
	

    var limo:FlxSprite;
	var grpLimoDancers:FlxTypedGroup<BackgroundDancer>;
	var fastCar:FlxSprite;
	var fastCarCanDrive:Bool = true;

	override function loadLua()
	{
	}

	override function loadMap()
	{	
        gameState.defaultCamZoom = 0.8;
        var skyBG:FlxSprite = new FlxSprite(-528, -200).loadGraphic(Paths.image('bg/week_hd/week4/limo/limoSunset', 'mods'));
		skyBG.scrollFactor.set(0.1, 0.1);
        skyBG.scale.x = 1.3;
        skyBG.scale.y = 1.3;
		gameState.add(skyBG);

		var street = new FlxSprite(-1642, 809);
		street.frames = Paths.getSparrowAtlas('bg/week_hd/week4/limo/street', 'mods');
		street.animation.addByPrefix('idle', "street00", 24, true);
		street.animation.play('idle');
		street.antialiasing = true;
        street.scale.x = 1.5;
        street.scale.y = 1.5;
        gameState.add(street);

		var bgLimo:FlxSprite = new FlxSprite(-200, 480);
		bgLimo.frames = Paths.getSparrowAtlas('bg/week_hd/week4/limo/bgLimo', 'mods');
		bgLimo.animation.addByPrefix('drive', "BG limo instance", 24, true);
		bgLimo.animation.play('drive');
		gameState.add(bgLimo);

		// if (FlxG.save.data.distractions)
		// {
		// 	grpLimoDancers = new FlxTypedGroup<BackgroundDancer>();
		// 	gameState.add(grpLimoDancers);

		// 	for (i in 0...5)
		// 	{
		// 		var dancer:BackgroundDancer = new BackgroundDancer((370 * i) + 130, bgLimo.y - 400);
		// 		dancer.scrollFactor.set(0.4, 0.4);
		// 		grpLimoDancers.add(dancer);
		// 	}
		// }

		// var overlayShit:FlxSprite = new FlxSprite(-500, -600).loadGraphic(Paths.image('bg/week_hd/week4/limo/limoOverlay', 'mods'));
		// overlayShit.alpha = 0.5;
		// gameState.add(overlayShit);

		fastCar = new FlxSprite(-1300, 160).loadGraphic(Paths.image('bg/week_hd/week4/limo/fastCarLol', 'mods'));

		if (FlxG.save.data.distractions)
		{
			resetFastCar();
			gameState.add(fastCar);
		}
	}

    function createLimoDriver(){
        limo = new FlxSprite(-390, 550);
		limo.frames = Paths.getSparrowAtlas('bg/week_hd/week4/limo/limoDrive', 'mods');
		limo.animation.addByPrefix('drive', "Limo stage", 24, true);
		limo.animation.play('drive');
		limo.antialiasing = true;
        gameState.add(limo);
    }

    override function createCharacters()
    {
        
        createGF();
		createBF();
		createDad();

		gf.scrollFactor.set(0.95, 0.95);

		gameState.gfGroup.add(gf);
        createLimoDriver();
		gameState.dadGroup.add(dad);
		gameState.boyfriendGroup.add(bf);

		bf.characterAddedEvent();
    }

    private override function getVersion():Character
    {
        return new CharacterPE('bf-car');
    }

    override function createStoryBF()
    { 
        var newPc = new CharacterPE('bf-car');
        changeCharacter(newPc);
    }

	override function getDadVersion()
	{
		return new CharacterPE('mom-car');
	}

    override function getGFVersion()
    {
        return new CharacterPE('gf-car');
    }

	override function createDad()
	{
		super.createDad();
	}


	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x -= 100;
		//gameState.defaultCamZoom = 1;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		//gameState.defaultCamZoom = 1;
        gameState.targetCamFollow.x -= 120;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/finnandjake/icon-jake', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}




    //
    function resetFastCar():Void
    {
        if (FlxG.save.data.distractions)
        {
            fastCar.x = -12600;
            fastCar.y = FlxG.random.int(140, 250);
            fastCar.velocity.x = 0;
            fastCarCanDrive = true;
        }
    }

    function fastCarDrive()
    {
        if (FlxG.save.data.distractions)
        {
            FlxG.sound.play(Paths.soundRandom('carPass', 0, 1), 0.7);

            fastCar.velocity.x = (FlxG.random.int(170, 220) / FlxG.elapsed) * 3;
            fastCarCanDrive = false;
            new FlxTimer().start(2, function(tmr:FlxTimer)
            {
                resetFastCar();
            });
        }
    }

    override function midSongEventUpdate(curBeat:Int):Void
    {
        if (FlxG.save.data.distractions)
        {
            // grpLimoDancers.forEach(function(dancer:BackgroundDancer)
            // {
            //     dancer.dance();
            // });

            if (FlxG.random.bool(10) && fastCarCanDrive)
                fastCarDrive();
        }
    }
    
}
