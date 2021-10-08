package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class HDSenpaiMad extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/hdsenpaimad/HD_SENPAIMAD', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', "Dad idle dance", 24, false);
		animation.addByPrefix('singUP', "Dad Sing Note UP0", 24, false);
		animation.addByPrefix('singDOWN', "Dad Sing Note DOWN0", 24, false);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT0', 24, false);

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
		var tex = Paths.getSparrowAtlas('kapi/GF_assets', 'mods');
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

		bf.x += 100;
		bf.y += 50;

		bf.scale.x *= 0.75;
		bf.scale.y *= 0.75;

		super.createBFAnimationOffsets();
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('kapi/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [12, 13], 0, false, false);
		icon.animation.play("dad");
	}

	public override function setDadMenuCharacter(dad:MenuCharacter)
	{
		super.setDadMenuCharacter(dad);

		var frames = Paths.getSparrowAtlas('whitty/whitty', 'mods');
		dad.frames = frames;

		dad.animation.addByPrefix('dad', "Whitty idle dance BLACK LINE", 24);
		dad.animation.play('dad');
		setMenuCharacter(dad, new CharacterSetting(-200, 25, 1));
	}
}