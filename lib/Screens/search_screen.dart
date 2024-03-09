import 'package:flutter/material.dart';
import 'package:google_clone/Constants/colors.dart';
import 'package:google_clone/widgets/search_header.dart';
import 'package:google_clone/widgets/search_result_component.dart';
import 'package:google_clone/widgets/web/search_footer.dart';
import 'package:google_clone/widgets/web/search_tabs.dart';
import 'package:google_clone/services/api_service.dart';

class SearchScreen extends StatelessWidget {
  final String start;
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
    required this.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchHeader(),
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                  child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: SearchTabs()),
                ),
                const Divider(
                  height: 0,
                  thickness: 0.4,
                ),
                FutureBuilder(
                  future: ApiService().fetchData(
                    queryTerm: searchQuery,
                    start: start,
                  ),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data?['items'].length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: size.width <= 768 ? 10 : 150,
                                        top: 12),
                                    child: Text(
                                      "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results ${snapshot.data?['searchInformation']['formattedSearchTime']} seconds",
                                      style: const TextStyle(
                                        color: Color(0xFF70757a),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width <= 768 ? 10 : 150,
                                      top: 10,
                                    ),
                                    child: SearchResultComponent(
                                      desc: snapshot.data?['items'][index]
                                          ['snippet'],
                                      linktoGo: snapshot.data?['items'][index]
                                          ['link'],
                                      link: snapshot.data?['items'][index]
                                          ['formattedUrl'],
                                      text: snapshot.data?['items'][index]
                                          ['title'],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (start != '0') {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => SearchScreen(
                                            searchQuery: searchQuery,
                                            start: (int.parse(start) - 10)
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    "< Prev",
                                    style: TextStyle(
                                        color: start == '0'
                                            ? Colors.grey
                                            : blueColor,
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                          searchQuery: searchQuery,
                                          start: (int.parse(start) + 10)
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Next >",
                                    style: TextStyle(
                                        color: blueColor, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const SearchFooter(),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
