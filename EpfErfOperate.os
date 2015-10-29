﻿#use json
//#use cmdline не удалось обработать отсутствие необязательного аргумента комстроки
#use v8runner
Перем массивДействий Экспорт;
Перем Настройки Экспорт;
Перем Конфиг Экспорт;

Перем Скрипт, ver;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Процедура init(dbLevel = 0)
	Отказ = Ложь;
	СИ = Новый СистемнаяИнформация;
	Скрипт = Новый Файл(ТекущийСценарий().Источник);
	Сообщить("1Scr вер. "+СИ.Версия+"  -----[  "+Скрипт.ИмяБезРасширения+"  ]-----  вер. "+ver+Символы.ПС);
	Конфиг = Новый Файл(Скрипт.Путь+"\epfert.json");
	ПодключитьСценарий(Скрипт.Путь+"\epfert.lib", "lib");
	либ = Новый lib();
	либ.УровеньОтладки = dbLevel;
	либ.Инициализировать(ЭтотОбъект, Отказ);
	Если Отказ Тогда help(2); КонецЕсли;
	либ.ПроверитьПараметры(ЭтотОбъект, Отказ);
	Если Отказ Тогда help(3); КонецЕсли;
КонецПроцедуры

Процедура action()
КонецПроцедуры

Процедура help(rc)
Сообщить("
|   "+Скрипт.Имя+" -do export,unpack,change,import
|	любое или комбинация действий
|	необязательные параметры:
|		-ibAddress IBNAME
|		-clUser USER
|		-clPasswd PASSWORD
|");
Exit(rc);
КонецПроцедуры

Процедура viewsettings()
	Для Каждого нн Из Настройки Цикл
		Сообщить(""+ВРег(нн.Ключ)+Символы.Таб+"="+Символы.Таб+нн.Значение);
	КонецЦикла;
	
	СтрокаДействий = "ACT______"+Символы.Таб+"="+Символы.Таб;
	Для Каждого дд Из массивДействий Цикл
		СтрокаДействий = СтрокаДействий +дд+ ",";
	КонецЦикла;
	Сообщить(СтрокаДействий);
	
КонецПроцедуры
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ver = "1.0.2 vscraft@2015";
init(2);

//viewsettings();
action();