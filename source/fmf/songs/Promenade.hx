package fmf.songs;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Promenade extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/entity/nikusa/Nikusa_Sprites', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gamePlayState.defaultCamZoom = 0.75;
		gamePlayState.camFollowSpeed = 1;

		var bg:FlxSprite = new FlxSprite(-911, -555).loadGraphic(Paths.image('bg/entity/NikusaBG', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.35;
		bg.scale.y = 1.335;

		bg.scrollFactor.set(0.95, 0.95);
		gamePlayState.add(bg);

	}

	override function getDefaultSkin():Skin
	{
		return new AgotiSkin();
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Nikusa_Idle0', 24, false);
		animation.addByPrefix('singUP', 'NikusaUp0', 24, false);
		animation.addByPrefix('singRIGHT', 'Nikusa_Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Nikusa_Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Nikusa_Down0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0, 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);

		dad.scale.x = 2;
		dad.scale.y = 2;
		dad.x = -400;
		dad.y = 50;
		dad.dance();

	}
	
	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.visible = false;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gamePlayState.defaultCamZoom = 0.5;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gamePlayState.targetCamFollow.y += 225;
		gamePlayState.defaultCamZoom = 0.75;
	}

	override function createBF()
	{
		super.createBF();
		bf.x += 879;
		bf.y += 364;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/entity/icons/icon-niku', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 2], 0, false, false);
		icon.animation.play("dad");
	}

}