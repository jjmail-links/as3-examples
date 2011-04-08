package example
{
	import flash.events.SecurityErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;

	public class Main extends Sprite
	{
		public function Main()
		{
			var loader : Loader = new Loader();
			var urlRequest : URLRequest = new URLRequest("example.swf");
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			loader.load(urlRequest);
		}

		private function onCompleteHandler(loadEvent : Event) : void
		{
			var className : String = "hummingbird_img";
			var loaderInfo : LoaderInfo = loadEvent.currentTarget as LoaderInfo;
			var ExamplePicture : Class;
			try
			{
				ExamplePicture = loaderInfo.applicationDomain.getDefinition(className) as Class;
			}
			catch (e : Error)
			{
				trace(className + " definition not found in example.swf");
				return;
			}
			var examplePicture : DisplayObject = new ExamplePicture();
			addChild(examplePicture);
		}

		private function onProgressHandler(event : ProgressEvent) : void
		{
			var percent : Number = event.bytesLoaded / event.bytesTotal;
			trace(percent);
		}

		private function securityErrorHandler(event : SecurityErrorEvent) : void
		{
			trace("securityErrorHandler " + event);
		}

		private function ioErrorHandler(event : IOErrorEvent) : void
		{
			trace("ioErrorHandler " + event);
		}
	}
}