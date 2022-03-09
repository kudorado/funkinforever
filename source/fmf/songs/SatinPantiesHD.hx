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
        var skyBG:FlxSprite = new FlxSprite(-120, -50).loadGraphic(Paths.image('limo/limoSunset', 'week4'));
		skyBG.scrollFactor.set(0.1, 0.1);
		gameState.add(skyBG);

		var bgLimo:FlxSprite = new FlxSprite(-200, 480);
		bgLimo.frames = Paths.getSparrowAtlas('limo/bgLimo', 'week4');
		bgLimo.animation.addByPrefix('drive', "background limo pink", 24);
		bgLimo.animation.play('drive');
		bgLimo.scrollFactor.set(0.4, 0.4);
		gameState.add(bgLimo);
		if (FlxG.save.data.distractions)
		{
			grpLimoDancers = new FlxTypedGroup<BackgroundDancer>();
			gameState.add(grpLimoDancers);

			for (i in 0...5)
			{
				var dancer:BackgroundDancer = new BackgroundDancer((370 * i) + 130, bgLimo.y - 400);
				dancer.scrollFactor.set(0.4, 0.4);
				grpLimoDancers.add(dancer);
			}
		}

		var overlayShit:FlxSprite = new FlxSprite(-500, -600).loadGraphic(Paths.image('limo/limoOverlay', 'week4'));
		overlayShit.alpha = 0.5;
		gameState.add(overlayShit);

		// var shaderBullshit = new BlendModeEffect(new OverlayShader(), FlxColor.RED);

		// FlxG.camera.setFilters([new ShaderFilter(cast shaderBullshit.shader)]);

		// overlayShit.blend = shaderBullshit;

		var limoTex = Paths.getSparrowAtlas('limo/limoDrive', 'week4');

		limo = new FlxSprite(-120, 550);
		limo.frames = limoTex;
		limo.animation.addByPrefix('drive', "Limo stage", 24);
		limo.animation.play('drive');
		limo.antialiasing = true;

		fastCar = new FlxSprite(-300, 160).loadGraphic(Paths.image('limo/fastCarLol', 'week4'));

		if (FlxG.save.data.distractions)
		{
			resetFastCar();
			gameState.add(fastCar);
		}
	}

	override function midSongEventUpdate(curBeat:Int):Void
	{
		//updateBG(curBeat);
	}

	function updateBG(curBeat:Int)
	{
		if (curBeat % 32 == 0)
		{
			bg.animation.play('lightning');
		}
	}

	function createOverlay()
	{
		var stageFront:FlxSprite = new FlxSprite(-400, 569).loadGraphic(Paths.image('bg/week_hd/week2/overlay', 'mods'));
		stageFront.antialiasing = true;
		stageFront.scale.x = 3;
		stageFront.scale.y = 3;
		gameState.add(stageFront);
	}

	override function createCharacters() {
		super.createCharacters();
		//createOverlay();
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
		gameState.defaultCamZoom = 1;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x += 100;
		gameState.defaultCamZoom = 1;
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
            grpLimoDancers.forEach(function(dancer:BackgroundDancer)
            {
                dancer.dance();
            });

            if (FlxG.random.bool(10) && fastCarCanDrive)
                fastCarDrive();
        }
    }
    
}
