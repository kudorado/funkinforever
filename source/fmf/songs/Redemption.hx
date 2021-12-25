package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Redemption extends Sadness	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/trollgephase4', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        playState.defaultCamZoom = 0.85;
		var bg:FlxSprite = new FlxSprite(157, -426).loadGraphic(Paths.image('bg/blueballs_incident/redemp/sad', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		playState.add(bg);
	}



	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'IncidentSadSIdle0', 8, false);
		animation.addByPrefix('singUP', 'IncidentSadSing0', 6, false);
		animation.addByPrefix('singRIGHT', 'IncidentSadSing0', 6, false);
		animation.addByPrefix('singLEFT', 'IncidentSadSing0', 6, false);
		animation.addByPrefix('singDOWN', 'IncidentSadSing0', 6, false);
		animation.addByPrefix('talk', 'IncidentSadSpeaking0', 6, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0, 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
		dad.addOffset('talk', 0, 0);

		dad.dance();
        dad.scale.x = 1.2;
        dad.scale.y = 1.2;
		dad.x = 702;
		dad.y = 315;
	
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowBF();

		playState.defaultCamZoom = 0.7;
		playState.targetCamFollow.x += 150;
		playState.targetCamFollow.y -= 100;
	}

	override function midSongEventUpdate(curBeat:Int)
	{
		if (curBeat == 2 == 0 && curBeat >= 1 && curBeat != 20 && curBeat != 21 && curBeat < 28)
		{
			dad.playAnim('talk');
		}
	}

		
}
