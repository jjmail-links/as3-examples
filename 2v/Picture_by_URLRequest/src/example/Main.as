package example
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;

	public class Main extends Sprite
	{
		public function Main()
		{
			var imageRequest : URLRequest = new URLRequest("hummingbird.jpg");
			var imageLoader : Loader = new Loader();
			imageLoader.load(imageRequest);
			addChild(imageLoader);
		}
	}
}