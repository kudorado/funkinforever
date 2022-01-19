package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
//import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Meltdown extends Sabotage	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sus/impostor2', 'mods');
		dad.frames = tex;
	}

    // override function getBFTex() {
    //     var tex = Paths.getSparrowAtlas('pc/bf/bfghost', 'mods');
	// 	bf.frames = tex;
    // }

    override function loadMap()
    {

        gamePlayState.defaultCamZoom = 0.8;

        var bg1:FlxSprite = new FlxSprite(0, -300).loadGraphic(Paths.image('bg/impostor/red/polusSky', 'mods'));
        bg1.antialiasing = true;
        bg1.scale.y = 1.4;
        bg1.scale.x = 1.4;
        gamePlayState.add(bg1);

        

        var bg3:FlxSprite = new FlxSprite(-100, -100).loadGraphic(Paths.image('bg/impostor/red/polusrocks', 'mods'));
        bg3.antialiasing = true;
        bg3.scale.y = 1;
        bg3.scale.x = 1;
        bg3.scrollFactor.set(0.6,0.6);
        gamePlayState.add(bg3);


        var bg2:FlxSprite = new FlxSprite(200, 150).loadGraphic(Paths.image('bg/impostor/red/polusWarehouse', 'mods'));
        bg2.antialiasing = true;
        bg2.scale.y = 1;
        bg2.scale.x = 1;
        bg2.scrollFactor.set(0.8,0.8);
        gamePlayState.add(bg2);
        

        var bg3:FlxSprite = new FlxSprite(-250, 300).loadGraphic(Paths.image('bg/impostor/red/polusHills', 'mods'));
        bg3.antialiasing = true;
        bg3.scale.y = 1;
        bg3.scale.x = 1;
        bg3.scrollFactor.set(0.8,0.8);
        gamePlayState.add(bg3);

        var crowd:FlxSprite = new FlxSprite(250, 350).loadGraphic(Paths.image('bg/impostor/red/crowd', 'mods'));
        crowd.antialiasing = true;
        crowd.scale.y = 1;
        crowd.scale.x = 1;
        gamePlayState.add(crowd);

        var bg4:FlxSprite = new FlxSprite(-0, 600).loadGraphic(Paths.image('bg/impostor/red/polusGround', 'mods'));
        bg4.antialiasing = true;
        bg4.scale.y = 1.4;
        bg4.scale.x = 1.4;
        gamePlayState.add(bg4);

        var bfdead:FlxSprite = new FlxSprite(900, 750).loadGraphic(Paths.image('bg/impostor/red/bfdead', 'mods'));
        bfdead.antialiasing = true;
        bfdead.scale.y = 1;
        bfdead.scale.x = 1;
        gamePlayState.add(bfdead);
    }

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'impostor idle', 18, false);
		animation.addByPrefix('singUP', 'impostor up', 24, false);
		animation.addByPrefix('singDOWN', 'impostor down', 24, false);
		animation.addByPrefix('singLEFT', 'imposter left', 24, false);
		animation.addByPrefix('singRIGHT', 'impostor right', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset("singUP", -5, 40);
		dad.addOffset("singRIGHT", -39, 8);
		dad.addOffset("singLEFT", 95, -4);
		dad.addOffset("singDOWN", -25, -12);
		dad.dance();
        dad.scale.x = 0.8;
        dad.scale.y = 0.8;

		dad.x -= 200;
		dad.y += 300;
	}
}