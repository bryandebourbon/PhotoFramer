import SwiftUI

func processImage(_ inputImage: UIImage, targetSize: CGSize) -> UIImage? {
    let originalAspectRatio = inputImage.size.width / inputImage.size.height
    let targetAspectRatio = targetSize.width / targetSize.height
    
    var newSize: CGSize
    var xOffset: CGFloat = 0
    var yOffset: CGFloat = 0
    
    if originalAspectRatio > targetAspectRatio {
        newSize = CGSize(width: targetSize.height * originalAspectRatio, height: targetSize.height)
        xOffset = (targetSize.width - newSize.width) / 2
    } else {
        newSize = CGSize(width: targetSize.width, height: targetSize.width / originalAspectRatio)
        yOffset = (targetSize.height - newSize.height) / 2
    }
    
    UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
    UIColor.black.set()
    UIRectFill(CGRect(origin: .zero, size: targetSize))
    
    inputImage.draw(in: CGRect(origin: CGPoint(x: xOffset, y: yOffset), size: newSize))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
}

func saveImageToPhotos(processedImage: UIImage?) {
    guard let processedImage = processedImage else { return }
    UIImageWriteToSavedPhotosAlbum(processedImage, nil, nil, nil)
    //showingSaveAlert = true
    }
