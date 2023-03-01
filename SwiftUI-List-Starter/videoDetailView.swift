//
//  videoDetailView.swift
//  SwiftUI-List-Starter
//
//  Created by Adham Raouf on 11/10/2022.
//

import SwiftUI

struct videoDetailView: View {
    var video: Video
    var body: some View {
        VStack(spacing:20){
            Spacer()
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(150)
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 65)
            HStack(spacing:30){
                Label("\(video.viewCount)", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text(video.description)
                .font(.subheadline)
                .padding(40)
            Spacer()
            Link(destination: video.url, label: {
                Text("Watch Now")
                    .bold()
                    .font(.title2)
                    .frame(width: 280 , height: 60)
                    .background(Color(.systemRed))
                    .foregroundColor(.white)
                    .cornerRadius(50)
            })
            Spacer()
        }
    }
}

struct videoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        videoDetailView(video: VideoList.topTen.first!)
    }
}
