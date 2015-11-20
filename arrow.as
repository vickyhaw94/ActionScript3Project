package {

	import flash.display.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class arrow extends MovieClip {

		public var arrowtimer: Timer;
		public var movingDirectionX: Number = 4;
		public var movingDirectionY;
		public var speed: Number = 4;
		private var documentClass;

		public function arrow(theDocumentClass, set_x: Number, set_y: Number) {
			// constructor code
			this.x = set_x;
			this.y = set_y;
			documentClass = theDocumentClass;
			arrowtimer = new Timer(5);
			arrowtimer.addEventListener(TimerEvent.TIMER, moveArrow); //used to store the function moveArrow()
			arrowtimer.start();
		}

		public function setX(newX) {
			this.x = newX;
		}

		public function getX() {
			return this.x;
		}
		
		
		public function moveArrow(e: TimerEvent) //used to move the arrow according the direction x which is preset
		{
			this.x += movingDirectionX;
			//checkForHit();
		}

		
		public function checkForHit() //used to detect whether the arrow hit the object then link to the main class
		{
			if (this.x <= this.width / 2 && movingDirectionX < 0) {
				documentClass.recordCount("player1");
			} else if ((this.x + this.width / 2) >= 1024 && (movingDirectionX > 0) && (this.x + this.width / 2) <= 1030) {
				documentClass.recordCount("player2");
			}
		}
		
		// checkForHit() this function was refer from pong tutorial 
		// Here is the URL https://learn.uq.edu.au/bbcswebdav/pid-1591005-dt-content-rid-7567894_1/courses/DECO2300S_6560_60943/Getting_Started_Pong_Part2.pdf
	}
}