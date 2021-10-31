package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class Item extends FlxSpriteGroup
{
	public var targetX:Float = 0;
	public var itemReview:FlxSprite;
	public var flashingInt:Int = 0;


	public var isUnlocked:Bool;

	public var unlockText:FlxText;
	public var unlockAmount:FlxText;
	public var selectedText:FlxText;

	public var itemLabel:FlxText;

	public var video:FlxSprite;

	public var id:Int;


	public function trySelect(){}
	public function onSelected(){}


	public function deactiveTexts()
	{
		unlockText.visible = false;
		selectedText.visible = false;
		video.visible = false;
		itemLabel.visible = false;
		unlockAmount.visible = false;
	}

	public function getItemData():ItemData
	{
		return new ItemData({name: "default", cost: 0});
	}

	public function getUnlockedTime():Int
	{
		return 0;
	}

	public function isSelected():Bool
	{
		return false;
	}

	private function getFolder():String
	{
		return 'itemType';
	}

	public function unlock()
	{
		trace('unlock shit fuck you!');
		refresh();
	}

	public function refresh()
	{
		remove(unlockAmount);

		var unlockedTime:Int = getUnlockedTime();
		var cost:Int = getItemData().cost;

		isUnlocked = unlockedTime >= cost;

		unlockAmount = new FlxText(120, 140, unlockedTime + "/" + cost, 36);
		unlockAmount.setFormat("VCR OSD Mono", 32, CENTER);
		add(unlockAmount);

		updateState();
	}

	public function createItemReview(size:Float = 0.5)
	{
		disposeItemReivew();

		itemReview = new FlxSprite().loadGraphic(Paths.image('configuration/' + getFolder() +   '/' +  getItemData().name));
		itemReview.y -= 200;
		itemReview.setGraphicSize(Std.int(size * itemReview.width));
		itemReview.antialiasing = true;

		add(itemReview);
	}

	private function disposeItemReivew()
	{
		if (itemReview != null)
			remove(itemReview);
	}

	public function updateUnlockStatus()
	{
		var unlockedTime:Int = getUnlockedTime();
		var cost:Int = getItemData().cost;

		isUnlocked = unlockedTime >= cost;
	}

	private function createTexts()
	{
		itemLabel = new FlxText(90, -175, getItemData().name.toUpperCase(), 25);
		itemLabel.setFormat("VCR OSD Mono", 25, FlxColor.WHITE, CENTER);
		add(itemLabel);



		unlockText = new FlxText(90, 100, "UNLOCK", 36);
		unlockText.setFormat("VCR OSD Mono", 32);

		add(unlockText);


		video = new FlxSprite(160, 56.5);
		video.loadGraphic(Paths.image('videow', 'mods'));
		video.setGraphicSize(Std.int(video.width * 0.35));
		video.antialiasing = true;
		add(video);

		var unlockedTime:Int = getUnlockedTime();
		var cost:Int = getItemData().cost;

		unlockAmount = new FlxText(120, 140, unlockedTime + "/" + cost, 36);
		unlockAmount.setFormat("VCR OSD Mono", 32, CENTER);
		add(unlockAmount);

		selectedText = new FlxText(90, 100, "SELECTED", 36);
		selectedText.setFormat("VCR OSD Mono", 32, FlxColor.GREEN);
		selectedText.color = FlxColor.GREEN;

		add(selectedText);
	}

	public function new(id:Int, x:Float, y:Float)
	{
		super(x, y);

		this.id = id;

		createItemReview();
		updateUnlockStatus();
		createTexts();
	

		updateState();
	}

	public function updateState()
	{

		unlockAmount.visible = !isUnlocked;
		video.visible = !isUnlocked;
		unlockText.visible = !isUnlocked;

		selectedText.visible = isUnlocked && isSelected();
	}

	private var isFlashing:Bool = false;

	public function startFlashing():Void
	{
		isFlashing = true;
	}

	// if it runs at 60fps, fake framerate will be 6
	// if it runs at 144 fps, fake framerate will be like 14, and will update the graphic every 0.016666 * 3 seconds still???
	// so it runs basically every so many seconds, not dependant on framerate??
	// I'm still learning how math works thanks whoever is reading this lol
	var fakeFramerate:Int = Math.round((1 / FlxG.elapsed) / 10);

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		x = FlxMath.lerp(x, (targetX * 250) + Std.int(480), 0.17 * (60 / FlxG.save.data.fpsCap));

		if (isFlashing)
			flashingInt += 1;
	
		if (flashingInt % fakeFramerate >= Math.floor(fakeFramerate / 2))
			itemReview.color = 0xFF33ffff;
		else if (FlxG.save.data.flashing)
			itemReview.color = FlxColor.WHITE;
	}
}
