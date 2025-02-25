import ARKit
import RealityKit
import Foundation

class LidarScanner: NSObject, ARSessionDelegate {
    private var arView: ARView?
    private var scanResult: String = ""

    func startScanning() -> String {
        let sceneView = ARSCNView()
        let configuration = ARWorldTrackingConfiguration()
        configuration.sceneReconstruction = .meshWithClassification
        sceneView.session.run(configuration)

        guard let frame = sceneView.session.currentFrame else { return "" }
        let meshAnchors = frame.anchors.compactMap { $0 as? ARMeshAnchor }

        var pointCloudData = ""
        for mesh in meshAnchors {
            let vertices = mesh.geometry.vertices
            for index in 0..<vertices.count {
                let vertex = vertices[index]
                pointCloudData += "\(vertex.x) \(vertex.y) \(vertex.z)\n"
            }
        }

        scanResult = pointCloudData
        return scanResult
    }
}
