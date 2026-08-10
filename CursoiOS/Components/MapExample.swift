//
//  MapExample.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 09/08/26.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 19.6418436, longitude: -102.4953904 ),
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            )
        )
    var body: some View {
        Map(position: $position)
            .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
    }
}

#Preview {
    MapExample()
}
