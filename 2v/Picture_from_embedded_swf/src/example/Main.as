package example
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	
	public class Main extends Sprite
	{
		[Embed(source="../../assets/example.swf", symbol="hummingbird_img")]
		public static const ExamplePicture:Class;
		

		public function Main()
		{
			var examplePicture:DisplayObject = new ExamplePicture();
			addChild(examplePicture);
		}
	}
}