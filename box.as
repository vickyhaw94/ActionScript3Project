package {

	import flash.display.*;
	import flash.utils.Timer;
	import flash.events.*;
	public class box extends MovieClip {

		private var documentClass;
		private var boxNum: Number;
		var randomNum:Number;
	
		public function box(theDocumentClass, set_y: Number, no: Number) {
			// constructor code
			this.x = 600;
			this.y = set_y;
			
			documentClass = theDocumentClass;
			boxNum = no;
			addEventListener(Event.ENTER_FRAME, checkForHit);
		}

		public function checkForHit(e: Event) //used to detect whether the arrow hit the object then link to the main class
		{
			var arrow1 = documentClass.getArrowW()
			var arrow2 = documentClass.getArrowS();
			var arrow3 = documentClass.getArrowD();
			
			try
			{
				if (this.hitTestObject(arrow1) && (getNumW() == randomRange(1,3))) {
					arrow1.setX(3100);
					documentClass.recordCountW();
					documentClass.removeArrow();
					trace("this been hit");
					trace(randomRange(1,3));
				}
				
				else if(this.hitTestObject(arrow2) && (getNumS() == randomRange(1,3))) {
					arrow2.setX(3100);
					documentClass.recordCountS();
					documentClass.removeArrow();
					trace("this been hit");
					trace(randomRange(1,3));
				}
				
				else if(this.hitTestObject(arrow3) && (getNumD() == randomRange(1,3))) {
					arrow3.setX(3100);
					documentClass.recordCountD();
					documentClass.removeArrow();
					trace("this been hit");
					trace(randomRange(1,3));
				}
			}
			
			catch(error:Error){}
		}

		public function getNumW() // used to return number
		{
			return 1;
		}
		
		public function getNumS()
		{
			return 2;
		}

		public function getNumD()
		{
			return 3;
		}
		
		public function randomRange(minNumber:Number, maxNumber:Number):Number
		{
			return (Math.floor(Math.random() * (maxNumber - minNumber + 1)) + minNumber);
		}
	}
}