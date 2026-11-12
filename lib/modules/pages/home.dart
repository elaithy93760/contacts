import 'package:contact/core/theme/app_colors.dart';
import 'package:contact/modules/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:contact/modules/widgets/bottom_sheet.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ContactCard> cards = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/Route.png', width: 117, height: 39),
      ),
      body: cards.isEmpty
          ? Column(
              children: [
                Spacer(flex: 1),
                Image.asset("assets/images/noContact.png"),
                Text(
                  "There is No Contacts Added Here",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.beige,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(flex: 3),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(18),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 284,
                ),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final contact = cards[index];
                  return ContactCard(
                    name: contact.name,
                    email: contact.email,
                    phone: contact.phone,
                    image: contact.image,
                    onDelete: () {
                      setState(() {
                        cards.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
      floatingActionButton: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (cards.isNotEmpty)
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  cards.removeLast();
                });
              },
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.delete, color: Colors.white),
            ),

          const SizedBox(width: 12),

          if (cards.length < 6)
            FloatingActionButton(
              onPressed: () async {
                final ContactCard? newContact =
                    await showModalBottomSheet<ContactCard>(
                      backgroundColor: AppColors.backgroundColor,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => const AddBottomSheet(),
                    );

                if (newContact != null) {
                  setState(() {
                    cards.add(newContact);
                  });
                }
              },
              backgroundColor: AppColors.beige,
              child: const Icon(Icons.add, size: 30, color: Colors.black),
            ),
        ],
      ),
    );
  }
}
