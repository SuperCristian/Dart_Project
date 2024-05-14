import 'dart:io';

void main() {
  var file = File('file.txt');

  Future<List<String>> lines = file.readAsLines();

  int sum = 0;

  lines.then((List<String> lines) {
    lines.forEach((line) {
       sum += int.parse(line);
    });

//  Create new file which the sum of all numbers in file.txt
   var newFile = File('newFile.txt');
   newFile.createSync();

   if (newFile.existsSync()) {
    var writeFile = newFile.openWrite();

    writeFile.write('The sum is $sum');
    writeFile.close();

    print("File Successfully created");
  } else {
    print('Failed to create the file.');
  }

  }).catchError((e) {
    print('Error reading file: $e');
  });
}