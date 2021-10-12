package fmf.songs;

import fmf.characters.Littleman;
import flixel.FlxG;


//this class will handle which SongPlayer should be play
class SongPlayerManager
{
	public static function getPcId():Int
	{
		var pcId:Int = FlxG.save.data.pcId;
		return pcId;
	}
	public static function getCurrentSong(songName:String):SongPlayer
	{
		var songPlayer:SongPlayer = new Tutorial('gf');

		switch (songName.toLowerCase())
		{
			case 'tutorial':
				songPlayer = new Tutorial('gf');

			case 'bopeebo' | 'fresh' | 'dadbattle' | 'dad battle' | 'dad-battle':
				songPlayer = new DaddyDearest("dad");

			case 'spookeez' | 'south':
				songPlayer = new Spookez("spooky");

			case 'monster':
				songPlayer = new Monster("monster");

			case 'pico' | 'philly' | 'blammed' | 'philly nice' |  'philly-nice' | 'phillynice':
				songPlayer = new Philly("pico");

			case 'satin-panties' | "high" | "milf"  | 'satin panties' | 'satinpanties':
				songPlayer = new Mom("mom");

			case 'cocoa' | 'eggnog':
				songPlayer = new Parents("parents");

			case 'winter-horrorland' | 'winter horrorland' | 'winterhorrorland':
				songPlayer = new WinterHorrorland("monster-christmas");

			case 'senpai':
				songPlayer = new Senpai("school");

			case 'roses':
				songPlayer = new SenpaiAngry("school");

			case 'thorns':
				songPlayer = new SenpaiEvil("school");

			case 'light-it-up' | 'ruckus':
				songPlayer = new Matt("matt");

			case 'target-practice':
				songPlayer = new MattAngry();

			case 'lo-fight' | 'overhead':
				songPlayer = new Whitty('whitty');

			case 'ballistic':
				songPlayer = new Ballistic('ballistic');

			case 'remorse':
				songPlayer = new Remorse('remorse');

			case 'screenplay' | 'parasite' | 'guns':
				songPlayer = new Agoti("agoti");

			case 'agoti':
				songPlayer = new AgotiCrazy("agoti-crazy");

			case 'eeeaaaooo':
				songPlayer = new Eeeeaaaooo("tf");

			case 'practice':
				songPlayer = new Practice("practice");

			case 'fool':
				songPlayer = new Fool("fool");

			case 'trap':
				songPlayer = new Trap('sky');

			case 'incident':
				songPlayer = new Incident();

			case 'improbable-outset':
				songPlayer = new TrickyMask();
			
			case 'madness':
				songPlayer = new Tricky();
			
			case 'hellclown':
				songPlayer = new TrickyHell();

			case 'expurgation':
				songPlayer = new TrickyEx();

			case 'reality-bender':
				songPlayer = new TrickyBen();

			case 'wocky' | 'beathoven':
				songPlayer = new Kapi();

			case 'nyaw':
				songPlayer = new KapiAngry();

			case 'flatzone':
				songPlayer = new KapiFan();

			case 'run':
				songPlayer = new Run();

			case 'headache':
				songPlayer = new Garcello();

			case 'nerves':
				songPlayer = new GarcelloTired();

			case 'release':
				songPlayer = new GarcelloDead();
			
			case 'fading':
				songPlayer = new GarcelloGhosty();

			case 'my-battle' | 'last-chance':
				songPlayer = new Tabi();

			case 'genocide':
				songPlayer = new TabiMad();

			case 'little-man':
				songPlayer = new BobSmall();

			case 'annie':
				songPlayer = new Annie();

			case 'uganda':
				songPlayer = new Uganda();

			case 'guraamelia':
				songPlayer = new GuraAmelia();

			case 'lila':
				return new Lila();
			
			case 'tom':
				return new Tom();

			case 'miku':
				return new Miku();

			case 'sky':
				return new Sky();

			case 'hdsenpaimad':
				return new HDSenpaiMad();

			case 'senpaighosty':
				return new SenpaiGhosty();
		
			case 'es-nerves':
				songPlayer = new EsGarcelloTired();

			case 'es-manifest':
				songPlayer = new EsManifest();

			case 'es-animal':
				songPlayer = new EsAnimal();

			case 'gospel':
				songPlayer = new LuciSarv();

			case 'gf-mad':
				songPlayer = new GFMad();

			case 'nene':
				songPlayer = new Nene();

			case 'disappearance':
				songPlayer = new MikuMad();

			case 'tord':
				songPlayer = new Tord();

			case 'drunkannie':
				songPlayer = new DrunkAnnie();
				
			case 'monika':
				songPlayer = new Monika();

			case 'sunday':
				songPlayer = new Sunday();

			case 'pompom':
				songPlayer = new Pompom();

			case 'roro':
				songPlayer = new Roro();

			case 'chara':
				songPlayer = new Chara();

			case 'casanova':
				songPlayer = new Selever();

			case 'zavodila':
				songPlayer = new Ruv();

			case 'liz':
				songPlayer = new Liz();

			case 'frisk':
				songPlayer = new Frisk();

			case 'carol':
				songPlayer = new Carol();

			case 'common sense' | 'common-sense': 
				songPlayer = new Nonsense();

			case 'calm' | 'calm-down':
				songPlayer = new Tricky();

			case 'highlights':
				songPlayer = new NonsenseTired();

			case 'context':
				songPlayer = new NonsenseAngry();
				
			case 'nonsensemad':
				songPlayer = new NonsenseMad();

			case 'nonsense' | 'nonsensical':
				songPlayer = new NonsenseGod();

			case 'godrays':
				songPlayer = new Solazar();


		}

		return songPlayer;
	}

}