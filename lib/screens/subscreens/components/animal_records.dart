import 'package:flutter/material.dart';
import 'package:my_pet/screens/subscreens/components/info_box.dart';

class AnimalRecords extends StatefulWidget {
  const AnimalRecords({super.key});

  @override
  State<AnimalRecords> createState() => _AnimalRecordsState();
}

class _AnimalRecordsState extends State<AnimalRecords> {
  final List e = const ["Hello", "Hi"];

  switchShit() {}
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                highlightColor: Theme.of(context).primaryColor,
                onTap: () {
                  setState(() {
                    page = 0;
                  });
                },
                child: InfoBox(
                    child: Text("Напоминания",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold))),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  highlightColor: Theme.of(context).hoverColor,
                  onTap: () {
                    setState(() {
                      page = 1;
                    });
                  },
                  child: InfoBox(
                    child: Text("Мед.карта",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 16, color: Color.fromRGBO(0, 0, 0, 0)),
        page == 0
            ? const EventList()
            : const Column(
                children: [
                  InfoBox(
                    child: Text("pet.data\n\n\n\naesdasd\n\n\n\n\nsd"),
                  ),
                  Divider(height: 16, indent: 10, endIndent: 10),
                  EventList()
                ],
              )
      ],
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                        child: Row(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("pet.events[index].note",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                  Text("pet.events[index].date",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge)
                                ]),
                          ],
                        ),
                      ),
                      Ink(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              // iconSize: 32,
                              onPressed: () {},
                              icon: const Icon(Icons.delete))),
                    ]),
              ));
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 16, indent: 10, endIndent: 10),
        itemCount: 10);
  }
}
