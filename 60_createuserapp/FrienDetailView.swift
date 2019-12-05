//
//  FrienDetailView.swift
//  60_createuserapp
//


import SwiftUI

struct FrienDetailView: View {
    var users : FetchedResults<Userr>

    var friend: Friendd
    var friendUser: Userr {
        users.first{ $0.wrappedname == friend.wrappedname} ?? users[0]
    }
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color.green, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        
        ScrollView{
            
            Text(friend.wrappedname).bold().font(.headline).padding(10)
              VStack(alignment: .leading, spacing: 1){
           Section{
            Text("Company: \(friendUser.wrappedcompany), Age: \(friendUser.age)")
            Text("Address: \(friendUser.wrappedaddress)")
            Text(friendUser.wrappedemail).underline()
            }
            
            }.padding(1)
            
  
            
            
            Spacer(minLength: 20)
            
            VStack(spacing: 20){
                
                Section{
                    Text(friendUser.wrappedabout)
                }
                
                
                VStack(spacing: 0){
                    Text("Friends").bold().underline().font(.headline).padding()
                    ForEach(friendUser.wrappedfriend){fr in
                        
                        NavigationLink(destination: FrienDetailView(users: self.users, friend: fr)) {
                            Text(fr.wrappedname).font(.headline).underline().padding(2)
                            // Text("\(self.getFriendDetail(friend: friend.name).email)").font(.caption)
                        }//.buttonStyle(PlainButtonStyle())
                        
                        
                        
                    }
                }   .navigationBarItems(trailing:
                    NavigationLink(destination: ContentView(), label: {
                        Text("Home")
                    })
                )
                
                Spacer()
            }
        }
        }
    }
    

    
    
    
    //i can just use first(where:) intead of filter
    func getFriendDetail(friend: String)->Userr{
        //the struct where name = friend
        let friendDetail = users.filter{$0.name == friend}
        //if there wasn't a user with a name of friend
        if friendDetail.isEmpty{
            return Userr()
        }
        return friendDetail[0]
    }
}

/*struct FrienDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrienDetailView(users: [Userr](), friend: Friendd())
    }
}*/
