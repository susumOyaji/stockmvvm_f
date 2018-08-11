//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'StorageControl.dart';
import 'Finance.dart';
//import 'dart:io';
//import 'dart:isolate';
//import 'dart:convert';


void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);
  
 

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets=[];
  
 


  int i = 0;
  StorageControl storage = new StorageControl();
  

  @override
  void initState() {
    super.initState(); 
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }

    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

   


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body:getBody(),
        floatingActionButton:FloatingActionButton(
              backgroundColor: Color.fromARGB(0xFF, 0xFF, 0x7F, 0x00),
              tooltip: 'Refresh', // used by assistive technologies
              child: Icon(Icons.update),
              onPressed:loadData,
            ),

        
        
        );

  }




  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,//<-- setState()
      itemBuilder: (BuildContext context, int position) {
        return  /*new Text("${widgets[position]}");*/getRow(position);
      });

  Widget getRow(int i) {
    //return new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row ${widgets[i]["title"]}"));
     return new Padding(padding: new EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0.0), 
      child: Column(
        
        children: [
          Row( //1桁目
            children: [
             // Expanded(
                /*child:*/ Container(
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(2.0)),
                  ),

                  margin: const EdgeInsets.fromLTRB(
                      4.0, 0.0, 0.0, 0.0), //.all(4.0),
                  padding: new EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      Text(
                        "${widgets[i].code}",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                      Text(
                        "${widgets[i].name}",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ), 
                ),
              //),
              //Expanded(
                /*child:*/ Container(
                  width: 50.0,
                  //margin: 10.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    //borderRadius:
                    //    const BorderRadius.all(const Radius.circular(2.0)),
                  ),

                  //margin: const EdgeInsets.fromLTRB(
                  //    0.0, 0.0, 0.0, 0.0), //.all(4.0),
                  padding: new EdgeInsets.all(10.0),
                child: Column(
                    children: [
                      Text(
                        "買価",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                      Text(
                        "${widgets[i].itemprice.toString()}",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ), 
                ),
              //),
              Expanded(
                 child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    //borderRadius:
                    //    const BorderRadius.all(const Radius.circular(2.0)),
                  ),

                  //margin: const EdgeInsets.fromLTRB(
                  //    0.0, 0.0, 0.0, 0.0), //.all(4.0),
                  padding: new EdgeInsets.all(10.0),
                child: Column(
                    children: [
                      Text(
                        "時価",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                      Text(
                        "${widgets[i].realValue}",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ), 
                ),
              ),
               Expanded(
                 child: Container(
                    decoration: BoxDecoration(
                    color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    //borderRadius:
                    //    const BorderRadius.all(const Radius.circular(2.0)),
                  ),

                  //margin: const EdgeInsets.fromLTRB(
                  //    0.0, 0.0, 0.0, 0.0), //.all(4.0),
                  padding: new EdgeInsets.all(10.0), 
                child: Column(
                    children: [
                      Text(
                        "利益",
                        style: TextStyle(fontSize: 12.0, color: Colors.red),
                      ),
                      Text(
                        "${widgets[i].realValue}",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ), 
                ),
               ),
                Expanded(
                   child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    //borderRadius:
                    //    const BorderRadius.all(const Radius.circular(2.0)),
                  ),

                  //margin: const EdgeInsets.fromLTRB(
                  //    0.0, 0.0, 0.0, 0.0), //.all(4.0),
                  padding: new EdgeInsets.all(10.0),
                child: Column(
                    children: [
                      Text(
                        "利益総額",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                      Text(
                        "${widgets[i].realValue.toString()}",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ), 
                ),
                ),
            ]
          ),
        ],),
     );   
  }

  void pasonalGetserchi(){
      //List<Price> prices = Finance.Parse(responce);
      loadData();
    }

  //static const int _chunkCount = 1;
  //int _nextChunk = 0;

  String _urlToFetch(String code) {
    //return 'https://domokit.github.io/examples/stocks/data/stock_data_$chunk.json';
    return "https://stocks.finance.yahoo.co.jp/stocks/detail/?code="+ code +".T";
  }


  loadData() async {  
   http.Client _httpClient;
   _httpClient = new http.Client();
    int i = 0;
  //static bool actuallyFetchData = true;

  //String _fetchNextChunk() {
    String companyName = "";
    String realValue = "";
    String realChange = "";
    String percent = "";
    
    
    String responce ="6758,200,1665\n9837,200,712\n6976,200,1746\n";
    List<Price> prices = Finance.parse(responce);
  

  for(Price price in prices) {
    //String dataURL = "https://stocks.finance.yahoo.co.jp/stocks/detail/?code="+ price.code +".T";

    http.Response response = await http.get(_urlToFetch(price.code)/*dataURL*/);
   

    //_httpClient.get(_urlToFetch(price.code)).then((http.Response response) {
    //_httpClient.get(_urlToFetch(price.code)).then<Null>((http.Response response) {
      final String json = response.body;

      String searchWord = "symbol"; //検索する文字列symbol
      int foundIndex = json.indexOf(searchWord, 0);
      //始めの位置を探す
      int nextIndex = foundIndex + searchWord.length;

      foundIndex = json.indexOf(">", nextIndex);
      int i = 5;//searchWord.length; //pricedata to point

      if (foundIndex != -1) {
        for (; json[foundIndex + i] != "<"; i++) {
          companyName += json[foundIndex + i]; //current value 現在値
        }
      } else {
        //price[0] = "Error";
      }

      searchWord = "stoksPrice"; //検索する文字列 ="stoksPrice">
      foundIndex = json.indexOf(searchWord); //始めの位置を探す
      //次の検索開始位置
      nextIndex = foundIndex + searchWord.length;
      //try
      // {
      //次の位置を探す
      foundIndex = json.indexOf(searchWord, nextIndex);
      if (foundIndex != -1) {
        int i = searchWord.length + 2; //pricedata to point
        for (; json[foundIndex + i] != "<"; i++) {
          realValue += json[foundIndex + i]; //current value 現在値
        }
      } else {
        //price[0] = "Error";
      }

      String searchWord1 = "yjMSt"; //検索する文字列前日比
      int foundIndex1 = json.indexOf(searchWord1); //始めの位置を探す
      int i1 = searchWord1.length + 2;

      for (; json[foundIndex1 + i1] != "（"; i1++) {
        realChange += json[foundIndex1 + i1]; //previous 前日比? ¥
      }

      i1++;
      for (; json[foundIndex1 + i1] != "）"; i1++) {
        percent += json[foundIndex1 + i1]; //previous 前日比? %
      }
   
     
     
      price.name = companyName;//企業名
      price.realValue = realValue;//時価
      price.prevday = realChange;//前日比(円)
      price.percent = percent;//前日比(%)

     // price.totalAsset = price.stocks * price.realprice;//利益総額
     // price.gain = price.realValue - price.itemprice;//時価


      print(price.name);
      print(price.realValue);
      print(price.prevday);
      print(price.percent);


      companyName = "";
      realValue = "";
      realChange = "";
      percent = "";
      //storage.storageWrite(msg.toString());
      //StorageControl save = new StorageControl();
     // save.storageWrite(msg.toString());
      
    //});//http
    //i = ++i;
    //print("i= $i");
   
  }//for to end
   //widgets =  prices;
  
   setState(() {
    widgets =  prices;
       
       // widgets = new List.from(widgets);
       // widgets.add(getRow(widgets.length + 1));
        //storage.storageAll();
        //storage.storageRead3();
    });
 
 }//load

}//stste

