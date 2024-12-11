import SwiftUI

struct Home: View {
    @State private var isShowingMenu = false
    @State private var isShowingCamera = false
    @State private var isShowingImagePicker = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Dark mode background
            
            VStack {
                Spacer()

                // Display the image with rounded corners and closer to the middle
                Image("toji")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300) // Adjust the height as needed
                    .cornerRadius(20) // Rounded corners
                    .padding(.bottom, 30) // Reduce spacing between the image and the button
                
                
                Button(action: {
                    isShowingMenu = true
                }) {
                    Text("Scan")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
        .actionSheet(isPresented: $isShowingMenu) {
            ActionSheet(title: Text("Scan Options"), buttons: [
                .default(Text("Take a Photo")) {
                    isShowingCamera = true
                },
                .default(Text("Choose an Existing Image")) {
                    isShowingImagePicker = true
                },
                .cancel()
            ])
        }
        .sheet(isPresented: $isShowingCamera) {
            ImagePicker(sourceType: .camera)
        }
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(sourceType: .photoLibrary)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                // Handle the selected image here
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
