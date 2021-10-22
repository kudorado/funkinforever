package;

import flixel.FlxG;
import fmf.vfx.*;


class VfxManager
{
	static public var vfxList:Array<VfxData> = 
	[
		new VfxData
		({
			name: 'default',
			cost: 0
		}),
		
		new VfxData
		({
			name: 'mad',
			cost: 1
		}),
		
		new VfxData	
		({
			name: 'fire',
			cost: 1
		}),

		new VfxData
		({
			name: 'water',
			cost: 1
		}),
		
		new VfxData
		({
			name: 'agoti',
			cost: 2
		}),

		new VfxData
		({
			name: 'raizen',
			cost: 3
		}),

		new VfxData
		({
			name: 'dust',
			cost: 3
		}),

		new VfxData
		({
			name: 'explosion',
			cost: 5
		}),


		new VfxData
		({
			name: 'stardream',
			cost: 5
		}),


		new VfxData
		({
			name: 'thunder',
			cost: 5
		}),
		
	
		
	];


	public static function loadVfx():VFX
	{
		var vfxName:String = VfxManager.vfxList[FlxG.save.data.vfxId].name;
		var vfx:VFX = new VFX("none");

		switch (vfxName.toLowerCase())
		{
			case "agoti":
				vfx = new AgotiEffect("agoti");
			case "dust":
				vfx = new DustEffect("dust");
			case "hole":
				vfx = new HoleEffect("hole");
			case "mad":
				vfx = new MadEffect("mad");
			case "raizen":
				vfx = new RaizenEffect("raizen");
			case "stardream":
				vfx = new StarDreamEffect("stardream");
			case "thunder":
				vfx = new ThunderEffect("thunder");
			case "water":
				vfx = new WaterEffect("water");
			case 'explosion':
				vfx = new ExplosionEffect();
			case 'nuclear': //shit
				vfx = new NuclearEffect();
			case 'demon'://shit
				vfx = new DemonEffect();
			case 'fire':
				vfx = new FireEffect();
		}

		return vfx;
	}

}