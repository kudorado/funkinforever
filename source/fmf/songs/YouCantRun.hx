package fmf.songs;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class YouCantRun extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sonic/P2Sonic_Assets', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gamePlayState.defaultCamZoom = 0.85;

        var sky:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/SonicP2/sky', 'mods'));
		sky.antialiasing = true;
		sky.scale.x = 1;
		sky.scale.y = 1;
		sky.scrollFactor.set(0.95, 0.95);
		gamePlayState.add(sky);

        var backtrees:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/SonicP2/backtrees', 'mods'));
		backtrees.antialiasing = true;
		backtrees.scale.x = 1;
		backtrees.scale.y = 1;
		backtrees.scrollFactor.set(0.95, 0.95);
		gamePlayState.add(backtrees);

        var trees:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/SonicP2/trees', 'mods'));
		trees.antialiasing = true;
		trees.scale.x = 1;
		trees.scale.y = 1;
		trees.scrollFactor.set(0.95, 0.95);
		gamePlayState.add(trees);

        var ground:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/SonicP2/ground', 'mods'));
		ground.antialiasing = true;
		ground.scale.x = 1;
		ground.scale.y = 1;
		ground.scrollFactor.set(0.95, 0.95);
		gamePlayState.add(ground);

	}

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'NewPhase2Sonic Idle instance 100', 24, true);
		animation.addByPrefix('singUP', 'NewPhase2Sonic Up instance 100', 24, false);
		animation.addByPrefix('singRIGHT', 'NewPhase2Sonic Right instance 100', 24, false);
		animation.addByPrefix('singLEFT', 'NewPhase2Sonic Left instance 100', 24, false);
		animation.addByPrefix('singDOWN', 'NewPhase2Sonic Down instance 100', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 98);
		dad.addOffset('singUP', 0, 88);
		dad.addOffset('singRIGHT', 0, -92);
		dad.addOffset('singLEFT', 0, -66);
		dad.addOffset('singDOWN', 0, -31);

		dad.scale.x = 2;
		dad.scale.y = 2;
		dad.x = 196;
		dad.y = 319;
		dad.dance();

	}
	
    override function createBF()
    {
        super.createBF();
        bf.x += 75;
        bf.y += 25;

    }

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gamePlayState.targetCamFollow.y += 150;
		gamePlayState.defaultCamZoom = 0.9;


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
		gamePlayState.defaultCamZoom = 1;
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