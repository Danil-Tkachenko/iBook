//
//  TextViewController.swift
//  iBook
//
//  Created by Леонид Шелудько on 03.01.2023.
//

import UIKit

let bookText = Book()

class Book: NSObject {
    
    var text = "Слово «фабрика» – безусловно одно из самых часто употребляемых программистами при обсуждении своих (или чужих) программ. Но смысл в него вкладываемый бывает очень разным: это может быть и класс, порождающий объекты (полиморфно или нет); и метод, создающий экземпляры какого-либо типа (статический или нет); бывает, и даже просто любой порождающий метод (включая, конструкторы).\n Конечно, не все, что угодно, порождающее экземпляры чего-либо, может называться словом «фабрика». Более того, под этим словом могут скрываться два разных порождающих шаблона из арсенала «Банды четырех» – «фабричный метод» и «абстрактная фабрика», в подробности которых я и хотел бы немного углубиться, уделяя особое внимание классическим их пониманию и реализации.\n А на написание этого очерка меня вдохновил Джошуа Керивски (глава «Industrial Logic»), а точнее, его книга «Refactoring to Patterns», которая вышла в начале века в рамках серии книг, основанной Мартином Фаулером (именитым автором современной классики программирования – книги «Рефакторинг»). Если кто-то не читал или даже не слышал о первой (а я знаю таких много), то обязательно добавьте ее себе в список для чтения. Это достойный «сиквел» как «Рефакторинга», так и еще более классической книги – «Приемов объектно-ориентированного проектирования. Паттерны проектирования». /n Книга, помимо прочего, содержит в себе несколько десятков рецептов избавления от различных «запахов» в коде с помощью шаблонов проектирования. В том числе и три (как минимум) «рецепта» на обсуждаемую тему. \n Керивски в своей книге приводит два случая, когда применение этого шаблона будет полезным. Первый – это инкапсуляция знаний о конкретных классах, связанных общим интерфейсом. В таком случае этими знаниями будет обладать лишь тип, являющейся фабрикой. Публичный API фабрики будет состоять из набора методов (статических или нет), возвращающих экземпляры типа общего интерфейса и имеющих какие-либо «говорящие» названия (чтобы понимать, какой метод необходимо вызвать для той или иной цели)."

}
