package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PcItem extends Item
{
	
	override function getItemData():ItemData
	{
		return PcManager.pcList[id];
	}

	override function getUnlockedTime():Int
	{
		return SelectionState.pcData[id];
	}

	override function isSelected():Bool
	{
		return FlxG.save.data.pcId == id;
	}

	override function getFolder():String
	{
		return "characters";
	}

	override function unlock()
	{
		var pcData = SelectionState.pcData;
		pcData[id] ++;

		FlxG.save.data.pcData = pcData;
		FlxG.save.flush();

		super.unlock();

		trySelect();
	}

	override function trySelect()
	{
		if (isUnlocked)
		{
			//get curPc 
			var curPc = FlxG.save.data.pcId;
			FlxG.save.data.pcId = id;
			FlxG.save.flush();

			SelectionState.instance.grpPcs.members[curPc].updateState();

			refresh();

			SelectionState.instance.updatePcReview();
		}
	}
}
