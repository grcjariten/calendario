import 'package:flutter/material.dart';
import '../utils/objects.dart';

//This will create the list from _selectedEvents
Widget buildList(List<Item> events, BuildContext context) {

  return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (context, index) {

          return Container(
            color: events[index].tileColor,
            child: ListTile(
              title: Text(events[index].filterTitle()),
              trailing: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () async {
                  // )); //TODO: Delete this garbage once you've done.
                  print("Insert something here");

                },
              ),
            ),
          );
        },
      ),

  );
}