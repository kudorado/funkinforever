package;
import state.*;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PlayModeItem extends Item
{
	
	override function getItemData():ItemData
	{
		return PlayModeManager.playModeList[id];
	}

	override function getUnlockedTime():Int
	{
		return SelectionState.playModeData[id];
	}

	override function isSelected():Bool
	{
		return FlxG.save.data.playModeId == id;
	}

	override function getFolder():String
	{
		return "playmodes";
	}

	override function unlock()
	{
		var playModeData = SelectionState.playModeData;
		playModeData[id] ++;

		FlxG.save.data.playModeData = playModeData;
		FlxG.save.flush();

		super.unlock();

		trySelect();
	}

	override function trySelect()
	{
		if (isUnlocked)
		{
			//get curPc 
			var curPlayMode = FlxG.save.data.playModeId;
			FlxG.save.data.playModeId = id;
			FlxG.save.flush();

			SelectionState.instance.grpPlayModes.members[curPlayMode].updateState();
			refresh();

			PlayModeManager.loadPlayMode();
		}
	}
}
