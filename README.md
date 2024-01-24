# lojong

A new Flutter project.

# Architecture
This app follows the MVVM design pattern using BLoC.
- Model: the Models are the objects returned from the Repository. Defined inside ``moldels`` folder;
- ViewModel: the Bloc States works as ViewModel. It's updated by the Bloc after accessing the repository and treating the data. Defined inside ``bloc`` folder;
- View: it's the widget itself. Uses the Bloc State to render the data. Defined inside ``views`` folder.

# Running the app
```
flutter pub get
flutter run
```

# Screenshots
## Nexus One
![Screenshot 1 from Nexus One](/screenshots/nexus_one_tela1.png?raw=true) ![Screenshot 2 from Nexus One](/screenshots/nexus_one_tela2.png?raw=true) ![Screenshot 3 from Nexus One](/screenshots/nexus_one_tela3.png?raw=true) ![Screenshot 4 from Nexus One](/screenshots/nexus_one_tela4.png?raw=true)

## Nexus 4
![Screenshot 1 from Nexus 4](/screenshots/nexus_4_tela1.png?raw=true) ![Screenshot 2 from Nexus 4](/screenshots/nexus_4_tela2.png?raw=true) ![Screenshot 3 from Nexus 4](/screenshots/nexus_4_tela3.png?raw=true) ![Screenshot 4 from Nexus 4](/screenshots/nexus_4_tela4.png?raw=true)

## Nexus 6
![Screenshot 1 from Nexus 6](/screenshots/nexus_6_tela1.png?raw=true) ![Screenshot 2 from Nexus 6](/screenshots/nexus_6_tela2.png?raw=true) ![Screenshot 3 from Nexus 6](/screenshots/nexus_6_tela3.png?raw=true) ![Screenshot 4 from Nexus 6](/screenshots/nexus_6_tela4.png?raw=true)

## Nexus 9
![Screenshot 1 from Nexus 9](/screenshots/nexus_9_tela1.png?raw=true) ![Screenshot 2 from Nexus 9](/screenshots/nexus_9_tela2.png?raw=true) ![Screenshot 3 from Nexus 9](/screenshots/nexus_9_tela3.png?raw=true) ![Screenshot 4 from Nexus 9](/screenshots/nexus_9_tela4.png?raw=true)