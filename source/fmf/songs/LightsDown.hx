package fmf.songs;

import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class LightsDown extends SussusToogus	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sus/impostor3', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		super.loadMap();
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'impostor idle00', 18, false);
		animation.addByPrefix('singUP', 'impostor up20', 24, false);
		animation.addByPrefix('singDOWN', 'impostor down00', 24, false);
		animation.addByPrefix('singLEFT', 'imposter left00', 24, false);
		animation.addByPrefix('singRIGHT', 'impostor right00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
        dad.addOffset('idle', 0, 0);
		dad.addOffset("singUP", 214, 82);
		dad.addOffset("singRIGHT", -98, -14);
		dad.addOffset("singLEFT", 65, 17);
		dad.addOffset("singDOWN", -81, -20);
		dad.dance();

		dad.scale.x = 0.9;
		dad.scale.y = 0.9;
		dad.x -= 500;
		dad.y += 225;
	}

	// override function createGFAnimationOffsets()
	// {
	// 	super.createGFAnimationOffsets();
		
	// }

	// override function createBFAnimationOffsets()
	// {
	// 	super.createBFAnimationOffsets();
		
	// 	bf.x += 150;
    //     bf.y += 50;
	// }

	// public override function getDadIcon(icon:HealthIcon)
	// {
	// 	icon.loadGraphic(Paths.image('bg/impostor/red/iconGrid','mods'), true, 150, 150);
	// 	icon.animation.add('dad', [26, 27], 0, false, false);
	// 	icon.animation.play("dad");
	// }

	// override function updateCamFollowBF()
	// {
	// 	super.updateCamFollowBF();
	// 	playState.camFollow.x = bf.getMidpoint().x - 240;
	// 	playState.camFollow.y = bf.getMidpoint().y - 150;
	// }

	// override function updateCamFollowDad()
	// {
	// 	super.updateCamFollowDad();
	// 	playState.camFollow.x = bf.getMidpoint().x - 500;
	// 	playState.camFollow.y = bf.getMidpoint().y - 150;
	// }

}