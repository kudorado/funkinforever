package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BabSwing extends BabJumpIn	
{
  
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bab/swing/bosip_assets', 'mods');
		dad.frames = tex;
	}

	override  function getGFTex() {
		var text = Paths.getSparrowAtlas('pc/bab/gf/bob_gf', 'mods');
		gf.frames = text;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Bosip idle', 24, false);
		animation.addByPrefix('singUP', 'Bosip Sing Note UP00', 24, false);
		animation.addByPrefix('singDOWN', 'Bosip Sing Note DOWN00', 24, false);
		animation.addByPrefix('singLEFT', 'Bosip Sing Note LEFT00', 24, false);
		animation.addByPrefix('singRIGHT', 'Bosip Sing Note RIGHT00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 48);
		dad.addOffset("singUP", 0, 70);
		dad.addOffset("singRIGHT", 0, 28);
		dad.addOffset("singLEFT", 0, 55);
		dad.addOffset("singDOWN", 0, 29);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
		dad.y -= 50;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y += 50;
	}

	override function createBFAnimationOffsets()
	{
		bf.y += 100;
		bf.x += 200;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/bab/iconGrid','mods'), true, 150, 150);
		icon.animation.add('dad', [30,32], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		playState.camFollow.x -= 200;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		playState.camFollow.x += 200;
	}

}