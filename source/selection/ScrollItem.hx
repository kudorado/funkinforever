package selection;
import state.*;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class ScrollItem extends Item
{
	
	override function getItemData():ItemData
	{
		return ScrollManager.scrollList[id];
	}

	override function getUnlockedTime():Int
	{
		return 0;
	}

	override function isSelected():Bool
	{
		return FlxG.save.data.scrollId == id;
	}

	override function getFolder():String
	{
		return "scrolls";
	}

	override function createItemReview(size:Float = 0.35)
	{
		disposeItemReivew();

		itemReview = new FlxSprite().loadGraphic(Paths.image('configuration/' + getFolder() + '/' + getItemData().name));
		itemReview.y -= 175;
		itemReview.x -= 25;

		itemReview.scale.x = size;
		itemReview.scale.y = size;

		itemReview.setGraphicSize(Std.int(size * itemReview.width));
		itemReview.antialiasing = true;

		add(itemReview);
	}

	override function unlock()
	{
		trySelect();
	}	

	override function trySelect()
	{
		var curControl = FlxG.save.data.scrollId;

		FlxG.save.data.scrollId = id;
		FlxG.save.flush();
		SelectionState.instance.grpScrolls.members[curControl].updateState();
		refresh();

	}


}
