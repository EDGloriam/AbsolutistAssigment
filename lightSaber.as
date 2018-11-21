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
		
		public var channelForDefaultSound:SoundChannel;
		
		
		public function lightSaber() 
		{
			super();	
			var sndOnMove:Sound = new Sound();
			var soundOnMove:URLRequest = new URLRequest("onMove.mp3");
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
			channelForDefaultSound.stop();
			playOnceOffSound();
			
		}
		
		private function playOnceOffSound():void 
		{
			var sndOff:Sound = new soundClose();
			var transformSound:SoundTransform = new SoundTransform(1, 0.60);
			var channelOff = sndOff.play(800, 0, transformSound);
			//channelOff.stop();
		}
		
		
		
		private function drag(e:MouseEvent):void 
		{
			var sndStart:Sound = new Sound();
			var soundStart:URLRequest = new URLRequest("open.mp3");
			sndStart.load(soundStart);
			sndStart.play();
			
			var sndDefault:Sound = new soundDefault();
			var transformSound:SoundTransform = new SoundTransform(1, 0.60);
			channelForDefaultSound = sndDefault.play(800, 100, transformSound);

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