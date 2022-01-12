package fmf.songs;
import state.*;
//import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class SussusToogus extends SongPlayer	
{
    
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sus/crewmate', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gamePlayState.defaultCamZoom = 0.7;

		var bg1:FlxSprite = new FlxSprite(-50, 100).loadGraphic(Paths.image('bg/sus/sussus_toogus/Mira', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.4;
		bg1.scale.x = 1.4;
		gamePlayState.add(bg1);

		

		var vending_machine:FlxSprite = new FlxSprite(1100, 160).loadGraphic(Paths.image('bg/sus/sussus_toogus/vending_machine', 'mods'));
		vending_machine.antialiasing = true;
		vending_machine.scale.y = 1.4;
		vending_machine.scale.x = 1.4;
		gamePlayState.add(vending_machine);

	}

	function addTable(){
		var table:FlxSprite = new FlxSprite(-800, 800).loadGraphic(Paths.image('bg/sus/sussus_toogus/table', 'mods'));
		table.antialiasing = true;
		table.scale.y = 1.4;
		table.scale.x = 1.4;
		gamePlayState.add(table);

		var table2:FlxSprite = new FlxSprite(1500, 850).loadGraphic(Paths.image('bg/sus/sussus_toogus/table', 'mods'));
		table2.antialiasing = true;
		table2.scale.y = 1.4;
		table2.scale.x = 1.4;
		table2.flipX = true;
		gamePlayState.add(table2);
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
		dad.addOffset('idle', -83, -27);
		dad.addOffset("singUP", 49, 67);
		dad.addOffset("singRIGHT", -61, -40);
		dad.addOffset("singLEFT", 116, -21);
		dad.addOffset("singDOWN", 21, -53);
		dad.dance();

		dad.scale.x = 0.9;
		dad.scale.y = 0.9;
		dad.x -= 500;
		dad.y += 225;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		
		bf.x += 50;
        bf.y += 50;
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
		gamePlayState.targetCamFollow.x = bf.getMidpoint().x - 160;
		gamePlayState.targetCamFollow.y = bf.getMidpoint().y - 150;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gamePlayState.targetCamFollow.x = bf.getMidpoint().x - 300;
		gamePlayState.targetCamFollow.y = bf.getMidpoint().y - 150;
	}

}