

import 'dart:io';
import 'dart:convert';
import 'dart:async';


class  StorageControl{
    //StorageControl(){}//コンストラクタ

    storageRead() {
      final file = new File('file.txt');
      Stream<List<int>> inputStream = file.openRead();

      inputStream
        .transform(UTF8.decoder)       // Decode bytes to UTF8.
        .transform(new LineSplitter()) // Convert stream to individual lines.
        .listen((String line) {        // Process results.
          print('$line: ${line.length} bytes');
          return line;
        },
        onDone: () { print('File is now closed.'); },
        onError: (e) {print(e.toString());}
        );//Error Messeg
  }

  String read() {
    String contents;
  
    new File('file.txt').readAsString().then((contents) {
      print(contents);
    });
    return contents;
  }

   void storageRead1()
   {
      new File("file.tex").openRead()
          .transform(UTF8.decoder)
          .transform(const LineSplitter())
          .forEach((line) {
              print("> $line");
          });
    }


    void storageRead2() {
    new File("file.txt").readAsLines()
        .then((lines) {
            for (String line in lines) {
                print("> $line");
            }
        });
  }


   dynamic storageRead3() async  {
  String line;
    for (line in await new File("file.txt").readAsLines()) {
        print("> $line");
    }
    return  line;
  }

//import 'dart:io';

void storageWrite(String value) {
  final filename = 'file.txt';
  new File(filename).writeAsString(value/*'some content'*/)
    .then((File file) {
      print("$filename");// Do something with the file. ファイルで何かを行います。
    });
}



void storageAll(){ 
   File file = new File( Directory.current.path+"\\data\\contact.txt"); 
   Future<String> f = file.readAsString();  
  
   // returns a futrue, this is Async method 
   f.then((data)=>print(data));  
   
   // once file is read , call back method is invoked  
   print("End of main");  
   // this get printed first, showing fileReading is non blocking or async 
}
}
/*
   void StorageRead()
   {
      new File("something.text").openRead()
          .transform(UTF8.decoder)
          .transform(const LineSplitter())
          .forEach((line) {
              print("> $line");
          });
    }


//readAsLinesを使ってファイル読み込み
//import 'dart:io';
//import 'dart:convert';

  void StorageRead1() {
    new File("some.txt").readAsLines()
        .then((lines) {
            for (String line in lines) {
                print("> $line");
            }
        });
  }


//readAsLinesを使ってファイル読み込み(2)
//import 'dart:io';
//import 'dart:convert';

  dynamic StorageRead2() async  {
  String line;
    for (line in await new File("some.txt").readAsLines()) {
        print("> $line");
    }
    return  line;
  }



//import 'dart:async';
//import 'dart:io';

String read() {
  String contents;
  
  new File('file.txt').readAsString().then((contents) {
    print(contents);
  });
  return contents;
}

//  import 'dart:io';
//import 'dart:convert';
//import 'dart:async';
*/