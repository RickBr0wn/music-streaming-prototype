//
//  ContentView.swift
//  music-streaming-prototype
//
//  Created by Rick Brown on 22/10/2021.
//

import SwiftUI

struct Album: Hashable {
  var id = UUID()
  var name: String
  var image: String
  var songs: [Song]
}

struct Song: Hashable {
  var id = UUID()
  var name: String
  var time: String
}

struct AlbumArt: View {
  var album: Album
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Image(album.image)
        .resizable()
        .scaledToFill()
        .frame(width: 170, height: 200, alignment: .center)
      
      ZStack {
        Blur(style: .dark)
        
        Text(album.name)
          .foregroundColor(.white)
      }
      .frame(height: 60)
    }
    .frame(width: 170, height: 200, alignment: .center)
    .clipped()
    .cornerRadius(20.0)
    .shadow(radius: 10.0)
    .padding(20)
  }
}

struct SongCell: View {
  var song: Song
  
  var body: some View {
    HStack {
      ZStack {
        Circle()
          .frame(width: 50, height: 50, alignment: .center)
          .foregroundColor(.blue)
        
        Circle()
          .frame(width: 10, height: 10, alignment: .center)
          .foregroundColor(.white)
      }
      
      Text(song.name)
        .fontWeight(.bold)
      
      Spacer()
      
      Text(song.time)
    }
    .padding(20)
  }
}

struct ContentView: View {
  var albums: [Album] = [
    Album(name: "Album #1", image: "1", songs: [
      Song(name: "Song #1", time: "2:36"),
      Song(name: "Song #2", time: "2:36"),
      Song(name: "Song #3", time: "2:36"),
      Song(name: "Song #4", time: "2:36"),
      Song(name: "Song #5", time: "2:36"),
      Song(name: "Song #6", time: "2:36")
    ]),
    Album(name: "Album #2", image: "2", songs: [
      Song(name: "Song #7", time: "2:36"),
      Song(name: "Song #8", time: "2:36"),
      Song(name: "Song #9", time: "2:36"),
      Song(name: "Song #10", time: "2:36"),
      Song(name: "Song #11", time: "2:36"),
      Song(name: "Song #12", time: "2:36")
    ]),
    Album(name: "Album #3", image: "3", songs: [
      Song(name: "Song #13", time: "2:36"),
      Song(name: "Song #14", time: "2:36"),
      Song(name: "Song #15", time: "2:36"),
      Song(name: "Song #16", time: "2:36"),
      Song(name: "Song #17", time: "2:36"),
      Song(name: "Song #18", time: "2:36")
    ]),
    Album(name: "Album #4", image: "4", songs: [
      Song(name: "Song #19", time: "2:36"),
      Song(name: "Song #20", time: "2:36"),
      Song(name: "Song #21", time: "2:36"),
      Song(name: "Song #22", time: "2:36"),
      Song(name: "Song #23", time: "2:36"),
      Song(name: "Song #24", time: "2:36")
    ]),
    Album(name: "Album #5", image: "5", songs: [
      Song(name: "Song #25", time: "2:36"),
      Song(name: "Song #26", time: "2:36"),
      Song(name: "Song #27", time: "2:36"),
      Song(name: "Song #28", time: "2:36"),
      Song(name: "Song #29", time: "2:36"),
      Song(name: "Song #30", time: "2:36")
    ]),
    Album(name: "Album #6", image: "6", songs: [
      Song(name: "Song #31", time: "2:36"),
      Song(name: "Song #32", time: "2:36"),
      Song(name: "Song #33", time: "2:36"),
      Song(name: "Song #34", time: "2:36"),
      Song(name: "Song #35", time: "2:36"),
      Song(name: "Song #36", time: "2:36")
    ]),
  ]
  
  @State private var currentAlbum: Album?
  
  var body: some View {
    NavigationView {
      ScrollView {
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack {
            ForEach(self.albums, id: \.self) { album in
              AlbumArt(album: album)
                .onTapGesture { self.currentAlbum = album }
            }
          }
        }
        LazyVStack {
          ForEach((self.currentAlbum?.songs ?? self.albums.first?.songs) ?? [
            Song(name: "Song #1", time: "2:36"),
            Song(name: "Song #2", time: "2:36"),
            Song(name: "Song #3", time: "2:36"),
            Song(name: "Song #4", time: "2:36"),
            Song(name: "Song #5", time: "2:36"),
            Song(name: "Song #6", time: "2:36")
          ], id: \.self) { song in
              SongCell(song: song)
          }
        }
      }
      .navigationBarTitle("My Band Name")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    SongCell(song: Song(name: "Song #1", time: "2:36"))
  }
}
