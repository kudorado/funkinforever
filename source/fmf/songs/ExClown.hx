package fmf.songs;

import fmf.songs.Clown;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class ExClown extends  Clown
{

	public var ExTrickyLinesSing:Array<String> = ["YOU AREN'T HANK", "WHERE IS HANK", "HANK???", "WHO ARE YOU", "WHERE AM I", "THIS ISN'T RIGHT", "MIDGET", "SYSTEM UNRESPONSIVE", "WHY CAN'T I KILL?????"];


	public override function createText(x:Float, y:Float)
	{
		var text:String = ExTrickyLinesSing[FlxG.random.int(0, ExTrickyLinesSing.length - 1)];
		createSpookyText(text, x, y);
	}
			
}