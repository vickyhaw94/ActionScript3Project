
package {

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.text.*;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel;

	public class main extends MovieClip {

		var player1;
		var player2;
		var arrowW;
		var arrowS;
		var arrowD;
		var boxW, boxS, boxD;
		var randomNum;
		var msgBox;
		var shootSound;
		var end;


		public function main() {
			// constructor code
			player1 = new player(100, 220); //set the player position at the stage(100,220)
			boxW = new box(this, 100, 1);
			boxS = new box(this, 200, 2);
			boxD = new box(this, 300, 3);
			msgBox = new gameInstruction();
			end = new ending();
			
			var myChannel:SoundChannel = new SoundChannel();
			var volumeAdjust:SoundTransform = new SoundTransform();
			var mySound:Sound = new background();
			myChannel.soundTransform = volumeAdjust;
			volumeAdjust.volume = 0.1;
			mySound.play();

			stage.addChild(player1); 
			stage.addChild(boxW);
			stage.addChild(boxS);
			stage.addChild(boxD);
			stage.addChild(msgBox);

			stage.addEventListener(KeyboardEvent.KEY_DOWN, triggerStart);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, shootArrow); //this is used to call the function in order to shoot the arrow
		}
		
		public function triggerStart(e: KeyboardEvent): void {
				switch(e.keyCode){
				case 13:
					trace("Press Enter");
					stage.removeChild(msgBox);
					break;
				default:
					break;
			}
		}

		public function shootArrow(e: KeyboardEvent): void 
		{
			try{
				if (e.keyCode == Keyboard.S) {
					var speed = 16; //the initial speed of the arrow 
					arrowS = new arrow(this, 220, 200);
					stage.addChild(boxW);
					stage.addChild(boxS);
					stage.addChild(boxD);
					stage.addChild(arrowS); //add the arrow to the stage after button A been pressed
					arrowS.setX(arrowS.getX() - speed);
					recordTry();				
					shootSound.playAudioClip();
					trace("the mid arrow move to right");
					
				} else if (e.keyCode == Keyboard.W) {
					var speedW = 16;
					arrowW = new arrow(this, 220, 100);
					stage.addChild(boxW);
					stage.addChild(boxS);
					stage.addChild(boxD);
					stage.addChild(arrowW);
					arrowW.setX(arrowW.getX() - speedW);
					recordTry();				
					shootSound.playAudioClip();
					trace("the up arrow move to right");
					
				} else if (e.keyCode == Keyboard.D) {
					var speedD = 16;
					arrowD = new arrow(this, 220, 300);
					stage.addChild(boxW);
					stage.addChild(boxS);
					stage.addChild(boxD);
					stage.addChild(arrowD);
					arrowD.setX(arrowD.getX() - speedD);
					recordTry();
					shootSound.playAudioClip();
					trace("the down arrow move to right");
				}
			}
			catch(error:Error)
			{}
		}

		public function recordCountW() {
			player1.increaseCount(); //this is used to call the function to increase the count of player
			player1Count.text = player1.getCount() + ""; //update the count bar on the stage
			stage.removeChild(boxW);
			
			if(player1.getCount() == 3)
			{
				stage.addChild(end);
				stage.removeChild(boxW);
				stage.removeChild(boxS);
				stage.removeChild(boxD);
			}
			trace("Player1's count increase to:", player1.getCount()); //this is used to detect whether the player 1 count bar has been updated
		}
		
		
		public function recordCountS()
		{
			player1.increaseCount(); //this is used to call the function to increase the count of player
			player1Count.text = player1.getCount() + ""; //update the count bar on the stage
			stage.removeChild(boxS);
			
			if(player1.getCount() == 3)
			{
				stage.addChild(end);
				stage.removeChild(boxW);
				stage.removeChild(boxS);
				stage.removeChild(boxD);
			}
			trace("Player1's count increase to:", player1.getCount()); //this is used to detect whether the player 1 count bar has been updated
		}
		
		public function recordCountD()
		{
			player1.increaseCount(); //this is used to call the function to increase the count of player
			player1Count.text = player1.getCount() + ""; //update the count bar on the stage
			stage.removeChild(boxD);
			
			if(player1.getCount() == 3)
			{
				stage.addChild(end);
				stage.removeChild(boxW);
				stage.removeChild(boxS);
				stage.removeChild(boxD);
			}
			trace("Player1's count increase to:", player1.getCount()); //this is used to detect whether the player 1 count bar has been updated
		}

		public function recordTry() // used to record how many times player try to guess the correct box
		{
			player1.increaseTry();
			player1Try.text = player1.getTry() + "";
			trace("Player1's try increase to:", player1.getTry());
		}

		public function getArrowW()
		{
			if (1 == randomRange(1,3))
				return arrowW;
		}
		
		public function getArrowS()
		{
			if (2 == randomRange(1,3))
				return arrowS;
		}
		
		public function getArrowD()
		{
			if (3 == randomRange(1,3))
				return arrowD;
		}
		
		public function getBox(randomNum:Number) // used to generate random number match with box number
		{
			if(1 == randomRange(1,3))
				return boxW;
			else if(2 == randomRange(1,3))
				return boxS;
			else if(3 == randomRange(1,3))
				return boxD;
		}
		
		public function randomRange(minNumber:Number, maxNumber:Number):Number
		{
			return (Math.floor(Math.random() * (maxNumber - minNumber + 1)) + minNumber);
		}
	}
}