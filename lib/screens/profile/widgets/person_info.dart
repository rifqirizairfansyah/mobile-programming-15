import 'package:flutter/material.dart';
import 'package:pertemuan15/model/profile.dart';
import 'profile.dart';

class PersonInfo extends StatelessWidget {
  final Profile profile;
  const PersonInfo(this.profile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            profile.name!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 5),
          Text(
            profile.twitter!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Text(
            profile.desc!,
            style: const TextStyle(
                fontSize: 16, height: 1.5, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            profile.email!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
