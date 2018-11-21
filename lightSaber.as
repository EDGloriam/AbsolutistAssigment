package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author HnatiukAlexander
	 */
	public class lightSaber extends MovieClip 
	{
		public var mcSword:MovieClip;
		public var ray:mcRayBlue;
		
		public function lightSaber() 
		{
			super();	
			
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		}

		
		private function gameLoop(e:Event):void{
			mcSword.addEventListener(MouseEvent.MOUSE_DOWN, drag);
			mcSword.addEventListener(MouseEvent.MOUSE_UP, drop);
		}
		
		private function drop(e:MouseEvent):void 
		{
			mcSword.stopDrag();
			mcSword.removeChild(ray);
		}
		
		private function drag(e:MouseEvent):void 
		{
			mcSword.startDrag();
			showRay();
		}
		

	
		
	
		private function showRay():void 
		{
			ray = new mcRayBlue();
			//newMissile.x = mcPlayer.x;
			//newMissile.y = mcPlayer.y;
			mcSword.addChild(ray);
			
		}
		
	}

}