package  {
	
	import flash.display.MovieClip;
	
	//loading files
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	//playing sounds
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.*;
	
	public class audioClip {

		public var clipName:String;
		public var clipFile:String;
		public var clipAudio:Sound;
		public var clipChannel:SoundChannel;
		public var clipPlaying:Boolean = false;
		public var clipTimer:Timer;
		
		// set the name
		clipName = arrowSound;
		
		// create the file name
		clipFile = "sounds/"+clipName+".mp3";
		
		// load the sound
		var mySound = new Sound();
		mySound.load(new URLRequest(clipFile));
		clipAudio = mySound;
		
		public function playAudioClip()
		{
			// play the sound
			var myChannel:SoundChannel = new SoundChannel();
			myChannel = this.clipAudio.play();
			this.clipChannel = myChannel;
		}
	}
}