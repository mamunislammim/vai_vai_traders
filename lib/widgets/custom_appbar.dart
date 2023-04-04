import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,required this.title
  });

  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.green,
      title: Text(title),
    );
  }
}

//
// class App extends StatelessWidget implements PreferredSizeWidget {
//   const App({
//     super.key,
//   });
//
//   @override
//   Size get preferredSize => const Size.fromHeight(100);
//
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return AppBar(
//       title: Row(
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const CircleAvatar(
//               child: Icon(Icons.arrow_back),
//             ),
//           ),
//           Container(
//             width: size.width * .77,
//             margin: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10), color: Colors.white),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintStyle: const TextStyle(
//                   color: Colors.black,
//                 ),
//                 hintText: 'Search here...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 suffixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
