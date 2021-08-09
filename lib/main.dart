import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> friendListOnSearch = [];
  List<String> friendList = [
    'Dayanan Chaudhary',
    'Meelan Paudel',
    'Bikash Deo',
    'Anil Yadav',
    'Krishana Mandal',
    'Hari Shankar Pandit',
    'Suman Wagle',
    'Ajit Kumar Chaudhary',
    'Anish Mandla',
    'Youbraj Rai',
    'Manish Mishra',
    'Pratil Dahal',
    'Bibek Shresth',
    'Bishal Chaudhary',
    'Bishal Chakrabarti',
    'Nabn Roy',
    'Ganga Shah',
    'Aswin Shresth',
    'Rosan Basnet',
    'Hriday Chaudhary',
    'Anjit Rai',
    'Dhiraj Mandal',
    'Manoj Mehata',
    'Pritam Chaudhary',
    'Snajiv Ghimire',
    'Pankaj Rajghar',
    'Prasant Chaudhary',
    'Dipesh Chaudhary',
    'Ghanshyam'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                friendListOnSearch.clear();
                _textEditingController.clear();
                setState(() {
                  _textEditingController.text = '';
                });
              },
              child: Icon(
                Icons.close,
                color: Colors.red,
              ))
        ],
        title: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                friendListOnSearch = friendList
                    .where((element) =>
                        element.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
            },
            controller: _textEditingController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              border: InputBorder.none,
              hintText: "Input keyword",
            ),
          ),
        ),
      ),
      body: _textEditingController.text.isNotEmpty && friendListOnSearch.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off),
                  Text(
                    "No Result Founded",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _textEditingController.text.isNotEmpty
                  ? friendListOnSearch.length
                  : friendList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        _textEditingController.text.isNotEmpty
                            ? friendListOnSearch[index]
                            : friendList[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                );
              }),
    );
  }
}
