package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class InvertedAscension extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/starlingmayhem/cj_assets', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        playState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(0, -396).loadGraphic(Paths.image('bg/starlingmayhem/morning/bg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		playState.add(bg);

        var light0:FlxSprite = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/light0', 'mods'));
		light0.antialiasing = true;
		light0.scale.y = 1;
		light0.scale.x = 1;
		playState.add(light0);

        var bg1:FlxSprite = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/stage', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1;
		bg1.scale.x = 1;
		playState.add(bg1);

        var headlight = new FlxSprite(0, 0);
		headlight.frames = Paths.getSparrowAtlas('bg/starlingmayhem/headlightsRGB', 'mods');
		headlight.animation.addByPrefix('idle', 'Lightsrepeated00', 24, true);
		headlight.animation.play('idle');
		headlight.antialiasing = true;
        headlight.scale.x = 2;
        headlight.scale.y = 2;
		headlight.x = 657;
		headlight.y = -128;
        playState.add(headlight);

        var headlight = new FlxSprite(0, 0);
		headlight.frames = Paths.getSparrowAtlas('bg/starlingmayhem/frontboppers', 'mods');
		headlight.animation.addByPrefix('idle', 'frontboppers000', 24, true);
		headlight.animation.play('idle');
		headlight.antialiasing = true;
        headlight.scale.x = 1;
        headlight.scale.y = 1;
		headlight.x = 0;
		headlight.y = 753;
        playState.add(headlight);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Cj idle dance00', 18, false);
		animation.addByPrefix('singUP', 'Cj Sing Note UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'Cj Sing Note RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'Cj Sing Note LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'Cj Sing Note DOWN00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0 , 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
        dad.scale.x = 1.9;
        dad.scale.y = 1.9;
		dad.x = 809;
		dad.y = 66;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y = 313;
		bf.x = 1613;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = 43;
        gf.x = 972;
	}

	override function updateCamFollowBF()
	{
		playState.camFollow.x = gf.getGraphicMidpoint().x + 120;
		playState.camFollow.y = 360;

	}

	override function updateCamFollowDad()
	{
		playState.camFollow.x = gf.getGraphicMidpoint().x - 120;
		playState.camFollow.y = 360;

	}
}
