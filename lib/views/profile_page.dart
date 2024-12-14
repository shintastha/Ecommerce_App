import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppPalette.backgroundColor,
      //   title: const Text('Profile'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://www.w3schools.com/w3images/avatar2.png'),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: GestureDetector(
                      onTap: () {
                        // Handle image change
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppPalette.primaryColor,
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Name and Email
            const Center(
              child: Column(
                children: [
                  TextWidget(
                    text: "John Doe",
                    size: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                      text: "johndoe@gmail.com",
                      size: 18,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Edit Button
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Handle edit action
                },
                child: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Settings and Logout options
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout action
                Get.offAndToNamed('/auth_screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: const Text(
//           'Profile',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Profile Picture with Camera Icon
//               Center(
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     CircleAvatar(
//                       radius: 80,
//                       backgroundImage: NetworkImage(
//                           'https://www.w3schools.com/w3images/avatar2.png'),
//                       backgroundColor: Colors.blueGrey,
//                     ),
//                     Positioned(
//                       bottom: -10,
//                       right: -10,
//                       child: GestureDetector(
//                         onTap: () {
//                           // Handle image change
//                         },
//                         child: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.blueAccent,
//                           child: Icon(
//                             Icons.camera_alt,
//                             size: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Name and Email
//               Text(
//                 'John Doe',
//                 style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 26,
//                       color: Colors.black,
//                     ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 'johndoe@example.com',
//                 style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 18,
//                     ),
//               ),
//               const SizedBox(height: 30),

//               // Edit Profile Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle edit action
//                 },
//                 child: const Text('Edit Profile'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 5,
//                   shadowColor: Colors.blueAccent.withOpacity(0.5),
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // Settings and Logout options with Dividers
//               ProfileOptionTile(
//                 icon: Icons.settings,
//                 title: 'Settings',
//                 onTap: () {
//                   // Navigate to settings page
//                 },
//               ),
//               const Divider(),
//               ProfileOptionTile(
//                 icon: Icons.logout,
//                 title: 'Logout',
//                 onTap: () {
//                   // Handle logout action
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProfileOptionTile extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;

//   const ProfileOptionTile({
//     required this.icon,
//     required this.title,
//     required this.onTap,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onTap,
//       leading: Icon(
//         icon,
//         color: Colors.blueAccent,
//         size: 30,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 18,
//           color: Colors.black,
//         ),
//       ),
//       trailing: Icon(
//         Icons.arrow_forward_ios,
//         size: 20,
//         color: Colors.grey[600],
//       ),
//     );
//   }
// }


// // import 'package:flutter/material.dart';

// // class ProfilePage extends StatelessWidget {
// //   static route() => MaterialPageRoute(
// //         builder: (context) => const ProfilePage(),
// //       );
// //   const ProfilePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       body: Text("Profile"),
// //     );
// //   }
// // }