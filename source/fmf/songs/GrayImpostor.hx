package fmf.songs;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class GrayImpostor extends SussusMoogus
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/impostor_v4/gray-crewmate', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'impostor idle00', 24, false);
		animation.addByPrefix('singUP', 'impostor up20', 24, false);
		animation.addByPrefix('singRIGHT', 'impostor right00', 24, false);
		animation.addByPrefix('singLEFT', 'imposter left00', 24, false);
		animation.addByPrefix('singDOWN', 'impostor down00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 160, -107);
		dad.addOffset('singUP', 294, 0);
		dad.addOffset('singRIGHT', 210, -113);
		dad.addOffset('singLEFT', 400, -98);
		dad.addOffset('singDOWN', 280, -124);

		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = 244;
		dad.y = 368;
		dad.dance();

	}

    public override function getDadIcon(icon:HealthIcon)
    {
        icon.loadGraphic(Paths.image('health_icon/impostor_v4/icons/icon-gray-crewmate', 'mods'), true, 150, 150);
        icon.animation.add('dad', [0, 1], 0, false, false);
        icon.animation.play("dad");
    }
}