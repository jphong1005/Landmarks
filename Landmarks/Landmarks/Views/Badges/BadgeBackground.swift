//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by 홍진표 on 2022/12/11.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height: CGFloat = width
                let xScale: CGFloat = 0.832
                let xOffset: CGFloat = (width * (1.0 - xScale)) / 2.0
                
                width *= xScale
                
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )   //  The move(to:) method moves the drawing cursor within the bounds of a shape as though an imaginary pen or pencil is hovering over the area, waiting to start drawing.
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )   //  The addLine(to:) method takes a single point and draws it. Successive calls to addLine(to:) begin a line at the previous point and continue to the new point.
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )   //  Use the addQuadCurve(to:control:) method to draw the Bézier curves for the badge’s corners.
                }
            }   //  In BadgeBackground.swift, add a Path shape to the badge and apply the fill() modifier to turn the shape into a view.
            //  -> You use paths to combine lines, curves, and other drawing primitives to form more complex shapes like the badge’s hexagonal background.
            .fill(.linearGradient(
                colors: [Self.gradientStart , Self.gradientEnd], startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }   //  You use GeometryReader to dynamically draw, position, and size views instead of hard-coding numbers that might not be correct when you reuse a view somewhere else in your app, or on a different-sized display.
        .aspectRatio(1, contentMode: .fit)  //  By preserving a 1:1 aspect ratio, the badge maintains its position at the center of the view, even if its ancestor views aren’t square.
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
