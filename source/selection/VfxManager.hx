package selection;

import state.*;
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

		new VfxData
		({
			name: 'bloodhit',
			cost: 5
		}),
		
		new VfxData
		({
			name: 'cyber',
			cost: 5
		}),
		
				
		new VfxData
		({
			name: 'blackhole',
			cost: 5
		}),


		new VfxData({
			name: 'katon',
			cost: 5
		}),

		new VfxData({
			name: 'afterrain',
			cost: 5
		}),

		new VfxData({
			name: 'constella',
			cost: 5
		}),

		new VfxData({
			name: 'deathflower',
			cost: 5
		}),

		//duplicate dust name
		new VfxData({
			name: 'shuriken_dust',
			cost: 5
		}),

		new VfxData({
			name: 'fakethunder',
			cost: 5
		}),

		new VfxData({
			name: 'fluid',
			cost: 5
		}),

		new VfxData({
			name: 'fruit',
			cost: 5
		}),

		new VfxData({
			name: 'futon',
			cost: 5
		}),

		new VfxData({
			name: 'gun',
			cost: 5
		}),

		new VfxData({
			name: 'highway',
			cost: 5
		}),

		new VfxData({
			name: 'ice',
			cost: 5
		}),

		new VfxData({
			name: 'icebreak',
			cost: 5
		}),

		new VfxData({
			name: 'infected',
			cost: 5
		}),

		new VfxData({
			name: 'lstrike',
			cost: 5
		}),

		new VfxData({
			name: 'lstrike1',
			cost: 5
		}),

		new VfxData({
			name: 'luckyday',
			cost: 5
		}),

		new VfxData({
			name: 'meteortrike',
			cost: 5
		}),

		new VfxData({
			name: 'natural',
			cost: 5
		}),

		new VfxData({
			name: 'raigetki',
			cost: 5
		}),

		new VfxData({
			name: 'redstar',
			cost: 5
		}),

		new VfxData({
			name: 'toxic',
			cost: 5
		}),

		new VfxData({
			name: 'underwater',
			cost: 5
		}),

		new VfxData({
			name: 'void',
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

			case 'bloodhit':
				vfx = new BloodHitEffect();

			case 'cyber':
				vfx = new CyberEffect();

			case 'blackhole':
				vfx = new BlackHoleEffect();

			case 'katon':
				vfx = new KatonEffect();

			case 'afterrain':
				vfx = new AfterRainEffect();

			case 'constella':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case 'deathflower':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove
			case 'shuriken_dust':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove
			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove
			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove

			case '':
				//TODO implement new class
				vfx = new AfterRainEffect();//to remove
		}

		return vfx;
	}

}