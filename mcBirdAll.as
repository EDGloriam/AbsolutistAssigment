package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author HnatiukAlexander
	 */
	public class mcBirdAll extends MovieClip 
	{
		private var nSpeed:Number;
		
		public function mcBirdAll() 
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
			var nEnemies:Number = 3;
			var nRandom:Number = randomNumber(1, nEnemies);
			this.gotoAndStop(nRandom);
			setupStartPosition();
		}
		
		private function setupStartPosition():void 
		{
			nSpeed = randomNumber(5,25);
			var positionX:Number = randomNumber(25, 800 );
			
			this.y = -30;
			this.x = positionX;
			
			//Move Enemy
			startMoving();
		}
		
		private function startMoving():void 
		{
			addEventListener(Event.ENTER_FRAME, birdLoop);
		}
		
		private function birdLoop(e:Event):void 
		{
			this.y += nSpeed;
	
		}
		
		public function canBeDestroied():Boolean{
			var result:Boolean = false;
			if ( this.y > 500){
				result = true;
			}
			return result;
		}
		
		public function destroyBird():void{
			parent.removeChild(this);
			removeEventListener(Event.ENTER_FRAME, birdLoop);
		}
		
		function randomNumber(low:Number = 0, hight:Number = 1):Number{
			return Math.floor(Math.random() * (1 + hight - low)) + low;
		}
	}

}