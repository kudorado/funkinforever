package fmf.songs;
import reactor.*;
import ui.*;

import state.*;


//this class with manager songs data
class SongManager
{


	static public var songs:Array<SongData> = 
	[

		new SongData
		(
			{
				folder: 'week_hd',
				character: 'gf',
				songTitle: 'How to Funk',
				songList: ['tutorial[hd]']
			}
		),

		new SongData
		(
			{
				folder: 'week_hd',
				character: 'week1[hd]',
				songTitle: 'Week1',
				songList: ['bopeebo[hd]', 'fresh[hd]', 'dad-battle[hd]']
			}
		),

		new SongData
		(
			{
				folder: 'week_hd',
				character: 'week2[hd]',
				songTitle: 'Week2',
				songList: ['spookeez[hd]', 'south[hd]', 'monster[hd]']
			}
		),

		new SongData
		(
			{
				folder: 'week_hd',
				character: 'week3[hd]',
				songTitle: 'Week3',
				songList: ['Pico', 'Philly-Nice', 'Blammed']
			}
		),


		new SongData
		(
			{
				folder: 'week_hd',
				character: 'week4[hd]',
				songTitle: 'Week4',
				songList: ['satin-panties', 'high', 'milf']
			}
		),

		new SongData
		(
			{
				folder: 'week_hd',
				character: 'week5[hd]',
				songTitle: 'Week5',
				songList: ['cocoa', 'eggnog', 'winter-horrorland']
			}
		),


		new SongData
		(
			{
				folder: 'week_hd',
				character: 'week6[hd]',
				songTitle: 'Week6',
				songList: ['Pico', 'Philly-Nice', 'winter-horrorland']
			}
		),

		new SongData
		(
			{
				folder: 'week_mfmhd',
				character: 'week_mfmhd',
				songTitle: 'Mid-Fight Masses HD',
				songList: ['parish-remix[hd]', 'worship[hd]', 'zavodila-remix[hd]', 'gospel[hd]']
			}
		),
		

//-------------------------TUTORIAL--------------------------
		// new SongData
		// (
		// 	{
		// 		folder: 'week_tutorial',
		// 		character: 'gf',
		// 		songTitle: 'How to Funk',
		// 		songList: ['Tutorial']
		// 	}
		// ),



		// new SongData	
		// (
		// 	{
		// 		folder: 'week_annie',
		// 		character: 'annie',
		// 		songTitle: 'V.S Annie',
		// 		songList: ['Good-enough', 'Lover', 'Tug-of-war', 'Animal']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_garcello',
		// 		character: 'garcello',
		// 		songTitle: 'SMOKE EM\' OUT STRUGGLE',
		// 		songList: ['Headache', 'Nerves', 'Release', 'Fading']
		// 	}
		// ),


		// new SongData
		// (
		// 	{
		// 		folder: 'week_kapi',
		// 		character: 'kapi',
		// 		songTitle: 'Showdown Arcane',
		// 		songList: ['Wocky', 'Beathoven', 'Hairball', 'Nyaw', 'Flatzone']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_agoti',
		// 		character: 'agoti',
		// 		songTitle: 'V.S Agoti',
		// 		songList: ['Screenplay', 'Parasite', 'AGOTI', 'Guns', 'Godrays']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_entity_origins',
		// 		character: 'daidem',
		// 		songTitle: 'Entity Origins',
		// 		songList: ['Experimental-Phase', 'Perfection']
		// 	}
		// ),
		

		// new SongData	
		// (
		// 	{
		// 		folder: 'week_sky',
		// 		character: 'sky',
		// 		songTitle: 'V.S Sky',
		// 		songList: ['Wife-forever', 'Sky', 'Manifest']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_miku',
		// 		character: 'miku',
		// 		songTitle: 'V.S Miku',
		// 		songList: ['Popipo', "Aishite", 'Siu', "Disappearance", 'Chug']
		// 	}
		// ),

		// new SongData	
		// (
		// 	{
		// 		folder: 'week_date',
		// 		character: 'the_date',
		// 		songTitle: 'The Date',
		// 		songList: ['Whitroll', 'Perfume', 'Heartbass']
		// 	}
		// ),

		// new SongData	
		// (
		// 	{
		// 		folder: 'week_starlingmayhem',
		// 		character: 'starlingmayhem',
		// 		songTitle: 'V.S Starling Mayhem',
		// 		songList: ['Inverted-ascension', 'Echoes', 'Artificial-lust']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_hex',
		// 		character: 'hex',
		// 		songTitle: 'V.S Hex',
		// 		songList: ['Dunk', 'Ram', 'Hello-world', 'Glitcher', 'Encore']
		// 	}
		// ),


		// new SongData	
		// (
		// 	{
		// 		folder: 'week_huggywuggy',
		// 		character: 'huggy',
		// 		songTitle: 'V.S Huggy Wuggy',
		// 		songList: ['Playtime', 'Runtime']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_mfm',
		// 		character: 'mfm',
		// 		songTitle: 'Mid-Fight Masses',
		// 		songList: ['Parish', 'Worship', "Zavodila", 'Gospel', 'Casanova']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_whitty',
		// 		character: 'whitty',
		// 		songTitle: 'V.S Whitty',
		// 		songList: ['Lo-fight', 'Overhead', 'Ballistic', 'Remorse']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_bob',
		// 		character: 'bob',
		// 		songTitle: 'V.S Bob',
		// 		songList: ['Sunshine', 'Withered', 'Run', "Ron", "Trouble", "Onslaught", "Little-man"]
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_impostor',
		// 		character: 'red',
		// 		songTitle: 'V.S Red Impostor',
		// 		songList: ['Sussus-moogus', 'Sabotage', 'Meltdown']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_impostor',
		// 		character: 'green',
		// 		songTitle: 'V.S Green Impostor',
		// 		songList: ['Sussus-toogus', 'Lights-down', 'Reactor', 'Ejected']
		// 	}
		// ),

		// new SongData	
		// (
		// 	{
		// 		folder: 'week_eteled',
		// 		character: 'eteled',
		// 		songTitle: 'V.S Eteled',
		// 		songList: ['Dream-of-peace', 'Diagraphephobia', 'Post-mortal', 'Plaything', 'System-failure']
		// 	}
		// ),


		// new SongData	
		// (
		// 	{
		// 		folder: 'week_impostor_v4',
		// 		character: 'airship',
		// 		songTitle: 'Airship',
		// 		songList: ['Watch-Out', 'Dlow', 'Apprehensive', 'Double-Trouble']
		// 	}
		// ),
		
		// new SongData	
		// (
		// 	{
		// 		folder: 'week_impostor_v4',
		// 		character: 'polus',
		// 		songTitle: 'Polus',
		// 		songList: ['Double-kill', 'Blackout', 'Run-away']
		// 	}
		// ),


		// new SongData	
		// (
		// 	{
		// 		folder: 'week_blueballsincident',
		// 		character: 'blueballsincident',
		// 		songTitle: 'V.S Blueballs Incident',
		// 		songList: ['Sadness', 'Rage', 'Incident[bi]', 'Redemption']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_nonsense',
		// 		character: 'nonsense',
		// 		songTitle: 'V.S Nonsense',
		// 		songList: ['Common-sense', 'Highlights', 'Context', "Nonsensical"]
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_bab',
		// 		character: 'bab',
		// 		songTitle: 'Bop & Bosip',
		// 		songList: ['Jump-in', 'Swing', 'Ronald-McDonald-Slide', 'Jump-out']
		// 	}
		// ),

		// new SongData	
		// (
		// 	{
		// 		folder: 'week_camellia',
		// 		character: 'camellia',
		// 		songTitle: 'V.S Camellia',
		// 		songList: ['First-town', 'Liquated', 'Why-do-you-hate-me', 'ghost']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_es',
		// 		character: 'es',
		// 		songTitle: 'Everyone Sings',
		// 		songList: ['ES-Nerves', "ES-Manifest", "ES-Animal"]
		// 	}
		// ),


		// new SongData
		// (
		// 	{
		// 		folder: 'week_matt',
		// 		character: 'matt',
		// 		songTitle: 'V.S Matt',
		// 		songList: ['Light-it-up', 'Ruckus', 'Target-practice']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_tabi',
		// 		character: 'tabi',
		// 		songTitle: 'V.S Ex',
		// 		songList: ['My-battle', 'Last-chance', 'Genocide']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_tricky',
		// 		character: 'tricky',
		// 		songTitle: 'V.S Clown',
		// 		songList: ['Improbable-outset', 'Madness', 'Hellclown', 'Expurgation', 'Reality-bender']
		// 	}
		// ),
		
		// new SongData
		// (
		// 	{
		// 		folder: 'week_trueform',
		// 		character: 'trueform',
		// 		songTitle: 'T.R.U.E.F.A.C.E',
		// 		songList: ['Eeeaaaooo', 'Target-practice[trueface]', 'Foolhardy[trueface]', 'Manifest[trueface]', 'Incident[trueface]', 'Run[trueface]']
		// 	}
		// ),

		// new SongData	
		// (
		// 	{
		// 		folder: 'week_qt',
		// 		character: 'qt',
		// 		songTitle: 'V.S QT',
		// 		songList: ['Carefree', 'Careless', 'Censory-overload', 'Termination', 'Cessation']
		// 	}
		// ),

		// new SongData	
		// (
		// 	{
		// 		folder: 'week_zardy',
		// 		character: 'zardy',
		// 		songTitle: 'V.S Zardy',
		// 		songList: ['Foolhardy', 'Bushwhack']
		// 	}
		// ),


		// new SongData	
		// (
		// 	{
		// 		folder: 'week_sonic',
		// 		character: 'sonic',
		// 		songTitle: 'V.S Sonic.exe',
		// 		songList: ['Too-Slow', 'You-Cant-Run', 'triple-trouble[sonic]', 'Cycles', 'Endless', 'sunshine[sonic]', 'Chaos', 'Faker', 'black-sun', 'milk', 'too-fest']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_tails',
		// 		character: 'tails',
		// 		songTitle: 'V.S Tails EXE',
		// 		songList: ['Chasing', 'Darkness', 'Sidekick', 'Octane']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_finnandjake',
		// 		character: 'finnandjake',
		// 		songTitle: 'Finn & Jake',
		// 		songList: ['Corrupted-hero', 'Brotherly-bond', 'Gummy-substance', 'Together-forever']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_dab',
		// 		character: 'dave',
		// 		songTitle: 'V.S Dave',
		// 		songList: ['House', 'Insanity', 'Polygonized']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_dab',
		// 		character: 'bambi',
		// 		songTitle: 'V.S Bambi',
		// 		songList: ['Blocked', 'Corn-Theft', 'Maze']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_dab',
		// 		character: 'dab',
		// 		songTitle: 'V.S Dave & Bambi',
		// 		songList: ['Bonus-song', 'Mealie', 'Supernovae', 'Glitch', 'Vs-dave-thanksgiving']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_dab',
		// 		character: 'dab_finale',
		// 		songTitle: 'Dave and Bambi Finale!',
		// 		songList: ['Splitathon', 'Cheating', 'Unfairness']
		// 	}
		// ),

		// new SongData
		// (
		// 	{
		// 		folder: 'week_ga',
		// 		character: 'dab_ga',
		// 		songTitle: 'Golden Apple',
		// 		songList: ['Applecore', 'Sugar-rush']
		// 	}
		// ),
	
		// new SongData
		// (
		// 	{
		// 		folder: 'week_challenge',
		// 		character: 'hank',
		// 		songTitle: 'Challenge Week',
		// 		songList: ['Accelerant', 'WellWellWell', 'Edd', 'Unloaded']
		// 	}
		// ),

			
		// new SongData
		// (
		// 	{
				
		// 		folder: 'week_dokidoki',
		// 		character: 'dokidoki',
		// 		songTitle: 'Doki Doki Takeover',
		// 		songList: ['high_school_conflict', 'bara_no_yume', 'your_demise', //todo add note skin pixel
		// 		'rain_clouds', 'my_confession',
		// 		'my_sweets', 'baka',
		// 		'deep_breaths', 'obsession',
		// 		'reconciliation',
		// 		'crucify_yuri_mix', 'beathoven_natsuki_mix', 'its_complicated_sayori_mix', 'glitcher_monika_mix',
		// 		'poems_n_thorns', 'dual_demise', 'epiphany', 'erb', 'your_reality'
		// 		]
		// 	}
		// ),

	];
//-----------------------------------------------------------

}