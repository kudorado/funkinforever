package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import fmf.songs.Clown;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class HellClown extends  Clown
{
	public override function createStaticBG()
	{
		tstatic = new FlxSprite(0, 0).loadGraphic(Paths.image('TrickyStatic', 'shared'), true, 320, 180);

		tstatic.antialiasing = true;
		tstatic.scrollFactor.set(0, 0);
		tstatic.setGraphicSize(Std.int(tstatic.width * 10));

		tstatic.screenCenter(X);
		tstatic.screenCenter(Y);
		tstatic.animation.add('static', [0, 1, 2], 24, true);
		tstatic.animation.play('static');

		tstatic.alpha = 0;
		gameState.add(tstatic);
	}

	public override function createSpookyText(text:String, x:Float = -1111111111111, y:Float = -1111111111111):Void
	{
		spookySteps = gameState.curStep;
		spookyRendered = true;
		tstatic.alpha = 0.5;
		FlxG.sound.play(Paths.sound('staticSound', 'preload'));
		spookyText = new FlxText(FlxG.random.float(x + 40, x + 120), FlxG.random.float(y + 200, y));
		spookyText.setFormat("Impact", 128, FlxColor.RED);
		spookyText.size = 250;
		spookyText.x += 50;
		spookyText.bold = true;
		spookyText.text = text;

		gameState.add(spookyText);
	}
}