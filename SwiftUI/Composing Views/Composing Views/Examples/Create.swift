//
//  Create.swift
//  Composing Views
//
//  Created by Slash on 2023/07/09.
//

import SwiftUI

struct Employee {
    var name: String
    var jobTitle: String
    var emailAddress: String
    var profilePicture: String
}

struct ProfilePicture: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct EmailAddress: View {
    var address: String

    var body: some View {
        HStack {
            Image(systemName: "envelope")
            Text(address)
        }
    }
}

struct EmployeeDetails: View {
    var employee: Employee

    var body: some View {
        VStack(alignment: .leading) {
            Text(employee.name)
                .font(.largeTitle)
                .foregroundStyle(.primary)
            Text(employee.jobTitle)
                .foregroundStyle(.secondary)
            EmailAddress(address: employee.emailAddress)
        }
    }
}

struct EmployeeView: View {
    var employee: Employee

    var body: some View {
        HStack {
            ProfilePicture(imageName: employee.profilePicture)
            EmployeeDetails(employee: employee)
        }
    }
}

struct Create: View {
    let employee = Employee(name: "Slash", jobTitle: "guitarist", emailAddress: "Slash@gmail.com", profilePicture: "channels4_profile")

    var body: some View {
        EmployeeView(employee: employee)
    }
}

struct Create_Previews: PreviewProvider {
    static var previews: some View {
        Create()
    }
}
