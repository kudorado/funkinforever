package;

#if LUA_ALLOWED
import llua.Lua;
import llua.LuaL;
import llua.State;
import llua.Convert;
#end

import state.*;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.util.FlxColor;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSprite;
import openfl.display.BlendMode;
import openfl.utils.Assets;
import flixel.math.FlxMath;
#if sys
import sys.FileSystem;
import sys.io.File;
#end
import Type.ValueType;
import Controls;
import DialogueBoxPsych;

#if windows
import Discord;
#end

using StringTools;

class ModchartSprite extends FlxSprite
{
	//why you don't add tag for it babe
	public var tag:String;
	public var wasAdded:Bool = false;

	public function new(x:Float, y:Float, tag:String)
	{
		super(x, y);
		this.tag = tag;
	}
	//public var isInFront:Bool = false;
}
