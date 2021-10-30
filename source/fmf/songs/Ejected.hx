package fmf.songs;

import lime.math.BGRA;
import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Ejected extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sus/parasite', 'mods');
		dad.frames = tex;
	}

    override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/parachute/gf_parachute', 'mods');
		gf.frames = text;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.7;

		var bg1:FlxSprite = new FlxSprite(-1000, -1200).loadGraphic(Paths.image('bg/sus/ejected1/sky', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1;
		bg1.scale.x = 1;
		playState.add(bg1);

        var fgClouds:FlxSprite = new FlxSprite(-1150, 500).loadGraphic(Paths.image('bg/sus/ejected1/fgClouds', 'mods'));
		fgClouds.antialiasing = true;
		fgClouds.scale.y = 1;
		fgClouds.scale.x = 1;
		playState.add(fgClouds);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Mungus idle00', 18, false);
		animation.addByPrefix('singUP', 'Parasite up new00', 24, false);
		animation.addByPrefix('singDOWN', 'Paracite down00', 24, false);
		animation.addByPrefix('singLEFT', 'Parasite left00', 24, false);
		animation.addByPrefix('singRIGHT', 'Parasite right new00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -0, -0);
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", -0, -0);
		dad.addOffset("singLEFT", 0, -0);
		dad.addOffset("singDOWN", 0, -0);
		dad.dance();

		dad.scale.x = 2;
		dad.scale.y = 2;
		dad.x -= 500;
		dad.y += 425;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.scale.x = 1;
        gf.scale.y = 1;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 150;
        bf.y += 350;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/impostor/red/iconGrid','mods'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		playState.camFollow.x = bf.getMidpoint().x - 240;
		playState.camFollow.y = bf.getMidpoint().y - 150;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		playState.camFollow.x = bf.getMidpoint().x - 500;
		playState.camFollow.y = bf.getMidpoint().y - 150;
	}

}