package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class  MySweets extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/dokidoki/Doki_Nat_Assets', 'mods');
		dad.frames = tex;
	}

    override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/dokidoki/DDLCGF_ass_sets', 'mods');
		gf.frames = text;
	}

    override function createGFAnimations()
    {
        gf.animation.addByPrefix("idle", 'GF Dancing Beat', true);
        gf.animation.addByPrefix('sad', 'Gf sad00');
        gf.playAnim("idle");
    }


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;
		var bg:FlxSprite = new FlxSprite(-338, -322).loadGraphic(Paths.image('bg/dokidoki/sayori/DDLCfarbg', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.62;
		bg.scale.y = 1.62;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg);


        var bg1:FlxSprite = new FlxSprite(-338, -322).loadGraphic(Paths.image('bg/dokidoki/sayori/DDLCbg', 'mods'));
		bg1.antialiasing = true;

		bg1.scale.x = 1.62;
		bg1.scale.y = 1.62;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg1);

		createSayori();
		createYuri();
	}

	function createSayori() {
		var sayori = new FlxSprite(0, 0);
		sayori.frames = Paths.getSparrowAtlas('bg/dokidoki/bgdoki/sayori', 'mods');
		
		sayori.animation.addByPrefix('idle', 'Sayori', 18, true);
		sayori.animation.play('idle');
		sayori.antialiasing = true;

		sayori.scale.x = 0.68;
		sayori.scale.y = 0.68;
		
		sayori.x = 871;
		sayori.y = 82;

		if (FlxG.save.data.distractions)
		{
			gameState.add(sayori);
		}
	}

	function createYuri() {
		var yuri = new FlxSprite(0, 0);
		yuri.frames = Paths.getSparrowAtlas('bg/dokidoki/bgdoki/yuri', 'mods');
		
		yuri.animation.addByPrefix('idle', 'Yuri BG00', 18, true);
		yuri.animation.play('idle');
		yuri.antialiasing = true;

		yuri.scale.x = 0.68;
		yuri.scale.y = 0.68;
		
		yuri.x = -82;
		yuri.y = -28;

		if (FlxG.save.data.distractions)
		{
			gameState.add(yuri);
		}
	}

    override function createCharacters() {
		super.createCharacters();
		addTable();
	}

    function addTable(){
		var table:FlxSprite = new FlxSprite(-338, -322).loadGraphic(Paths.image('bg/dokidoki/sayori/DesksFront', 'mods'));
		table.antialiasing = true;
		table.scale.y = 1.62;
		table.scale.x = 1.62;
		gameState.add(table);
	}

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'Nat Idle', 18, false);
        animation.addByPrefix('singUP', 'Nat Sing Note Up', 24, false);
        animation.addByPrefix('singRIGHT', 'Nat Sing Note Right', 24, false);
        animation.addByPrefix('singLEFT', 'Nat Sing Note Left', 24, false);
        animation.addByPrefix('singDOWN', 'Nat Sing Note DOWN', 24, false);
        dad.animation = animation;

    }

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle',0, 0);
		dad.addOffset('singDOWN', 26, -26);
		dad.addOffset('singRIGHT', -64, 6);
		dad.addOffset('singUP', 29, 0);
		dad.addOffset('singLEFT', -32, -32);
		dad.dance();
		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = -2;
		dad.y = 186;

	}

	override function createStoryBF()
	{
		changePc('bf_ddlc');
		bf.y -= 93;
        bf.x += 39;
	}
	
    override function createBF()
    {
        super.createBF();
        bf.y -= 93;
        bf.x += 39;
    }

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.scale.x = 2;
		gf.scale.y = 2;
	}

    override function updateCamFollowBF()
    {
        super.updateCamFollowBF();
        gameState.targetCamFollow.y -= 100;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/impostor_v4/icons/icon-black-run', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}