//
//  RenderingToPDF.swift
//  Drawing
//
//  Created by Slash on 2023/07/05.
//

/*
 Updated for Xcode 15 beta 1

 New in iOS 16

 SwiftUI’s ImageRenderer class can render views any SwiftUI views to PDFs, and yes: all the text and shapes remain vectors, so they scale up beautifully.

 Creating a PDF with ImageRenderer takes eight steps:

 Deciding which views you want to render.
 Creating a URL where SwiftUI can write the image data.
 Calling render() on the image renderer to start your rendering code.
 Telling SwiftUI how big you want the PDF to be. This might be a fixed size like A4 or US Letter, or might be the size of the view hierarchy you’re rendering.
 Create a CGContext object to handle the PDF pages.
 Starting a new page.
 Rendering the SwiftUI views onto that page.
 Ending the page and closing the PDF document.
 Once that finishes the PDF URL is yours to do with as you please.

 I know that sounds like a lot of work, but the total amount of code isn’t so bad. Here’s a complete example that renders a view to a PDF to be exported using ShareLink, with comments matching the explanation above:
 */
import SwiftUI

@MainActor
struct RenderingToPDF: View {
    var body: some View {
        ShareLink("Export PDF", item: render())
    }

    func render() -> URL {
        // 1: Render Hello World with some modifiers
        let renderer = ImageRenderer(content:
            Text("Hello, world!")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(Capsule())
        )

        // 2: Save it to our documents directory
        let url = URL.documentsDirectory.appending(path: "output.pdf")

        // 3: Start the rendering process
        renderer.render { size, context in
            // 4: Tell SwiftUI our PDF should be the same size as the views we're rendering
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)

            // 5: Create the CGContext for our PDF pages
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                return
            }

            // 6: Start a new PDF page
            pdf.beginPDFPage(nil)

            // 7: Render the SwiftUI view data onto the page
            context(pdf)

            // 8: End the page and close the file
            pdf.endPDFPage()
            pdf.closePDF()
        }

        return url
    }
}

struct RenderingToPDF_Previews: PreviewProvider {
    static var previews: some View {
        RenderingToPDF()
    }
}
