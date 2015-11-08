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

class PlayState extends FlxState
{
	var myText:FlxText;
	var wordFileContents:String;
	var wordArray:Array<String>;
	
	override public function create():Void {
		FlxG.camera.bgColor = 0xFFFFFF;
		loadWordFile();
		createText();
		super.create();
	}

	public function randomize(a, b):Int {
		return (Math.random() > .5) ? 1 : -1;
	}

	public function loadWordFile():Void {
		wordFileContents = Assets.getText("assets/words/words.txt");
		wordArray = wordFileContents.split("\n");
		wordArray.pop(); // remove trailing whitespace line
		wordArray.sort(randomize);
		for (w in wordArray) {
			w = w.substr(0, w.length-1)); // remove trailing invisible return char
		}
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
		myText.text = Std.string(Date.now());
	}	
}