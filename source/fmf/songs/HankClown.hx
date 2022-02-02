package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class HankClown extends  Clown
{

	public  var HankTrickyLinesMiss:Array<String> = ["HANK!!!", "HAY!!!", "AHH!!!"];


	public function createHankMissText(x:Float, y:Float)
	{
		var text:String = HankTrickyLinesMiss[FlxG.random.int(0, HankTrickyLinesMiss.length - 1)];
		createSpookyText(text, x, y);
	}
				
			
}
