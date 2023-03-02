import 'package:flutter/material.dart';

List profileName = [
  'Nithu',
  'Rafath',
  'Shafeeq',
  'Manoos',
  'Sideeque',
  'Unais',
  'Fidha',
  'Basim',
  'Sahal Og',
  'Naja',
  'Anas',
  'Sahar',
];
List profileImage = [
  "images/nithu.png",
  "images/rafath.jpg",
  "images/shafeeq.jpg",
  "images/manoos.jpg",
  "images/sideeque.jpg",
  "images/unais.webp",
  "images/fidha.jpg",
  "images/basim.jpg",
  "images/sahal.jpg",
  "images/femin.jpg",
  "images/anas.jpg",
  "images/sahar.jpg",
  ];

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) => ListTile(
              leading: index %2==1
              ? CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(profileImage[index]),
              )
              : SizedBox(
                height: 60,
                width: 60,
                child: Image.asset(profileImage[index])), 
              title: Text(profileName[index]),
              subtitle:index % 3 ==0        
               ?Text("sent $index m ago")
               :Text("seen $index h ago"),
            )),
        separatorBuilder: ((context, index) => const Divider(thickness: 1,)),
        itemCount: 12);
  }
}
