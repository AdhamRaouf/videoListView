import SwiftUI

struct videoListView: View {
    var videos : [Video] = VideoList.topTen
    var body: some View {
        NavigationView  {
            List {
                ForEach(videos) { video in
                    if #available(iOS 15.0, *) {
                        NavigationLink(destination: videoDetailView(video: video), label: {
                            VideoCell(video: video)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        print("Delete")
                                    } label: {
                                        Label("Delete", systemImage: "trash.circle.fill")
                                    }
                                    
                                    Button {
                                        print("favorite")
                                    } label: {
                                        Label("favorite", systemImage: "star.circle.fill")
                                    }
                                    .tint(.yellow)
                                }
                                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                    Button {
                                        print("Pin")
                                    } label: {
                                        Label("Pin", systemImage: "pin.circle.fill")
                                    }
                                    .tint(.green)
                                }
                        })
                    } else {
                            // Fallback on earlier versions
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Sean's Top 10")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        videoListView()
    }
}

struct VideoCell: View {
    var video: Video
    var body: some View {
        HStack{
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .cornerRadius(5)
                .padding(.vertical, 1)
            
            VStack(alignment: .leading , spacing: 5){
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
