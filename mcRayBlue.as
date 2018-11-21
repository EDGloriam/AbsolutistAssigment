package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author HnatiukAlexander
	 */
	public class mcRayBlue extends Sprite 
	{
		
		public function mcRayBlue() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdd);
			
		}
		
		private function onAdd(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdd);
			init();
			
		}
		
		private function init():void 
		{
			this.height = 0;
			addEventListener(Event.ENTER_FRAME, missileLoop);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemove);
		}
		
		private function onRemove(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemove);
			trace(this.height);
			
		}
		
		private function missileLoop(e:Event):void 
		{
			if (this.height < 260){
				this.height += 20;
			}
		}
		
		
		
		
	}

}