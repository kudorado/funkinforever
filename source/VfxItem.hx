package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class VfxItem extends Item
{

	override function getItemData():ItemData
	{
		return VfxManager.vfxList[id];
	}

	override function getUnlockedTime():Int
	{
		return SelectionState.vfxData[id];
	}

	override function isSelected():Bool
	{
		return FlxG.save.data.vfxId == id;
	}

	override function getFolder():String
	{
		return "effects";
	}

	override function unlock()
	{
		var vfxData = SelectionState.vfxData;
		vfxData[id]++;

		FlxG.save.data.vfxData = vfxData;
		FlxG.save.flush();

		super.unlock();

		trySelect();

	}


	override function trySelect()
	{
		if (isUnlocked)
		{
			// get curVfx

			var vfxId = FlxG.save.data.vfxId;
			FlxG.save.data.vfxId = id;
			FlxG.save.flush();

			SelectionState.instance.grpVfxs.members[vfxId].updateState();

			refresh();

			SelectionState.instance.updateVfxReview();
		}
	}

	override function createItemReview(size:Float = 0.5)
	{
		disposeItemReivew();
		
		itemReview = new FlxSprite().loadGraphic(Paths.image('configuration/' + getFolder() + '/' + getItemData().name));
		itemReview.y -= 250;
		itemReview.x -= 100;

		itemReview.setGraphicSize(Std.int(size * itemReview.width));
		itemReview.antialiasing = true;

		add(itemReview);
	}
		


}
