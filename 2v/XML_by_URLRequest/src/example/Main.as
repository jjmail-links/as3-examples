package example
{
	import flash.events.IOErrorEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;

	public class Main extends Sprite
	{
		public function Main()
		{
			var xmlLoader : URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, onXMLLoaded);
			xmlLoader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			xmlLoader.load(new URLRequest("example.xml"));
		}

		private function errorHandler(event : IOErrorEvent) : void
		{
			trace("load error " + event);
		}

		private function onXMLLoaded(event : Event) : void
		{
			XML.ignoreWhitespace = true;
			var xml : XML;
			try
			{
				xml = new XML(event.target.data);
			}
			catch (e : TypeError)
			{
				trace("Could not parse the XML file.");
				return;
			}

			var tf : TextField = new TextField();
			tf.background = true;
			tf.backgroundColor = 0xfafafa;
			tf.border = true;
			tf.x = 10;
			tf.y = 10;
			tf.width = 700;
			tf.height = 500;
			tf.text = xml;
			tf.appendText("\n");
			tf.appendText(xml.example.@message);
			addChild(tf);
		}
	}
}