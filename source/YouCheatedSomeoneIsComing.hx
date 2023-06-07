package;

#if sys
import sys.io.File;
import sys.io.Process;
#end
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * scary!!!
 */
class YouCheatedSomeoneIsComing extends MusicBeatState
{
	public function new() 
	{
		super();
	}

	override public function create():Void 
	{
		super.create();
		var spooky:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('dave/cheater_lol'));
        spooky.screenCenter();
        add(spooky);
		FlxG.sound.playMusic(Paths.music('badEnding'),1,true);
	}

	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);

		#if mobile
		var justTouched:Bool = false;
		
		for (touch in FlxG.touches.list)
			if (touch.justPressed)
				justTouched = true;
		#end
		
		if (FlxG.keys.pressed.ENTER #if mobile || justTouched #end)
		{
			FlxG.switchState(new SusState());
		}
	}
}