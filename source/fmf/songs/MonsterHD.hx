package fmf.songs;

import reactor.*;
import ui.*;
import fmf.characters.*;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class MonsterHD extends SpookeezHD
{
	override function getDadVersion()
	{
		return new CharacterPE('monster');
	}

	override function createGF()
	{
		super.createGF();
        gf.visible = false;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/week_hd/icons/icon-monster', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}
