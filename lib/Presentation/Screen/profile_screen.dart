import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import '../widget/text_container.dart';
class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(title:const Text('profile Screen'),backgroundColor: Colors.black54,),
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///create animation profile screen
            const Padding(
              padding:  EdgeInsets.all(20.0),
              child: Center(
                child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/mamun.jpeg'),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Center(child: Text('Md.Munatsir Mamun',style: TextStyle(fontSize: 30),)),
            const Center(child: Text('Flutter Developer',style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),)),
            const Divider(
              color: Colors.brown,
              thickness: 2,
              height: 50,
              indent: 20,
              endIndent: 20,
            ),
            const TextContainer(textOne: 'Name: ', textTWo: "Md.Muntasir Mamun"),
            const TextContainer(textOne: "Address: ", textTWo: "Mohammadpur, Dhaka"),
            TextContainer(textOne: 'Bio :', textTWo: loremIpsum(
                words: 50,
                paragraphs: 2,
                initWithLorem: true
            ),
            ),
          ],
        ),
      ),
    );
  }
}


