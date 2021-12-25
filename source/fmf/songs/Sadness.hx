package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Sadness extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/SadSheet', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        playState.defaultCamZoom = 0.85;
		var bg:FlxSprite = new FlxSprite(157, -426).loadGraphic(Paths.image('bg/blueballs_incident/sadi/sad', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		playState.add(bg);
	}

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('gf_skins/trollge/gf_trollge', 'mods');
		gf.frames = tex;
	}


	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'TrollfaceIdle00', 18, false);
		animation.addByPrefix('singUP', 'TrollfaceUp00', 24, false);
		animation.addByPrefix('singRIGHT', 'TrollfaceRight00', 24, false);
		animation.addByPrefix('singLEFT', 'TrollfaceLeft00', 24, false);
		animation.addByPrefix('singDOWN', 'TrollfaceDown00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 23);

		dad.addOffset('singUP', -41, 21);
		dad.addOffset('singRIGHT', 81, 8);
		dad.addOffset('singLEFT', 72, 6);
		dad.addOffset('singDOWN', -19, -30);
		dad.dance();
        dad.scale.x = 1.2;
        dad.scale.y = 1.2;
		dad.x = 722;
		dad.y = 250;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y = 494;
		bf.x = 1613;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
        gf.x = 1246;
		gf.y = 82;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		playState.targetCamFollow.y -= 50;
		playState.defaultCamZoom = 0.85;

	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowBF();

		playState.defaultCamZoom = 0.7;
		playState.targetCamFollow.x += 150;
		playState.targetCamFollow.y += 25;

	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/blueballs', 'mods'), true, 150, 150);
		icon.animation.add('dad', [25, 26], 0, false, false);
		icon.animation.play("dad");
	}

}
