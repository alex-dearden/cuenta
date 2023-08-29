//
//  CreateAccount.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var name: String = ""
    @State private var emails: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            Section("Account") {
                TextField("Name", text: $name)
                TextField("Emails", text: $emails)
                SecureField("Password", text: $password)
                    
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
