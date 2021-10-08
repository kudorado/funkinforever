package;

import flixel.FlxG;
import fmf.songs.BaseSong;
import fmf.skins.*;


class ControlManager
{
	static public var controlList:Array<ControlData> = 
	[
		new ControlData
		({
			name: 'right',
			cost: 0
		}),

		new ControlData
		({
			name: 'left',
			cost: 0
		}),

		new ControlData
		({
			name: 'full',
			cost: 0
		}),

		new ControlData
		({
			name: 'split-natural',
			cost: 0
		}),


		new ControlData
		({
			name: 'split-flat',
			cost: 0
		}),
		
		new ControlData
		({
			name: 'hitbox',
			cost: 0
		}),

		new ControlData
		({
			name: 'custom',
			cost: 0
		}),
		

	];
}