package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author HnatiukAlexander
	 */
	public class lightSaber extends MovieClip 
	{
		public var mcSword:MovieClip;
		
		private var ray:mcRayBlue;
		private var swordDraged:Boolean;
		private var aBirdsArray:Array;
		private var channelForDefaultSound:SoundChannel;
		
		
		public function lightSaber() 
		{
			super();
			
			aBirdsArray = new Array();
			
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
			
			var tBirdTimer:Timer = new Timer(1000);
			tBirdTimer.addEventListener(TimerEvent.TIMER, addBird);
			tBirdTimer.start();
		}
		
		private function addBird(e:TimerEvent):void 
		{
			var newBird:mcBirdAll = new mcBirdAll();
			stage.addChild(newBird);
			aBirdsArray.push(newBird);
		}

		
		private function gameLoop(e:Event):void{
			mcSword.addEventListener(MouseEvent.MOUSE_DOWN, drag);
			mcSword.addEventListener(MouseEvent.MOUSE_UP, drop);
			mcSword.addEventListener(MouseEvent.MOUSE_MOVE, move);
			deleteBirdsOffScreen();
			checkSwordKillBird();
		}
		
		private function checkSwordKillBird():void 
		{
			//
			// Ошибка TypeError: Error #1009: Не удается вызвать свойство или метод со ссылкой на объект "null"
			// Код работает. Нехватило времени разобраться 
			for (var i:int = 0; i <= aBirdsArray.length; i++){
				 var currentBird:mcBirdAll = aBirdsArray[i];
				 
				if (currentBird.hitTestObject(ray)){
					var newExplosion:mcExplosion = new mcExplosion();
					stage.addChild(newExplosion);
					newExplosion.x = currentBird.x;
					newExplosion.y = currentBird.y;
					
					aBirdsArray.splice(i, 1);
					currentBird.destroyBird();
				}
			 }
		}
		
		private function deleteBirdsOffScreen():void 
		{
			for (var i:int = 0; i < aBirdsArray.length; i++){
				 var currentBird:mcBirdAll = aBirdsArray[i];
				 
				if (currentBird.canBeDestroied()){
					aBirdsArray.splice(i, 1);
					currentBird.destroyBird();
				}
			 }
		}
		
		private function move(e:MouseEvent):void 
		{
			var sndOnMove:Sound = new onMoveSound();
			var transformSound:SoundTransform = new SoundTransform(0.08, 0);
			var channelForLastSound:SoundChannel;
			if (swordDraged == true){
				channelForLastSound = sndOnMove.play(0, 0, transformSound);
			}
		}
		
		
		
		private function drop(e:MouseEvent):void
		{
			swordDraged = false;
			mcSword.stopDrag();
			mcSword.removeChild(ray);
			channelForDefaultSound.stop();
			playOnceOffSound();
			ray.destroyRay();
			
		}
		
		private function playOnceOffSound():void 
		{
			var sndOff:Sound = new soundClose();
			var transformSound:SoundTransform = new SoundTransform(1, 0.60);
			var channelOff = sndOff.play(800, 0, transformSound);
		}
		
		
		
		private function drag(e:MouseEvent):void 
		{
			//пробовал добавить звук разными способами
			var sndStart:Sound = new Sound();
			var soundStart:URLRequest = new URLRequest("open.mp3");
			sndStart.load(soundStart);
			sndStart.play();
			
			var sndDefault:Sound = new soundDefault();
			var transformSound:SoundTransform = new SoundTransform(0.1, 0.60);
			channelForDefaultSound = sndDefault.play(800, 100, transformSound);
			mcSword.startDrag();
			showRay();
			swordDraged = true;
		}
			
		private function showRay():void 
		{
			ray = new mcRayBlue();
			mcSword.addChild(ray);
		}
		
	}

}