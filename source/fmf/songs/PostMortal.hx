package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class PostMortal extends DreamOfPeace
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/eteled/austin_assets', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.7;
		var bg:FlxSprite = new FlxSprite(-451, -234).loadGraphic(Paths.image('bg/eteled/glitchhallway', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.35;
		bg.scale.y = 1.35;

		bg.scrollFactor.set(0.95, 0.95);
		playState.add(bg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Austin idle dance00', 24, false);
		animation.addByPrefix('singUP', 'Austin Sing Note UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'Austin Sing Note RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'Austin Sing Note LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'Austin Sing Note DOWN00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 27);
		dad.addOffset('singUP', 35, 30);
		dad.addOffset('singRIGHT', -2, 28);
		dad.addOffset('singLEFT', 243, 27);
		dad.addOffset('singDOWN', -9, 28);

		dad.scale.x = 1.7;
		dad.scale.y = 1.7;
		dad.x = 217;
		dad.y = 294;
		dad.dance();

	}
	
	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/eteled/icons/icon-bf-austin', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 2], 0, false, false);
		icon.animation.play("dad");
	}

}