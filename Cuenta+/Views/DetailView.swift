import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentation
    ///: Note that this view doesn't manipulate the `video` object in any way, it just displays it
    /// as such, it doesn't require a binding of any sort to it
    /// adding a binding or state variable to this object is just a waste and might result in unwanted behaviour
    /// a regular constant is better
    
    let video: Video
    
    var body: some View {
        VStack(alignment: .leading) {
            ///: Creating this close button view that takes a closure as an action is the closest we can get to `sellf.view.dismiss()` in SwiftUI I think
            CloseButton(action: { self.presentation.wrappedValue.dismiss() })
            
            Label(video.name, systemImage: video.icon.rawValue)
                .labelStyle(.titleAndIcon)
            
            Text(video.author)
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(video.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(video: VideoStorage.mockVideos.first!)
        }
    }
}

struct CloseButton: View {
    let action: () -> ()
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                action()
            },
                   label: {
                Image(systemName: "clear")
                    .foregroundColor(.red)
            })
            .padding(.bottom, 20)
        }
    }
}
