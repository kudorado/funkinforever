package fmf.songs;

import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Parasite extends SongPlayer
{

	var rock:FlxSprite;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/agoti/AGOTI', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.6;

		var dumbShit = new FlxSprite(-1000, -300).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.WHITE);
		dumbShit.scrollFactor.set(1, 1);
		dumbShit.cameras = [playState.camGame];
		playState.add(dumbShit);

		var bg:FlxSprite = new FlxSprite();

		var tex = Paths.getSparrowAtlas('bg/entity/The_void', 'mods');

		bg.frames = tex;
		bg.animation.addByPrefix('init', 'VoidShift', 24, true);
		bg.animation.play('init');

		var fx = bg.width / 2;
		bg.x -= fx;
		bg.y += -400;

		bg.antialiasing = true;
		bg.y += 950;
		bg.x += 650;

		bg.scale.x = 4.5;
		bg.scale.y = 4.5;

		bg.scrollFactor.set(0, 0);

		playState.add(bg);

		var tower:FlxSprite = new FlxSprite(-207, -724).loadGraphic(Paths.image('bg/entity/tower', 'mods'));


		tower.scale.x = 0.8;
		tower.scale.y = 0.8;
		tower.scrollFactor.set(0.7, 0.7);

		playState.add(tower);

		rock = new FlxSprite(-570, -303).loadGraphic(Paths.image('bg/entity/rock', 'mods'));
		rock.scale.x = 1;
		rock.scale.y = 1;
		rock.scrollFactor.set(0.85, 0.85);

		playState.add(rock);


		var stageFront:FlxSprite = new FlxSprite(-1030, -648	).loadGraphic(Paths.image('bg/entity/floor', 'mods'));

		stageFront.scale.x = 1;
		stageFront.scale.y = 1;
		playState.add(stageFront);

		
	}

	override function getDefaultSkin():Skin
	{
		return new AgotiSkin();
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Agoti_Idle', 24, false);
		animation.addByPrefix('singUP', 'Agoti_Up', 24, false);
		animation.addByPrefix('singRIGHT', 'Agoti_Right', 24, false);
		animation.addByPrefix('singLEFT', 'Agoti_Left', 24, false);
		animation.addByPrefix('singDOWN', 'Agoti_Down', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 150);
		dad.addOffset('singUP', 68, 223);
		dad.addOffset('singRIGHT', 41, 89);
		dad.addOffset('singLEFT', 177, 170);
		dad.addOffset('singDOWN', 19, -89);

		dad.scale.x = 2;
		dad.scale.y = 2;

		dad.y += 200;

		dad.dance();

	}

	override function getGFTex():Void
	{
		var tex = Paths.getSparrowAtlas('gf_skins/agoti/GF_rock', 'mods');
		gf.frames = tex;

	}

	override function createGFAnimations()
	{
		var animation = gf.animation;
		animation.addByPrefix('cheer', 'GF Cheer', 24, false);
		animation.addByPrefix('singLEFT', 'GF left note', 24, false);
		animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
		animation.addByPrefix('singUP', 'GF Up Note', 24, false);
		animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
		animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
		animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.addByPrefix('hairBlow', "GF Dancing Beat Hair blowing",  24, true);
		animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
		animation.addByPrefix('scared', 'GF FEAR',	 24);
		gf.animation = animation;
	}

	override function createGFAnimationOffsets()
	{
  
		gf.addOffset('cheer');
		gf.addOffset('sad', -2, -2);
		gf.addOffset('danceLeft', 0, -9);
		gf.addOffset('danceRight', 0, -9);

		gf.addOffset("singUP", 0, 4);
		gf.addOffset("singRIGHT", 0, -20);
		gf.addOffset("singLEFT", 0, -19);
		gf.addOffset("singDOWN", 0, -20);
		gf.addOffset('hairBlow', 45, -8);
		gf.addOffset('hairFall', 0, -9);
		gf.addOffset('scared', -2, -17);

		gf.playAnim('danceRight');

		gf.scale.x = 2;
		gf.scale.y = 2;
		gf.y  -= 100;	
		gf.x += 75;	
		
		// gf.visible = false;

	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
		dad.dance();

    }

	override function createBFAnimationOffsets()
	{
		bf.x += 100;
		bf.y += 50;
		super.createBFAnimationOffsets();
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [50, 51], 0, false, false);
		icon.animation.play("dad");
	}
	var dir:Int = 1; 
	var checkBeat = 12;
	var speed = 16;
	
	override function update(elapsed:Float)
	{
		rock.y -= speed * dir * elapsed;

		if (playState.curBeat % checkBeat == 0 && playState.curBeat > 5)
		{
			dir *= -1;
		}

		super.update(elapsed);
	}


}