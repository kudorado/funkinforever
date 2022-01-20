package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.math.FlxRandom;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class KaiqueClown extends Clown
{
	
	public var KaiqueTrickyLinesSing:Array<String> = ["IIMARKY", "IIMARKY"];

	public override function createText(x:Float, y:Float)
	{
		var text:String = KaiqueTrickyLinesSing[FlxG.random.int(0, KaiqueTrickyLinesSing.length - 1)];
		createSpookyText(text, x, y);
	}	

	public override function createStaticBG()
	{
		tstatic = new FlxSprite(0, 0).loadGraphic(Paths.image('TrickyStatic', 'shared'), true, 320, 180);

		tstatic.antialiasing = true;
		tstatic.scrollFactor.set(0, 0);
		tstatic.setGraphicSize(Std.int(tstatic.width * 8.3));
		
		tstatic.screenCenter(Y);
		tstatic.screenCenter(X);

		tstatic.animation.add('static', [0, 1, 2], 24, true);
		tstatic.animation.play('static');

		tstatic.alpha = 0;
		gameState.add(tstatic);
	}

	public override function createSpookyText(text:String, x:Float = -1111111111111, y:Float = -1111111111111):Void
	{

		var col:FlxColor = new FlxRandom().color();

		spookySteps = gameState.curStep;
		spookyRendered = true;
		tstatic.alpha = 0.5;
		tstatic.color = col;
		
		spookyText = new FlxText(FlxG.random.float(x + 40, x + 120), FlxG.random.float(y + 200, y));
		spookyText.setFormat("Impact", 128, col);
		spookyText.size = 50;
		spookyText.x += 50;
		spookyText.bold = true;
		spookyText.text = text;

		gameState.add(spookyText);
	}

}