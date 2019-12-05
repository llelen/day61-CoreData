//
//  DetailView.swift
//  60_createuserapp
//

//var id: String
//var name: String +
//var age: Int +
//var company: String +
//var email: String
//var address: String
//var about: String+
//var friends: [Friends]
import SwiftUI

struct DetailView: View {
    
    var user: Userr
    var users: FetchedResults<Userr>
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color.white, .green]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView{
                
                VStack(alignment: .leading, spacing: 1){
                    Section{
                        Text("Company: \(user.wrappedcompany), Age: \(user.age)").padding(.top)
                        
                        
                        
                        
                        Text("Address: \(user.wrappedaddress)").padding(.top)
                        Text(user.wrappedemail).underline()
                    }
                }
                Spacer(minLength: 20)
                
                VStack(spacing: 20){
                    
                    Section{
                        Text(user.wrappedabout)
                    }
                    
                    
                    VStack(spacing: 0){
                        Text("Friends").bold().underline().font(.headline).padding()
                        //sort freinds struct array by name property
                        ForEach(user.wrappedfriend){fr in
                            
                            NavigationLink(destination: FrienDetailView(users: self.users, friend: fr)) {
                                Text(fr.wrappedname).font(.headline).underline().padding(2)
                                // Text("\(self.getFriendDetail(friend: friend.name).email)").font(.caption)
                            }//.buttonStyle(BorderedButtonStyle())
                            
                            }.navigationBarTitle(user.wrappedname)
                            .navigationBarItems(trailing:
                                NavigationLink(destination: ContentView(), label: {
                                    Text("Home")
                                })
                        )
                    }
                    
                    Spacer()
                }
            }
        }
    }
}


/*struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: Userr(), users: FetchedResults<Userr>()())
    }
}*/
