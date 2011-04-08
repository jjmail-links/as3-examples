package example
{
	import flash.text.TextField;
	import flash.display.Sprite;
	import flash.utils.ByteArray;

	public class Main extends Sprite
	{
		[Embed(source="../../assets/example.xml", mimeType="application/octet-stream")]
		public static const ExampleXML : Class;

		public function Main()
		{
			var fileData : ByteArray = new Main.ExampleXML();
			var strXML : String = fileData.readUTFBytes(fileData.length);
			var xml : XML = new XML(strXML);
			var tf : TextField = new TextField();
			tf.background = true;
			tf.backgroundColor=0xfafafa;
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