package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author HnatiukAlexander
	 */
	public class lightSaber extends MovieClip 
	{
		public var mcSword:MovieClip;
		public var ray:mcRayBlue;
		public var swordDraged:Boolean;
		
		public var channelForDefaultSound:SoundChannel;
		
		
		public function lightSaber() 
		{
			super();
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		}

		
		private function gameLoop(e:Event):void{
			mcSword.addEventListener(MouseEvent.MOUSE_DOWN, drag);
			mcSword.addEventListener(MouseEvent.MOUSE_UP, drop);
			mcSword.addEventListener(MouseEvent.MOUSE_MOVE, move);
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