package {

	import flash.display.*;
	public class player extends MovieClip {

		public var playerCount: Number = 0; //default player's count = 0
		public var playerTry : Number = 0;

		public function player(xPosition, yPosition) {
			// constructor code
			this.x = xPosition;
			this.y = yPosition;
		}

		public function increaseCount(): void //the function to increase player's count
		{
			this.playerCount++;
		}

		public function getCount() //used to get the player count then only can update the count bar text
		{
			return this.playerCount;
		}
		
		public function increaseTry(): void 
		{
			this.playerTry++;
		}
		
		public function getTry() //used to get the player count then only can update the try bar text
		{
			return this.playerTry;
		}
	}
}