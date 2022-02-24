package fmf.skins;

import state.*;
import flixel.FlxSprite;


import flixel.graphics.frames.FlxAtlasFrames;



class PixelSkin extends Skin
{
	var daPath = "note_skins/pixel/arrows-pixels";
	var daEndPath = "note_skins/pixel/arrowEnds";

	public static var PURP_NOTE:Int = 0;
	public static var GREEN_NOTE:Int = 2;
	public static var BLUE_NOTE:Int = 1;
	public static var RED_NOTE:Int = 3;


	override function getArrowSkin(i:Int, babyArrow:FlxSprite)
	{
		babyArrow.loadGraphic(Paths.image(daPath, 'mods'), true, 17, 17);
		babyArrow.animation.add('green', [6]);
		babyArrow.animation.add('red', [7]);
		babyArrow.animation.add('blue', [5]);
		babyArrow.animation.add('purplel', [4]);

		babyArrow.setGraphicSize(Std.int(babyArrow.width * GameState.daPixelZoom));
		babyArrow.updateHitbox();
		babyArrow.antialiasing = false;

		babyArrow.x += Note.swagWidth * i;
		babyArrow.animation.add('static', [i]);
		babyArrow.animation.add('pressed', [4 + i, 8 + i], 12, false);
		babyArrow.animation.add('confirm', [12 + i, 16 + i], 24, false);


	}
		
	override function getNoteSkin(note:Note)
	{
		if (!note.isSustainNote)
		{
			note.loadGraphic(Paths.image(daPath, 'mods'));
			note.width = note.width / 4;
			note.height = note.height / 5;
			note.loadGraphic(Paths.image(daPath, 'mods'), true, Math.floor(note.width), Math.floor(note.height));

			note.antialiasing = false;
			note.setGraphicSize(Std.int(note.width * GameState.daPixelZoom));

			note.animation.add('green', [6]);
			note.animation.add('red', [7]);
			note.animation.add('blue', [5]);
			note.animation.add('purple', [4]);

			switch (Math.abs(note.noteData))
			{
				case 0:
					note.animation.add('static', [0]);
					note.animation.add('pressed', [4, 8], 12, false);
					note.animation.add('confirm', [12, 16], 24, false);
				case 1:
					note.animation.add('static', [1]);
					note.animation.add('pressed', [5, 9], 12, false);
					note.animation.add('confirm', [13, 17], 24, false);
				case 2:
					note.animation.add('static', [2]);
					note.animation.add('pressed', [6, 10], 12, false);
					note.animation.add('confirm', [14, 18], 12, false);
				case 3:
					note.animation.add('static', [3]);
					note.animation.add('pressed', [7, 11], 12, false);
					note.animation.add('confirm', [15, 19], 24, false);
			}

			note.animation.add('greenScroll', [GREEN_NOTE + 4]);
			note.animation.add('redScroll', [RED_NOTE + 4]);
			note.animation.add('blueScroll', [BLUE_NOTE + 4]);
			note.animation.add('purpleScroll', [PURP_NOTE + 4]);


		}
		else
		{
			note.loadGraphic(Paths.image(daEndPath, 'mods'));
			note.width = note.width / 4;
			note.height = note.height / 2;
			note.loadGraphic(Paths.image(daEndPath, 'mods'), true, Math.floor(note.width), Math.floor(note.height));
			note.antialiasing = false;
			note.setGraphicSize(Std.int(note.width * GameState.daPixelZoom));

			note.animation.add('purpleholdend', [PURP_NOTE + 4]);
			note.animation.add('greenholdend', [GREEN_NOTE + 4]);
			note.animation.add('redholdend', [RED_NOTE + 4]);
			note.animation.add('blueholdend', [BLUE_NOTE + 4]);

			note.animation.add('purplehold', [PURP_NOTE]);
			note.animation.add('greenhold', [GREEN_NOTE]);
			note.animation.add('redhold', [RED_NOTE]);
			note.animation.add('bluehold', [BLUE_NOTE]);

			//hahaha hard code LOL
			note.x += 27;	

		}


		note.updateHitbox();



	}
}