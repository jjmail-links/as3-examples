package example
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class Main extends Sprite
	{
		private var exampleAnimation : MovieClip;

		public function Main()
		{
			this.graphics.beginFill(0xaaaaaa);
			this.graphics.drawCircle(300, 300, 300);

			exampleAnimation = new example_animation();
			addChild(exampleAnimation);
			exampleAnimation.x = 250;
			exampleAnimation.y = 200;

			var label : TextField;
			var exampleButton1 : MovieClip = new example_button();
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

			var exampleButton2 : MovieClip = new example_button();
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
			label.width += 20;
			label.x -= 5;
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
	}
}