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
			nSpeed = randomNumber(5, 10);
			var positionX:Number = randomNumber(0 + this.width / 2, stage.width - this.width / 2 );
			
			this.y = -30;
			this.x = positionX;
			
			//Move Enemy
			startMoving();
		}
		
		private function startMoving():void 
		{
			addEventListener(Event.ENTER_FRAME, enemyLoop);
		}
		
		private function enemyLoop(e:Event):void 
		{
			this.y += nSpeed;
	
		}
		
		function randomNumber(low:Number = 0, hight:Number = 1):Number{
			return Math.floor(Math.random() * (1 + hight - low)) + low;
		}
	}

}