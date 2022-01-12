package;
import state.*;
import ui.CustomControlsState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class ControlItem extends Item
{

	public var customControlText:FlxText;

	
	override function getItemData():ItemData
	{
		return ControlManager.controlList[id];
	}

	function isCustom():Bool
	{
		return getItemData().name == 'custom';
	}

	override function getUnlockedTime():Int
	{
		return 0;
	}

	override function isSelected():Bool
	{
		return FlxG.save.data.mobileControl == id;
	}

	override function getFolder():String
	{
		return "controls";
	}

	override function createItemReview(size:Float = 0.35)
	{
		disposeItemReivew();

		itemReview = new FlxSprite().loadGraphic(Paths.image('configuration/' + getFolder() + '/' + getItemData().name));
		itemReview.y -= 175;
		itemReview.x -= 25;

		itemReview.setGraphicSize(Std.int(size * itemReview.width));
		itemReview.antialiasing = true;

		add(itemReview);
	}


	override function createTexts()
	{
		super.createTexts();

		customControlText = new FlxText(0, 150, "Press 'A' to edit", 36);
		customControlText.setFormat("VCR OSD Mono", 32, FlxColor.GREEN);
		customControlText.color = FlxColor.GREEN;

		add(customControlText);
	}

	override function updateState()
	{
		super.updateState();
		customControlText.visible = isSelected() && isCustom();

	}

	override function unlock()
	{
		trySelect();
	}	

	override function onSelected()
	{
		if (isCustom())
		{
			LoadingState.createBlackFadeIn(SelectionState.instance, function()
			{
				FlxG.switchState(new CustomControlsState());
			});
		}
	}

	override function trySelect()
	{
		var curControl = FlxG.save.data.mobileControl;

		FlxG.save.data.mobileControl = id;
		FlxG.save.flush();
		SelectionState.instance.grpControls.members[curControl].updateState();

		refresh();
	}


}
