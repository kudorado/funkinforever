package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class SkinItem extends Item
{
	
	override function getItemData():ItemData
	{
		return SkinManager.skinList[id];
	}

	override function getUnlockedTime():Int
	{
		return SelectionState.skinData[id];
	}

	override function isSelected():Bool
	{
		return FlxG.save.data.skinId == id;
	}

	override function getFolder():String
	{
		return "arrows";
	}

	override function createItemReview(size:Float = 0.35)
	{
		disposeItemReivew();

		itemReview = new FlxSprite().loadGraphic(Paths.image('configuration/' + getFolder() + '/' + getItemData().name));
		itemReview.y -= 100;
		itemReview.x -= 75;
		itemReview.setGraphicSize(Std.int(size * itemReview.width));
		itemReview.antialiasing = true;

		add(itemReview);
	}

	override function unlock()
	{
		var skinData = SelectionState.skinData;
		skinData[id]++;

		FlxG.save.data.skinData = skinData;
		FlxG.save.flush();

		super.unlock();
		
		trySelect();
	}	

	override function trySelect()
	{
		if (isUnlocked)
		{
			// get curPc
			var curSkin = FlxG.save.data.skinId;
			FlxG.save.data.skinId = id;
			FlxG.save.flush();

			SelectionState.instance.grpSkins.members[curSkin].updateState();

			refresh();

			SelectionState.instance.updateSkinReview();
		}
	}


}
