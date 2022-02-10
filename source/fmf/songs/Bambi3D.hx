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

class Bambi3D extends Bambi
{
	override function createBF()
	{
		super.createBF();
		bf.x += 250;
		bf.y += 250;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('psychengine/week_dab/images/icons/icon-bambi_3d', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

	override function getDadVersion()
	{
		return new CharacterPE('bambi_3d');
	}
}