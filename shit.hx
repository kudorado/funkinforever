if (currentTimingShown != null)
	remove(currentTimingShown);

currentTimingShown = new FlxText(0, 0, 0, "");
currentTimingShown.setFormat(Paths.font("vcr.ttf"), 15, FlxColor.CYAN, CENTER);

timeShown = 0;
switch (daRating)
{
	case 'shit' | 'bad' | 'fuck':
		currentTimingShown.setFormat(Paths.font("vcr.ttf"), 15, FlxColor.RED, CENTER);

	case 'good' | 'sick':
		currentTimingShown.setFormat(Paths.font("vcr.ttf"), 15, FlxColor.CYAN, CENTER);

}
currentTimingShown.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
currentTimingShown.text = healthRating == 0 ?  "" :
(healthRating > 0 ? "+" : "") +
(healthRating * 50);

currentTimingShown.size = 30;

if (currentTimingShown.alpha != 1)
	currentTimingShown.alpha = 1;

if (!botPlayShit)
	add(currentTimingShown);


// currentTimingShown.screenCenter();
currentTimingShown.x = healthBarShitBG.x - 5;

if(FlxG.save.data.downscroll)
	currentTimingShown.y = songName.y + 125;
else
	currentTimingShown.y = songName.y - 132.5;

currentTimingShown.acceleration.y = 600;
currentTimingShown.velocity.y -= 150;

comboSpr.velocity.x += FlxG.random.int(1, 10);
currentTimingShown.velocity.x += comboSpr.velocity.x;

currentTimingShown.updateHitbox();
