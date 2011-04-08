package example
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	
	public class Main extends Sprite
	{
		[Embed(source="../../assets/hummingbird.jpg")]
		public static const ExamplePicture:Class;
		
		public function Main()
		{
			var examplePicture:Bitmap = new ExamplePicture();
			addChild(examplePicture);
		}
	}
}