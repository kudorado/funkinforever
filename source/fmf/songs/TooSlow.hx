package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TooSlow extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sonic/SonicAssets', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.95;
		var sky:FlxSprite = new FlxSprite(-286, -42).loadGraphic(Paths.image('bg/sonic/Sonic_Stages/sky', 'mods'));
		sky.antialiasing = true;

		sky.scale.x = 1.35;
		sky.scale.y = 1.35;

		sky.scrollFactor.set(0.95, 0.95);
		playState.add(sky);

        var floor2:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/Sonic_Stages/floor2', 'mods'));
		floor2.antialiasing = true;

		floor2.scale.x = 1;
		floor2.scale.y = 1;

		floor2.scrollFactor.set(0.95, 0.95);
		playState.add(floor2);

        var floor1:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/Sonic_Stages/floor1', 'mods'));
		floor1.antialiasing = true;

		floor1.scale.x = 1;
		floor1.scale.y = 1;

		floor1.scrollFactor.set(0.95, 0.95);
		playState.add(floor1);

        var eggman:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/Sonic_Stages/eggman', 'mods'));
		eggman.antialiasing = true;

		eggman.scale.x = 1;
		eggman.scale.y = 1;

		eggman.scrollFactor.set(0.95, 0.95);
		playState.add(eggman);

        var knuckle:FlxSprite = new FlxSprite(303, -99).loadGraphic(Paths.image('bg/sonic/Sonic_Stages/knuckle', 'mods'));
		knuckle.antialiasing = true;

		knuckle.scale.x = 1;
		knuckle.scale.y = 1;

		knuckle.scrollFactor.set(0.95, 0.95);
		playState.add(knuckle);

        var tail:FlxSprite = new FlxSprite(-418, -153).loadGraphic(Paths.image('bg/sonic/Sonic_Stages/tail', 'mods'));
		tail.antialiasing = true;

		tail.scale.x = 1;
		tail.scale.y = 1;

		tail.scrollFactor.set(0.95, 0.95);
		playState.add(tail);

		var sticklol:FlxSprite = new FlxSprite(-237, -271).loadGraphic(Paths.image('bg/sonic/Sonic_Stages/sticklol', 'mods'));
		sticklol.antialiasing = true;

		sticklol.scale.x = 1;
		sticklol.scale.y = 1;

		sticklol.scrollFactor.set(0.95, 0.95);
		playState.add(sticklol);

	}

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'SONICmoveIDLE00', 24, true);
		animation.addByPrefix('singUP', 'SONICmoveUP00', 24, false);
		animation.addByPrefix('singRIGHT', 'SONICmoveRIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'SONICmoveLEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'SONICmoveDOWN00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 11, -30);
		dad.addOffset('singRIGHT', 18, -1);
		dad.addOffset('singLEFT', 179, -4);
		dad.addOffset('singDOWN', 176, -47);

		dad.scale.x = 1.5;
		dad.scale.y = 1.5;
		dad.x = 196;
		dad.y = 196;
		dad.dance();

	}
	
    override function createBF()
    {
        super.createBF();
        bf.x += 75;
        bf.y += 65;

    }

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		playState.targetCamFollow.y += 150;
		playState.defaultCamZoom = 0.9;


	}

	override function dadNoteEvent(noteData:Note)
	{
		super.dadNoteEvent(noteData);
		if (noteData.noteData == 2)
		{
			gf.playAnimForce("scared", 0.35);
		}
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowDad();
		playState.defaultCamZoom = 1;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
        gf.playAnim('idle');
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/sonic/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [24, 25], 0, false, false);
		icon.animation.play("dad");
	}
}