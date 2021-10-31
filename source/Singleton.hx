package;

import flixel.FlxBasic;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

//leave it later, shit, fuck it
class Singleton<T:FlxBasic> extends MusicBeatState
{
	static public var instance:FlxBasic; 

	override function create()
	{
		instance = this;
		super.create();

	}
	
}
