import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  final String nama, nim, prodi, agama;

  const Experience(
      {Key? key,
      required this.nama,
      required this.nim,
      required this.prodi,
      required this.agama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: (Colors.grey[200])!,
                blurRadius: 5.0,
                offset: const Offset(0, 3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$nama",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "$nim",
                        style: Theme.of(context).textTheme.subtitle2?.apply(
                              color: Colors.grey,
                            ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Text(
              "$prodi",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.apply(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 9),
            Text(
              "$agama",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.apply(fontWeightDelta: 2),
            )
          ],
        ),
      ),
    );
  }
}
