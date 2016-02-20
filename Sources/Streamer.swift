import Foundation
class Streamer {
	static func startStreaming(resourceURL: String) {
	    print("Starting Stream...")
	    system("mplayer -vo caca -noautosub -really-quiet -monitorpixelaspect 0.9 "+resourceURL)
	}
}