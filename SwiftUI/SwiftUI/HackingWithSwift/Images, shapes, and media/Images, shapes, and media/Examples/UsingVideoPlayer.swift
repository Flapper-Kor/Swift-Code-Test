//
//  UsingVideoPlayer.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/01.
//

import SwiftUI
import AVKit
/*
 Updated for Xcode 15 beta 1

 SwiftUI’s VideoPlayer view lets us playback movies from any URL, local or remote. It comes from the AVKit framework, so you should make sure and add import AVKit before trying it out.

 As an example, if you had video.mp4 in your app bundle and wanted to play it back, you’d use this:
 */

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    let videoId: String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}

struct CollectionView: View {
    var ids = ["HVNxfI8XYMw", "hnanNlDbsE4", "GOb70rO9JUY"]
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Using WebView\nUIViewRepresentable")
                        .font(.title)

                    ForEach(ids, id:\.self) {idData in
                        YouTubeView(videoId: idData)
                            .frame(width: 300, height: 300)
                            .padding()
                    }
                }
            }
        }
    }
}

struct AVPlayerView: View {
    // AVPlayer can't read .mkv (맥에서 기본으로 지원되는 코덱만을 읽을 수 있는 듯 하고, 추가 코덱을 위한 코덱 플러그인 지원하지 않는다고 한다.
    // remember that we are using third party movie player to execute .mkv file in mac.
    
    // 아래와 같이 번들 url 로 동영상 불러올 때 주의할 점은 프로젝트 [target]->[build phase]->[bundle resources] 에 등록 확인을 할 것.
    // 이미지와 달리 자동으로 등록되지 않는 듯.
    @State var player : AVPlayer? = nil
    @State var isPlaying: Bool = false
    
    // 불러올 파일명 (번들에 포함된) 파일 이름을 틀려서 url nil을 반환하면, player 값은 nil 이지만, VideoPlayer는 생성됨.
    // VideoPlayer(player: <#T##AVPlayer?#>)
    var fileName: String = "some file name..."
    var extention: String = "m4v"
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(width: 320, height: 180, alignment: .center)
            Button {
                isPlaying ? player?.pause() : player?.play()
                isPlaying.toggle()
                player?.seek(to: .zero)
            } label: {
                Image(systemName: isPlaying ? "stop" : "play")
                    .padding()
            }
            Spacer(minLength: 50)
        }
        .task {
            guard let url = Bundle.main.url(forResource: fileName,
                                            withExtension: extention) else { return }
            self.player = AVPlayer(url: url)
        }
    }
}

struct AVPlayerView_Web: View {
    // AVPlayer can't read .mkv (맥에서 기본으로 지원되는 코덱만을 읽을 수 있는 듯 하고, 추가 코덱을 위한 코덱 플러그인 지원하지 않는다고 한다.
    // remember that we are using third party movie player to execute .mkv file in mac.
    @State var url : URL? = nil
    var body: some View {
        VStack {
            if let url{
                let _ = print(url)
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(width: 320, height: 180, alignment: .center)
            }
        }
        .task {
//            self.url = URL(string: "내ㅡㄷ")
            // 동영상 플랫폼 등에서 제공하는 url 말고 실제 파일의 url을 말하는 것
            // 로컬 파일로 테스트를 해보려면 파일을 웹브라우저로 열어서 나온 file:///xxx.mp4 와 같이 표현된 url 을 넣어서 테스트 하면 된다.
        }
    }
}

struct UsingVideoPlayer: View {
    
    var body: some View {
        VStack {
            ScrollView() {
                CollectionView() // 유튜브 등의 콘텐츠 재생을 위해서는 웹뷰를 활용하거나

                AVPlayerView()   // 맥에서 지원하는 코덱을 활용할 수 있는 경우에만 짧은 동영상을 앱번들에 추가하여 활용할 수 있을 듯 한데;;;
                // AVPlayer 의 활용 용도는 아직 잘 모르겠다.
                AVPlayerView_Web()
            }
        }
    }
}



struct UsingVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        UsingVideoPlayer()
    }
}
