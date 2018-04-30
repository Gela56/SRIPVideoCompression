import UIKit
import AVFoundation
import Lumina
import Photos
import AVKit

class ViewController: UIViewController{
    
    private var backgroundRecordingID: UIBackgroundTaskIdentifier?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let camera = LuminaViewController()
        camera.delegate = self
        camera.frameRate = 3
        camera.resolution = .highest
        camera.recordsVideo = true
        present(camera, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func captured(videoAt: URL, from controller: LuminaViewController) {
        if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(videoAt.relativePath) {
            UISaveVideoAtPathToSavedPhotosAlbum(videoAt.relativePath, nil, nil, nil)
        }
    }
}

extension ViewController: LuminaDelegate {
    func dismissed(controller: LuminaViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
