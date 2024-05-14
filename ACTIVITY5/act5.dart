import 'dart:io';

void main() async {
  bool testing = true;

  do {
    print("What do you want to do? ");
    print("1. Write a File ?");
    print("2. Read the file made ?");
    print("3. terminate ?");

    String choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        user();
        break;
      case '2':
        await reader();
        break;
      default:
        testing = false;
        break;
    }
  } while (testing);
}

void user() {
  stdout.write("Write the file you want to make, include .txt extension \n");
  String fileName = stdin.readLineSync() ?? 'default.txt';

  var file = File(fileName);
  file.createSync();

  if (file.existsSync()) {
    print("File created ");

    print("Enter what you want to write to the file");
    String letter = stdin.readLineSync() ?? '';

    var writeFile = file.openWrite();
    writeFile.write(letter);
    writeFile.close();

    print("Done writing");
    print("---------------------------");
  } else {
    print("file not created or it already exist");
  }
}

Future<void> reader() async {
  String currentDirectory = Directory.current.path;

  Directory(currentDirectory)
      .listSync()
      .where((entity) => entity is File && entity.path.endsWith('.txt'))
      .forEach((file) => print(file.path.split(Platform.pathSeparator).last));

  print("Enter the file you want to read");
  String fileName = stdin.readLineSync() ?? '';

  File file = File(fileName);

   if (file.existsSync()) {
    try {
      List<String> lines = await file.readAsLines();
      for (String line in lines) {
        print(line);
      }
    } catch (e) {
      print('Error reading file: $e');
    }
  } else {
    print("file doesn't exist");
    print("---------------------------");
  }
}
