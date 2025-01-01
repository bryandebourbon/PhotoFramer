import SwiftUI

struct ContentView: View {
    @State private var image: UIImage?
    @State private var processedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var widthText = "200"
    @State private var heightText = "200"
    @State private var showingSaveAlert = false
    
    var body: some View {
        VStack {
            Button("Select Image") {
                showingImagePicker = true
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $image)
            }
            
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .opacity(processedImage != nil ? 0 : 1)
                } else {
                    
                }
                if let processedImage = processedImage {
                    Image(uiImage: processedImage)
                        .resizable()
                        .scaledToFit()
                } else {
                    
                }
                
            
            HStack {
                Text("W:")
                TextField("Width", text: $widthText)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Text("H:")
                TextField("Height", text: $heightText)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            
            HStack {
                if let image = image, let width = Int(widthText), let height = Int(heightText) {
                    Button("Process Image") {
                        processedImage = processImage(image, targetSize: CGSize(width: width, height: height))
                    }
                }
                
                Spacer()
                
                if processedImage != nil {
                    Button("Download Image") {
                        if (processedImage != nil){ 
                        saveImageToPhotos(
                            processedImage:processedImage
                        )
                        }
                    }
                    .alert(isPresented: $showingSaveAlert) {
                        Alert(title: Text("Saved"), message: Text("Your image has been saved to your photos."), dismissButton: .default(Text("OK")))
                    }
                }
            }
        }
        .padding()
    }
    
    
    
    
}
