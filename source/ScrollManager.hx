package;
import state.*;
import flixel.FlxG;
import fmf.vfx.*;


class ScrollManager
{
	static public var scrollList:Array<ScrollData> = 
	[
		new ScrollData
		({
			name: 'middle-up',
			cost: 0
		}),

		new ScrollData
		({
			name: 'middle-down',
			cost: 0
		}),
		
		new ScrollData
		({
			name: 'upscroll',
			cost: 0
		}),

		new ScrollData
		({
			name: 'downscroll',
			cost: 0
		}),

	];

	public static function loadScroll()
	{
		FlxG.save.data.downscroll = FlxG.save.data.scrollId != 0 &&  FlxG.save.data.scrollId != 2;
		FlxG.save.data.showDadNote =  FlxG.save.data.scrollId > 1;
	}

}