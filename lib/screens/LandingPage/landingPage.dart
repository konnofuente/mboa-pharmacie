import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/Theme/app_theme.dart';
import 'package:mboa_pharmacie/models/MedicalDocument.dart';

class LandingPage extends StatelessWidget {
  final List<NewsItem> newsItems = [
    NewsItem(
      imageUrl:
          'https://th.bing.com/th/id/R.62091db5126e9e421221c1c7fa55123c?rik=cLkv4BYOdBC9xQ&pid=ImgRaw&r=0', // Image you've added to your assets or a network image URL
      title: 'Hôpital : état de disponibilité de 3 spécialités',
      date: '11 Janvier 2024',
    ),
    NewsItem(
      imageUrl:
          'https://th.bing.com/th/id/R.62091db5126e9e421221c1c7fa55123c?rik=cLkv4BYOdBC9xQ&pid=ImgRaw&r=0',
      title: 'Disponibilité des médicaments en ville et à l\'hôpital',
      date: '11 Janvier 2024',
    ),
    // Add more items if needed
  ];

  List<MedicalDocument> dummyMedicalDocuments = [
    MedicalDocument(
      name: 'Analyse ordonnance',
      imgUrl: 'https://th.bing.com/th/id/R.30cb72efd312b2a3c668065be1ed14ea?rik=lw1mgk81YwgsCQ&pid=ImgRaw&r=0',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'recherche',
      imgUrl: 'https://icon-library.com/images/medical-equipment-icon/medical-equipment-icon-14.jpg',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'Analyse ordonnance',
      imgUrl: 'https://th.bing.com/th/id/R.30cb72efd312b2a3c668065be1ed14ea?rik=lw1mgk81YwgsCQ&pid=ImgRaw&r=0',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'recherche',
      imgUrl: 'https://icon-library.com/images/medical-equipment-icon/medical-equipment-icon-14.jpg',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'Analyse ordonnance',
      imgUrl: 'https://th.bing.com/th/id/R.30cb72efd312b2a3c668065be1ed14ea?rik=lw1mgk81YwgsCQ&pid=ImgRaw&r=0',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'recherche',
      imgUrl: 'https://icon-library.com/images/medical-equipment-icon/medical-equipment-icon-14.jpg',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'Analyse ordonnance',
      imgUrl: 'https://th.bing.com/th/id/R.30cb72efd312b2a3c668065be1ed14ea?rik=lw1mgk81YwgsCQ&pid=ImgRaw&r=0',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'recherche',
      imgUrl: 'https://icon-library.com/images/medical-equipment-icon/medical-equipment-icon-14.jpg',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'Analyse ordonnance',
      imgUrl: 'https://th.bing.com/th/id/R.30cb72efd312b2a3c668065be1ed14ea?rik=lw1mgk81YwgsCQ&pid=ImgRaw&r=0',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'recherche',
      imgUrl: 'https://icon-library.com/images/medical-equipment-icon/medical-equipment-icon-14.jpg',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'Analyse ordonnance',
      imgUrl: 'https://th.bing.com/th/id/R.30cb72efd312b2a3c668065be1ed14ea?rik=lw1mgk81YwgsCQ&pid=ImgRaw&r=0',
      date: DateTime.now(),
    ),
    MedicalDocument(
      name: 'recherche',
      imgUrl: 'https://icon-library.com/images/medical-equipment-icon/medical-equipment-icon-14.jpg',
      date: DateTime.now(),
    ),
   
    // Add more dummy documents as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Que recherchez-vous ?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Asthme, aspirine, amoxicilline...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
                height: 300, // Set to desired height for grid items
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        (1 / 1), // Adjust the ratio based on your content
                  ),
                  itemCount: dummyMedicalDocuments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white, // Replace with appropriate color
                      child: Padding(
                        padding: const EdgeInsets.all(
                            16.0), // Adjust the padding as per your requirement
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Image.network(
                                  dummyMedicalDocuments[index].imgUrl,
                                  fit: BoxFit
                                      .cover, // Choose the appropriate fit for the image
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Add some spacing below the image
                              Text(
                                dummyMedicalDocuments[index].name,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
            SizedBox(height: 24),
            ListTile(
              title: Text('Documents consultés les 7 derniers jours'),
              trailing: Icon(Icons.arrow_forward),
            ),
            // Add ListView.builder for documents
            ListTile(
              title: Text(
                'Les actualités',
                textAlign: TextAlign.left, // Align the text to the left
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            // Add ListView.builder for news items

            ListView.builder(
              physics:
                  NeverScrollableScrollPhysics(), // to disable ListView's scrolling
              shrinkWrap: true, // necessary to wrap the content of the ListView
              itemCount: newsItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(
                    newsItems[index].imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(newsItems[index].title),
                  subtitle: Text(newsItems[index].date),
                  trailing: PopupMenuButton<String>(
                    onSelected: (String result) {
                      // handle menu action
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Action1',
                        child: Text('Action 1'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Action2',
                        child: Text('Action 2'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewsItem {
  final String imageUrl;
  final String title;
  final String date;

  NewsItem({
    required this.imageUrl,
    required this.title,
    required this.date,
  });
}
