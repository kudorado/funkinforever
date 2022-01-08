package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Tabi extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/tabi/TABI', 'mods');
		dad.frames = tex;
	}

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('gf_skins/tabi/GF_Tabi', 'mods');
		gf.frames = tex;
	}

	override function createGFAnimations()
	{
		var animation = gf.animation;
		animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		gf.animation = animation;
	}

	override function createGFAnimationOffsets():Void
	{
		gf.addOffset('danceLeft', 0, -9);
		gf.addOffset('danceRight', 0, -9);

		gf.dance();

		gf.y -= 175;
		gf.x -= 75;
	}

	override function loadMap()
	{
		playState.defaultCamZoom = 0.7;
		var bg:FlxSprite = new FlxSprite(-600, -300).loadGraphic(Paths.image('bg/tabi/normal_stage', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.95, 0.95);

		playState.add(bg);

		#if !mobile
		// PlayState.songOffset = -500;
		#end
	}

	override function getDadVersion():Character
	{
		return new Dad(100, 100);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Dad idle dance0', 18, false);
		animation.addByPrefix('singUP', 'Dad Sing Note UP0', 24, false);
		animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24, false);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 2, -14);

		dad.addOffset("singUP", 32, -19);
		dad.addOffset("singRIGHT", -4, -13);
		dad.addOffset("singLEFT", 60, -19);
		dad.addOffset("singDOWN", -30, -25);
		dad.dance();

		dad.x -= 400;
	}

	override function createBFAnimationOffsets()
	{
		bf.x += 125;
		super.createBFAnimationOffsets();
	}

	public override function createCharacters()
	{
		super.createCharacters();
		
		createFrontObject();
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		playState.targetCamFollow.y -= 50;
			
	}

	private function createFrontObject()
	{
		var sumtable:FlxSprite = new FlxSprite(-600, -300).loadGraphic(Paths.image('bg/tabi/sumtable', 'mods'));
		sumtable.antialiasing = true;
		sumtable.scrollFactor.set(0.95, 0.95);
		playState.add(sumtable);
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [12, 13], 0, false, false);
		icon.animation.play("dad");
	}

}