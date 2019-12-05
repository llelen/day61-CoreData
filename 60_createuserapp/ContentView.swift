//
//  ContentView.swift
//  60_createuserapp
//


import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Userr.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Userr.name, ascending: true)]) var usersC: FetchedResults<Userr>
    
    
    @State var users: [User] = []///DataModel.getJson()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(usersC){user in
                    NavigationLink(destination: DetailView(user: user, users: self.usersC)) {
                        
                        VStack(alignment: .leading){
                            Text(user.wrappedname).bold()
                            Text("company: \(user.wrappedcompany)").font(.callout)
                            Text(user.wrappedemail).underline()
                        }
                    }//.buttonStyle(PlainButtonStyle())
                }
                
            }.onAppear{self.getJson()}//list
                .navigationBarTitle("Users List", displayMode: .inline)
        }//navview
        
    }//body
    
    func getJson()  {
        
        let string = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: string) else {print("invalid url"); return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil && data != nil else {
                print("error getting data from url, \(error?.localizedDescription)"); return }
            
            
                if let result = try? JSONDecoder().decode([User].self, from: data!){
                    self.users = result//.sorted {$0.name < $1.name }
                    for u in self.users{
                        for f in u.friends{
                            let fr = Friendd(context: self.context)
                            fr.name = f.name
                            fr.id = f.id
                            fr.origin = Userr(context: self.context)
                            fr.origin?.name = u.name
                            fr.origin?.id = u.id
                            fr.origin?.address = u.address
                            fr.origin?.about = u.about
                            fr.origin?.age = Int16(u.age)
                            fr.origin?.email = u.email
                            fr.origin?.company = u.company
                            try? self.context.save()
                        }
                        
                    }
                    
                }
                else{print("error json decode")}
                
           
            
        }.resume()
        
    }
    
}

