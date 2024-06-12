import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/coupleim.jpg'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    // Add other styling properties as needed
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Age',
                    // Add other styling properties as needed
                  ),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  items: ['Male', 'Female', 'Other'].map((gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Handle gender selection
                  },
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    // Add other styling properties as needed
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Handle login button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.pink[100], // mild sexy background color
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Text('My Profile'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewProfilePage()),
                  );
                },
                child: Text('View Profile'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessagesPage()),
                  );
                },
                child: Text('Messages'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get user's information from login page
    String name = ""; // Replace with user's name
    String age = ""; // Replace with user's age
    String gender = ""; // Replace with user's gender

    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.red[100], // gentle romantic background color
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: $name'),
              Text('Age: $age'),
              Text('Gender: $gender'),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Profile')),
      body: ListView.builder(
        itemCount: 5, // Assuming there are 5 profiles
        itemBuilder: (context, index) {
          // Get profile information from database or API
          String name = "User $index";
          int age = 20 + index;
          String gender = index % 2 == 0 ? "Male" : "Female";

          return ListTile(
            title: Text('Name: $name, Age: $age, Gender: $gender'),
            leading: CircleAvatar(
              // Placeholder avatar
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage("images/couple2.jpg"),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle interested action
                  },
                  child: Text('Interested'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle not interested action
                  },
                  child: Text('Not Interested'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Humour.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'No Messages for you',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white), // Corrected font size syntax
              ),
            ),
          ],
        )
      ),
    );
  }
}
