package state;
import ui.*;
import state.*;
import ui.Controller;
import extension.admob.AdMob;

import openfl.Lib;

import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

using StringTools;


class GachaState extends MusicBeatState
{
	
	public override function create()
	{
		AdMob.hideBanner();	


		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.GREEN);
		bg.alpha = 1;
		bg.scrollFactor.set();
		bg.screenCenter();
		bg.scaleToFit();


		add(bg);

		trace('42');

		Controller.init(this, NONE, A_B);
		super.create();



	}

	override function update(elapsed:Float)
	{

		trace('56');

		super.update(elapsed);
		var accepted =  Controller._pad != null && Controller.ACCEPT;

		trace('61');

		if (accepted)
		{
		
		}

	}

}