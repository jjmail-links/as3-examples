package example
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;

	public class Main extends Sprite
	{
		private var exampleAnimation : MovieClip;

		public function Main()
		{
			this.graphics.beginFill(0xaaaaaa);
			this.graphics.drawCircle(300, 300, 300);
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
			var loaderInfo : LoaderInfo = loadEvent.currentTarget as LoaderInfo;
			var AnimationClass : Class;
			var ButtonClass : Class;
			AnimationClass = getClass(loaderInfo, "example_animation");
			ButtonClass = getClass(loaderInfo, "example_button");
			
			exampleAnimation = new AnimationClass();
			addChild(exampleAnimation);
			exampleAnimation.x = 250;
			exampleAnimation.y = 200;

			var label : TextField;
			var exampleButton1 : MovieClip = new ButtonClass();
			addChild(exampleButton1);
			exampleButton1.x = 50;
			exampleButton1.y = 20;
			exampleButton1.buttonMode = true;
			exampleButton1.addEventListener(MouseEvent.CLICK, onClickButton1);
			label = exampleButton1.getChildByName("label") as TextField;
			label.selectable = false;
			label.embedFonts = false;
			label.mouseEnabled = false;
			label.text = "hide";

			var exampleButton2 : MovieClip = new ButtonClass();
			addChild(exampleButton2);
			exampleButton2.x = 150;
			exampleButton2.y = 20;
			exampleButton2.buttonMode = true;
			exampleButton2.addEventListener(MouseEvent.CLICK, onClickButton2);
			label = exampleButton2.getChildByName("label") as TextField;
			label.selectable = false;
			label.embedFonts = false;
			label.mouseEnabled = false;
			label.text = "show";
			label.width +=20;
			label.x -=5;
			exampleButton1.stop();
			exampleButton2.stop();
			exampleAnimation.stop();
		}

		private function onClickButton2(event : MouseEvent) : void
		{
			exampleAnimation.visible = true;
		}

		private function onClickButton1(event : MouseEvent) : void
		{
			exampleAnimation.visible = false;
		}

		public function getClass(loaderInfo : LoaderInfo, className : String) : Class
		{
			try
			{
				return loaderInfo.applicationDomain.getDefinition(className)  as  Class;
			}
			catch (e : Error)
			{
				throw new IllegalOperationError(className + " definition not found.");
			}
			return null;
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