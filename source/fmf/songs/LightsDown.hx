package fmf.songs;
import state.*;
//import js.html.rtc.PeerConnectionIceEvent;
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

		gamePlayState.defaultCamZoom = 0.7;

		var bg1:FlxSprite = new FlxSprite(-50, 100).loadGraphic(Paths.image('bg/sus/sussus_toogus/MiraDark', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.4;
		bg1.scale.x = 1.4;
		gamePlayState.add(bg1);

		

		var vending_machine:FlxSprite = new FlxSprite(1100, 160).loadGraphic(Paths.image('bg/sus/sussus_toogus/vending_machineDark', 'mods'));
		vending_machine.antialiasing = true;
		vending_machine.scale.y = 1.4;
		vending_machine.scale.x = 1.4;
		gamePlayState.add(vending_machine);

	}

	override function addTable(){
		var table:FlxSprite = new FlxSprite(-800, 800).loadGraphic(Paths.image('bg/sus/sussus_toogus/tableDark', 'mods'));
		table.antialiasing = true;
		table.scale.y = 1.4;
		table.scale.x = 1.4;
		gamePlayState.add(table);

		var table2:FlxSprite = new FlxSprite(1500, 850).loadGraphic(Paths.image('bg/sus/sussus_toogus/tableDark', 'mods'));
		table2.antialiasing = true;
		table2.scale.y = 1.4;
		table2.scale.x = 1.4;
		table2.flipX = true;
		gamePlayState.add(table2);

		var bg1:FlxSprite = new FlxSprite(50, 100).loadGraphic(Paths.image('bg/sus/sussus_toogus/MiraGradient', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 2;
		bg1.scale.x = 2;
		gamePlayState.add(bg1);
	}

	override function createCharacters() {
		super.createCharacters();
		addTable();
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

}