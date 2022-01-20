package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Kapi extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/kapi/kapi', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var daBG = GameState.CURRENT_SONG == 'wocky' ? "stageback" : 'sunset';


		var bg:FlxSprite = new FlxSprite(-500, -200).loadGraphic(Paths.image('bg/kapi/' + daBG, 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		gameState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-400, 550).loadGraphic(Paths.image('bg/kapi/stagefront', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		gameState.add(stageFront);
		
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Kapi idle dance', 24);
		animation.addByPrefix('singUP', 'Kapi Sing Note UP0', 24);
		animation.addByPrefix('singRIGHT', 'Kapi Sing Note RIGHT0', 24);
		animation.addByPrefix('singDOWN', 'Kapi Sing Note DOWN0', 24);
		animation.addByPrefix('singLEFT', 'Kapi Sing Note LEFT0', 24);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('idle');
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);

		dad.dance();

	}

	override function getGFTex():Void
	{
		var tex = Paths.getSparrowAtlas('gf_skins/kapi/GF_assets', 'mods');
		gf.frames = tex;

	}

	override function createGFAnimations()
	{
		var animation = gf.animation;
		animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
	
		gf.animation = animation;
	}

	override function createGFAnimationOffsets()
	{

		gf.addOffset('danceLeft', 0, -9);
		gf.addOffset('danceRight', 0, -9);

		gf.scale.x = 0.65; 
		gf.scale.y = 0.65;

		gf.y -= 50;	
		gf.x += 75;	

	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
		dad.dance();

		dad.x += 125;
		dad.y += 185;

		dad.scale.x = 0.65;
		dad.scale.y = 0.65;

		dad.scrollFactor.set(0.95, 0.95);

    }

	override function createBFAnimationOffsets()
	{

		// bf.x += 100;

		bf.scale.x *= 0.75;
		bf.scale.y *= 0.75;

		super.createBFAnimationOffsets();

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/kapi/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [12, 13], 0, false, false);
		icon.animation.play("dad");
	}
 
}