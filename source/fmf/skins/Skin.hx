package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;



class Skin
{
    public var label:String;
	public function new(skin:String = 'none')
	{
        this.label = skin;
    }

	private function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/default/NOTE_assets', 'mods');
	}

	public function getNoteSkin(note:Note)
	{
		note.frames = getSkinTex();

		note.animation.addByPrefix('greenScroll', 'green0');//up
		note.animation.addByPrefix('redScroll', 'red0');//right
		note.animation.addByPrefix('blueScroll', 'blue0');//down
		note.animation.addByPrefix('purpleScroll', 'purple0');//left

		note.animation.addByPrefix('purpleholdend', 'pruple end hold');//left
		note.animation.addByPrefix('greenholdend', 'green hold end');//up
		note.animation.addByPrefix('redholdend', 'red hold end');//right
		note.animation.addByPrefix('blueholdend', 'blue hold end');//down

		note.animation.addByPrefix('purplehold', 'purple hold piece');//left
		note.animation.addByPrefix('greenhold', 'green hold piece');//up
		note.animation.addByPrefix('redhold', 'red hold piece');//right
		note.animation.addByPrefix('bluehold', 'blue hold piece');//down

		note.setGraphicSize(Std.int(note.width * 0.7));
		note.updateHitbox();
		note.antialiasing = true;
	}

	public function getArrowSkin(i:Int, babyArrow:FlxSprite)
	{
		babyArrow.frames = getSkinTex();

		babyArrow.animation.addByPrefix('green', 'arrowUP');
		babyArrow.animation.addByPrefix('blue', 'arrowDOWN');
		babyArrow.animation.addByPrefix('purple', 'arrowLEFT');
		babyArrow.animation.addByPrefix('red', 'arrowRIGHT');

		babyArrow.antialiasing = true;
		babyArrow.setGraphicSize(Std.int(babyArrow.width * 0.7));

		switch (Math.abs(i))
		{
			case 0:
				babyArrow.x += Note.swagWidth * 0;
				babyArrow.animation.addByPrefix('static', 'arrowLEFT');
				babyArrow.animation.addByPrefix('pressed', 'left press', 24, false);
				babyArrow.animation.addByPrefix('confirm', 'left confirm', 24, false);
			case 1:
				babyArrow.x += Note.swagWidth * 1;
				babyArrow.animation.addByPrefix('static', 'arrowDOWN');
				babyArrow.animation.addByPrefix('pressed', 'down press', 24, false);
				babyArrow.animation.addByPrefix('confirm', 'down confirm', 24, false);
			case 2:
				babyArrow.x += Note.swagWidth * 2;
				babyArrow.animation.addByPrefix('static', 'arrowUP');
				babyArrow.animation.addByPrefix('pressed', 'up press', 24, false);
				babyArrow.animation.addByPrefix('confirm', 'up confirm', 24, false);
			case 3:
				babyArrow.x += Note.swagWidth * 3;
				babyArrow.animation.addByPrefix('static', 'arrowRIGHT');
				babyArrow.animation.addByPrefix('pressed', 'right press', 24, false);
				babyArrow.animation.addByPrefix('confirm', 'right confirm', 24, false);
		}
	}


	
}