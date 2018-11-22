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
			addEventListener(Event.ENTER_FRAME, rayLoop);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemove);
		}
		
		private function onRemove(e:Event):void 
		{
			// Не работает
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemove);
			while (this.height > 20){
				this.height -= 20;
			}
			
		}
		
		private function rayLoop(e:Event):void 
		{
			if (this.height < 260){
				this.height += 20;
			}
		}
		public function destroyRay():void{
			parent.removeChild(this);
			removeEventListener(Event.ENTER_FRAME, rayLoop);
		}
		
	}

}