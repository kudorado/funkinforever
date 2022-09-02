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
import flixel.group.FlxGroup.FlxTypedGroup;


class Guns extends SongPlayer
{	

	var tankWatchtower:BGSprite;
	var tankGround:BGSprite;
	var tankmanRun:FlxTypedGroup<TankmenBG>;
	var foregroundSprites:FlxTypedGroup<BGSprite>;


	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week7/gfTankman', 'mods');
		gf.frames = tex;
	}

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week7/tankmanCaptain', 'mods');
		dad.frames = tex;
	}

	override function createGFAnimations():Void
	{
		var animation = gf.animation;
		animation.addByIndices('sad', 'GF Crying at Gunpoint 0', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
		animation.addByIndices('danceLeft', 'GF Dancing at Gunpoint0', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing at Gunpoint0', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.addByPrefix('idle', 'GF Dancing at Gunpoint0', 24, false);
		animation.addByPrefix('scared', 'GF Crying at Gunpoint 0',	 24);
		gf.animation = animation;
	}


	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'Tankman Idle Dance instance 10', 24, false);
		animation.addByPrefix('singUP', 'Tankman UP note instance 10', 24, false);
		animation.addByPrefix('singRIGHT', 'Tankman Right Note instance 10', 24, false);
		animation.addByPrefix('singLEFT', 'Tankman Note Left instance 10', 24, false);
		animation.addByPrefix('singDOWN', 'Tankman DOWN note instance 10', 24, false);
		animation.addByPrefix('ugh', 'TANKMAN UGH instance 10', 24, false);
		animation.addByPrefix('prettyGood', 'PRETTY GOOD tankman instance 10', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 55, 53);
		dad.addOffset('singRIGHT', 85, -12);
		dad.addOffset('singLEFT', -28, -25);
		dad.addOffset('singDOWN', 56, -104);
		dad.dance();
	}

	override function loadMap()
	{

		gameState.defaultCamZoom = 1;

		var subDirectory = "psychengine/week7/";

		var sky:BGSprite = new BGSprite(subDirectory + 'tankSky', -400, -400, 0, 0);
		gameState.add(sky);

		// if(!ClientPrefs.lowQuality)
		{
			var clouds:BGSprite = new BGSprite(subDirectory + 'tankClouds', FlxG.random.int(-700, -100), FlxG.random.int(-20, 20), 0.1, 0.1);
			clouds.active = true;
			clouds.velocity.x = FlxG.random.float(5, 15);
			gameState.add(clouds);

			var mountains:BGSprite = new BGSprite(subDirectory + 'tankMountains', -300, -20, 0.2, 0.2);
			mountains.setGraphicSize(Std.int(1.2 * mountains.width));
			mountains.updateHitbox();
			gameState.add(mountains);

			var buildings:BGSprite = new BGSprite(subDirectory + 'tankBuildings', -200, 0, 0.3, 0.3);
			buildings.setGraphicSize(Std.int(1.1 * buildings.width));
			buildings.updateHitbox();
			gameState.add(buildings);
		}

		var ruins:BGSprite = new BGSprite(subDirectory + 'tankRuins', -200, 0, .35, .35);
		ruins.setGraphicSize(Std.int(1.1 * ruins.width));
		ruins.updateHitbox();
		gameState.add(ruins);

		// if(!ClientPrefs.lowQuality)
		// {
			var smokeLeft:BGSprite = new BGSprite(subDirectory +'smokeLeft', -200, -100, 0.4, 0.4, ['SmokeBlurLeft'], true);
			gameState.add(smokeLeft);
			var smokeRight:BGSprite = new BGSprite(subDirectory +'smokeRight', 1100, -100, 0.4, 0.4, ['SmokeRight'], true);
			gameState.add(smokeRight);

			tankWatchtower = new BGSprite(subDirectory +'tankWatchtower', 100, 50, 0.5, 0.5, ['watchtower gradient color']);
			gameState.add(tankWatchtower);
		// }

		tankGround = new BGSprite(subDirectory + 'tankRolling', 300, 300, 0.5, 0.5, ['BG tank w lighting'], true);
		gameState.add(tankGround);

		tankmanRun = new FlxTypedGroup<TankmenBG>();
		gameState.add(tankmanRun);

		var ground:BGSprite = new BGSprite(subDirectory + 'tankGround', -420, -150);
		ground.setGraphicSize(Std.int(1.15 * ground.width));
		ground.updateHitbox();
		gameState.add(ground);
		moveTank();

		foregroundSprites = new FlxTypedGroup<BGSprite>();
		foregroundSprites.add(new BGSprite(subDirectory + 'tank0', -500, 650, 1.7, 1.5, ['fg']));
		// if(!ClientPrefs.lowQuality)
		foregroundSprites.add(new BGSprite(subDirectory + 'tank1', -300, 750, 2, 0.2, ['fg']));
		foregroundSprites.add(new BGSprite(subDirectory + 'tank2', 450, 940, 1.5, 1.5, ['foreground']));
		// if(!ClientPrefs.lowQuality)
		foregroundSprites.add(new BGSprite(subDirectory + 'tank4', 1300, 900, 1.5, 1.5, ['fg']));
		foregroundSprites.add(new BGSprite(subDirectory + 'tank5', 1620, 700, 1.5, 1.5, ['fg']));
		// if(!ClientPrefs.lowQuality)
		foregroundSprites.add(new BGSprite(subDirectory + 'tank3', 1300, 1200, 3.5, 2.5, ['fg']));
	}

	var tankX:Float = 400;
	var tankSpeed:Float = FlxG.random.float(5, 7);
	var tankAngle:Float = FlxG.random.int(-90, 45);


	function moveTank(?elapsed:Float = 0):Void
	{
		// if(!inCutscene)
		// {
			tankAngle += elapsed * tankSpeed;
			tankGround.angle = tankAngle - 90 + 15;
			tankGround.x = tankX + 1500 * Math.cos(Math.PI / 180 * (1 * tankAngle + 180));
			tankGround.y = 1300 + 1100 * Math.sin(Math.PI / 180 * (1 * tankAngle + 180));
		// }
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();

	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
	}


	override function createStoryBF()
	{
		// changePc('bf');
		// bf.x = 1306;
		// bf.y = 702;
	}
		
	override function createDad()
	{
		super.createDad();
		dad.x = 78;
		dad.y = 324;
		dad.flipX = !dad.flipX;
	}


	override function createGF()
	{
		super.createGF();
		gf.x = 278;
		gf.y = 188;
	}

	override function createBF()
	{
		super.createBF();
		bf.x += 848 - 700;
		bf.y += 445 - 425;
	}

	var sillyHotBabe:Bool = true;
	var counter:Float;
	var direction:Float = 1;

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		moveTank(elapsed);

		// if (sillyHotBabe)
		// {
		// 	dad.y += Math.sin(100) * direction;
		// 	counter += elapsed;
		// 	if (counter >= 2.5)
		// 	{
		// 		direction *= -1;
		// 		counter = 0;
		// 	}
		// }
	}
	

}