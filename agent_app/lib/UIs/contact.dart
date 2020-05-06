import 'package:agentapp/Componets/basic_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  ContactState createState() {
    return new ContactState();
  }
}

class ContactState extends State<Contact> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: customiseAppBar(context),
      body: Center(
        child: Container(
          color: const Color(0xffF3F6FF),
          child: Column(
            children: <Widget>[
              new Container(
                height: 260.0,
                color: Colors.transparent,
                child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )),
                    child: new Container(
                      padding: new EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            "Feel free to contact us anytime, our agents will response right away.",
                            style: TextStyle(
                                color: const Color(0xff9195A1), fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                          TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              labelText: "Message",
                              labelStyle: TextStyle(
                                  color: const Color(0xff9195A1), fontSize: 14),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Priority",
                              labelStyle: TextStyle(
                                  color: const Color(0xff9195A1), fontSize: 14),
                            ),
                          ),
                          Container(
                            padding: new EdgeInsets.only(top: 25),
                            child: FlatButton(
                              padding: new EdgeInsets.only(top: 10, bottom: 10),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                              ),
                              onPressed: () {},
                              color: const Color(0xff38A9D9),
                              textColor: Colors.white,
                              child: Text("SUBMIT".toUpperCase(),
                                  style: TextStyle(fontSize: 14)),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              Container(
                padding: new EdgeInsets.only(left: 25, right: 25, top: 10),
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "FAQ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color(0xff939AB1),
                        ),
                      ),
                    ),
                    CupertinoTextField(
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery,
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }
}
