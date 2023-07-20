import SwiftUI

struct ContentView: View {
    
    @State var todos: [String] = []
    @State var input = ""
    
    var body: some View {
        VStack {
            TextField("ToDoを追加する", text: $input, onCommit: {
                self.todos.append(input)
                self.input = ""
                UserDefaults.standard.set(todos, forKey: "hogehoge")
            })
                
            List {
                ForEach(todos, id:\.self) { todo in
                    Text(todo)
                }
                .onDelete(perform: deleteRow)
            }
            .onAppear {
                if let h = UserDefaults.standard.object(forKey: "hogehoge") as? [String] {
                    todos = h
                }
            }
        }
    }
    
    func deleteRow(at indexSet: IndexSet) {
        self.todos.remove(atOffsets: indexSet)
        UserDefaults.standard.set(todos, forKey: "hogehoge")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
