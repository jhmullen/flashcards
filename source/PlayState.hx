package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import flixel.FlxG;
import openfl.Assets;
import flash.Lib;

class PlayState extends FlxState
{
	var myText:FlxText;
	var wordArray:Array<String>;
	var up_mc:FlxSprite;
	var down_mc:FlxSprite;
	
	override public function create():Void {
		FlxG.camera.bgColor = 0xFFFFFF;
		loadWordFile();
		placeButtons();
		createText();
		super.create();
	}

	public function randomize(a, b):Int {
		return (Math.random() > .5) ? 1 : -1;
	}

	public function loadWordFile():Void {
		var wordFileContents = Assets.getText("assets/words/words.txt");
		wordArray = wordFileContents.split("\n");
		wordArray.pop(); // remove trailing whitespace line
		wordArray.sort(randomize);
		for (w in wordArray) {
			w = w.substr(0, w.length-1); // remove trailing invisible return char
		}
	}

	public function placeButtons():Void {
		up_mc = new FlxSprite();
		up_mc.loadGraphic("assets/images/arrow.png");
		up_mc.x = 450;
		up_mc.angle = 270;
		up_mc.y = 500;
		add(up_mc);

		down_mc = new FlxSprite();
		down_mc.loadGraphic("assets/images/arrow.png");
		down_mc.x = 450;
		down_mc.angle = 90;
		down_mc.y = 600;
		add(down_mc);
	}

	public function createText():Void {
		myText = new FlxText(0, 200, 1024, "Hello World!");
		myText.setFormat(null, 48, FlxColor.BLACK, "center");
		myText.systemFont = "Arial";
		add(myText);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void{
		super.update();
		if (FlxG.keys.pressed.UP) {
			myText.text = "up";
		}
		if (FlxG.keys.pressed.DOWN) {
			myText.text = "down";
		}
		if (FlxG.keys.pressed.LEFT) {
			myText.text = "left";
		}
		if (FlxG.keys.pressed.RIGHT) {
			myText.text = "right";
		}


	}	
}