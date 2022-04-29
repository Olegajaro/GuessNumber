# GuessNumber

При разработке приложения использовалась архитектура MVC. Данная архитектура была применена мной по нескольким причинам:

+ Простота реализации 
+ Небольшое количество кода во вьюконтроллерах за счет применения storyboards и вынесения логики в модели 
+ Apple рекомендует данную архитектуру для простых приложений

Обработка не корректного поведения пользователя осуществлена с помощью alertController.
Для проверки ожидаемого поведения игры добавлены тесты для класса Game.

____

## Portrait mode

![gameLaunchPortret](/Images/PortretGameLaunch.png) 
![guessNumberPortret1](/Images/portretGuessNumber1.png) ![guessNumberPortret2](/Images/portretGuessNumber2.png) ![guessNumberPortret3](/Images/portretGuessNumber3.png)
![computerGuessingPortret1](/Images/portretComputerGuessing1.png) ![computerGuessingPortret2](/Images/portretComputerGuessing2.png)
![playerGuessingPortret1](/Images/portretPlayerGuessing1.png)  ![playerGuessingPortret2](/Images/portretPlayerGuessing2.png)
![portretGameResult](/Images/portretGameResult.png)
____

## Landscape mode

![gameLaunchLandscape](/Images/landscapeGameLaunch.png)
![guessNumberLandscape](/Images/landscapeGuessNumber.png)
![computerGuessingLandscape](/Images/landscapeComputerGuessing.png)
![playerGuessingLandscape](/Images/landscapePlayerGuessing.png)
![gameResultLandscape](/Images/landscapeGameResult.png)
____

## Используемые технологии

+ Swift 5.6 (iOS 15.4)
+ UIKit
+ Storyboard
+ MVC
+ UIAlertController
+ UITapGestureRecognizer
+ XCTest





