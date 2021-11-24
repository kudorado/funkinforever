package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxCamera;
import flixel.group.FlxGroup;
import flixel.FlxObject;


class Debugger
{

	public static var instance:Debugger;

	public var selectionObject:FlxSprite;

	private var group:FlxGroup;
	private var camera:FlxCamera;


	private var obj:FlxText;
	private var x:FlxText;
	private var y:FlxText;

	private var remove:FlxButton;

	public function new()
	{
	}

	public static function create(group:FlxGroup, camera:FlxCamera)
	{
		#if debug
		instance = new Debugger();
		instance.init(group, camera);
		#end
	}

	public function init(group:FlxGroup, camera:FlxCamera)
	{
		FlxMouseEventManager.init();

		this.group = group;
		this.camera = camera;

		initDebugObjects();
	}

	private function initDebugObjects()
	{
		obj = new FlxText(25, 0, 0, "shit", 20);
		obj.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.RED, RIGHT);
		obj.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		obj.scrollFactor.set();

		x = new FlxText(25, 30, 0, "x", 20);
		x.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		x.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		x.scrollFactor.set();

		y = new FlxText(25, 60, 0, "y", 20);
		y.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		y.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		y.scrollFactor.set();


		remove = new FlxButton(25, 90, "Remove", function onClick()
		{
			selectionObject = null;
		});

		group.add(obj);
		group.add(x);
		group.add(y);
		group.add(remove);



		obj.cameras = [camera];
		x.cameras = [camera];
		y.cameras = [camera];
		remove.cameras = [camera];

		update(0);

	}


	public function Debug(obj:FlxSprite)
	{
		UnSelect();

		this.selectionObject = obj;
		this.selectionObject.color = FlxColor.RED;
	}

	public function UnSelect()
	{
		if (this.selectionObject == null)
			return;

		this.selectionObject.color = FlxColor.WHITE;
		this.selectionObject = null;
	}
	

	public function update(elapsed:Float)
	{
		if (selectionObject == null)
		{
			obj.text = "SELECT AN OBJECT TO DEBUG!";
			y.text = "";
			x.text = "";
			remove.visible = false;
			return;
		}

		obj.text = selectionObject.debugName();
		x.text = "x: " +  selectionObject.x;
		y.text = "y: " +  selectionObject.y;
		remove.visible = true;

		var upP = FlxG.keys.anyPressed([W, UP]);
		var rightP = FlxG.keys.anyPressed([D, RIGHT]);
		var downP = FlxG.keys.anyPressed([S, DOWN]);
		var leftP = FlxG.keys.anyPressed([A, LEFT]);
		
		var multiplier = 1;
		var holdShift = FlxG.keys.pressed.SHIFT;
		if (holdShift)
			multiplier = 5;

		if (upP || rightP || downP || leftP)
		{
			if (upP)
				selectionObject.y -= 1 * multiplier;
			if (downP)
				selectionObject.y += 1 * multiplier;
			if (leftP)
				selectionObject.x -= 1 * multiplier;
			if (rightP)
				selectionObject.x += 1 * multiplier;
		}

	}


}