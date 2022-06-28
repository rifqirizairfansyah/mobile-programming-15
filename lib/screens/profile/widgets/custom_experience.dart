import 'package:flutter/material.dart';
import 'package:pertemuan15/screens/profile/widgets/experience.dart';

class ExperienceContainer extends StatelessWidget {
  final String scrollKey;
  final List<Experience> list;
  const ExperienceContainer(this.scrollKey, this.list, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            key: PageStorageKey(scrollKey),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (ctx, i) {
                return Experience(
                  nim: list[i].nim,
                  nama: list[i].nama,
                  prodi: list[i].prodi,
                  agama: list[i].agama,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
