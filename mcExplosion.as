package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author HnatiukAlexander
	 */
	public class mcExplosion extends MovieClip 
	{
		
		public function mcExplosion() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,  onAdd);
		}
		
		private function onAdd(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdd);
			init();
		}
		
		private function init():void 
		{
			addEventListener(Event.ENTER_FRAME, explosionLoop)
		}
		
		private function explosionLoop(e:Event):void 
		{
			if (this.currentFrame == this.totalFrames){
				parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, explosionLoop);
			}
		}
		
	}

}