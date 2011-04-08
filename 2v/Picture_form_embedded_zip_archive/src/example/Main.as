package example
{
	import flash.events.Event;

	import nochump.util.zip.ZipEntry;
	import nochump.util.zip.ZipFile;

	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.utils.IDataInput;

	public class Main extends Sprite
	{
		[Embed(source="../../assets/pictures.zip",mimeType="application/octet-stream")]
		private var imagesZip : Class;

		public function Main()
		{
			var theImages : Object = new imagesZip();

			var zip : ZipFile = new ZipFile(theImages as IDataInput);
			for each (var entry:ZipEntry in zip.entries)
			{
				var fileName : String = entry.name.toLowerCase();
				if (fileName == "hummingbird.jpg")
				{
					var loader : Loader = new Loader();
					this.addChild(loader);
					loader.loadBytes(zip.getInput(entry));
					loader.contentLoaderInfo.addEventListener(Event.COMPLETE, picturesLoaded);
				}
			}
		}

		private function picturesLoaded(event : Event) : void
		{
			trace("Picture loaded. " + event.target);
		}

	}
}
