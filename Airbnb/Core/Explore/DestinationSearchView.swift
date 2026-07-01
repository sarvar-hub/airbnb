//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by sarvar on 1/7/2026.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    
    var body: some View {
        VStack{
            Button {
                show.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.white)
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                      
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height:44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(color: .white.opacity(0.2),radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            
            
            // date selection view
            VStack {
                if selectedOption == .dates {
                    HStack {
                        Text("Show expended view")
                        
                        Spacer()
                    }
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(color: .white.opacity(0.2),radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates }
            }
            
            // num guests view
            VStack {
                if selectedOption == .guests {
                    HStack {
                        Text("Show expended view")
                        
                        Spacer()
                    }
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(color: .white.opacity(0.2),radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }

        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(true))
}


struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
