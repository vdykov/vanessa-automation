﻿# language: ru
# encoding: utf-8
#parent uf:
@UF4_Библиотека_шагов
#parent ua:
@UA8_Прочее

@IgnoreOnOFBuilds

Функционал: Я хочу реализовать перечень шагов по созданию объектов с использованием инициатора данных

Сценарий: подготовка окружения
Дано Я нахожу или создаю объект "Справочники.Организации" с именем "Организация"
Сценарий: Шаги инициатора
Дано Я описываю шаги инициатора
	И я работаю с переменными
		И Я сохраняю параметр сеанса "ИспользоватьЧерныйСписокКонтрагентов" в переменную "ИспользоватьЧерныйСписокКонтрагентов"
		И Я запоминаю в переменную "ТестСтрока" значение "Просто строка" 

	И Я нахожу или создаю объекты
		И я нахожу или создаю группу объекта "Справочники.Контрагенты" с именем "ГруппаКонтрагентов"
		И я нахожу или создаю объект "Справочники.Контрагенты" с именем "Контрагент"
		И я заполняю реквизиты объекта "Контрагент" по таблице:
		|Имя		|Значение			|
		|Родитель	|ГруппаКонтрагентов	|
		|ЮрФизЛицо	|ЮридическоеЛицо	|
		И я нахожу или создаю объект "Справочники.Контрагенты" с именем "КонтрагентСНачальнымЗаполнением" с начальным заполнением
		И я нахожу или создаю объект "Справочники.Товары" с именем "Товар1"
		И я нахожу или создаю объект "Документы.ПоступлениеТоваров" с именем "ДокПТУ1" на дату 01.02.2020
		И я заполняю реквизиты объекта "ДокПТУ1" по таблице:
		|Имя		|Значение	|
		|Поставщик	|Контрагент	|
		|Организация|Организация|
		И я заполняю табличную часть "Товары" объекта "ДокПТУ1" по таблице:
		|Номенклатура	|Количество	|Сумма	|
		|Товар1			|10			|100	|
		И я записываю документ "ДокПТУ1" в режиме "Проведение"
		И я записываю документ "ДокПТУ1" в режиме "Проведение" с вызовом исключения
		И я создаю записи регистра сведений "ЧерныйСписокКонтрагентов" по таблице:
		|Период		|Контрагент|Включен	|
		|01.01.2020	|Контрагент|Истина	|
		И я нахожу или создаю объект "Документы.ОперацияБух" с именем "Операция" на дату 01.02.2020
		И я заполняю табличную часть "ТаблицаРегистровНакопления" объекта "Операция" по таблице:
		|Имя	|
		|Запасы	|
		И я заполняю движения регистра "Запасы" документа "Операция" по таблице:
		|Номенклатура	|Количество	|Поставщик	|
		|Товар1			|10			|Контрагент	|
	И я устанавливаю константы
		И я устанавливаю константу "ОрганизацияПоУмолчанию" в значение переменной "Организация"

	И я проверяю объекты
		И я выполняю проверку заполнения объекта "ДокПТУ1"
		И я проверяю реквизиты объекта "ДокПТУ1" по таблице:
		|Имя		|Значение	|
		|Проведен	|Истина		|
		|Организация|Организация|
		И Я проверяю, что движения документа "ДокПТУ1" по регистру "Запасы" идентичны таблице:
		|Номенклатура	|Количество	|Поставщик	|
		|Товар1			|10			|Контрагент	|
		И я проверяю табличную часть "Товары" объекта "ДокПТУ1" по таблице:
		|Номенклатура	|Количество	|Сумма	|
		|Товар1			|10			|100	|

	И я откатываю изменения
		И я помечаю объекты "Документы.ПоступлениеТоваров" на удаление
		И я удаляю объекты "Документы.ПоступлениеТоваров" без контроля ссылок
		И я удаляю переменную "ДокПТУ1"
		И я удаляю переменные текущего сценария

Сценарий: проверка доступности переменной VA в инициаторе
Когда я запоминаю содержимое файла "Проверочный.txt" в переменную "НаименованиеОрганизации"
Тогда переменная "НаименованиеОрганизации" имеет значение "Тестовая организация"
И я заполняю реквизиты объекта "Организация" по таблице:
|Имя			|Значение					|
|Наименование	|НаименованиеОрганизации	|

Сценарий: проверка использования переменных VA
Когда Я сохраняю в переменную "СсылкаОрганизации" ссылку на справочник "Организации" с "Наименование" равным "Тестовая организация"
Тогда я нахожу или создаю объект "Документы.ПоступлениеТоваров" с именем "ДокПТУ2" на дату 01.02.2020
И я заполняю реквизиты объекта "ДокПТУ2" по таблице:
|Имя		|Значение			|
|Организация|СсылкаОрганизации	|
И я удаляю переменные текущего сценария

Сценарий: проверка использования перменных-ссылок VA
Дано Я подготавливаю таблицу товаров
	И я нахожу или создаю объект "Справочники.Товары" с именем "Товар1"
	И я нахожу или создаю объект "Справочники.Товары" с именем "Товар2"
	И я нахожу или создаю объект "Справочники.Товары" с именем "Товар3"
	И я запоминаю в переменную "ТаблицаТоваров" значение:
	|ИмяПеременнойДокумента	|Товар	|ДатаПоставки	|
	|ДокПТУ1				|Товар1	|01.02.2020		|
	|ДокПТУ2				|Товар2	|02.02.2020		|
	|ДокПТУ3				|Товар3	|03.02.2020		|

Тогда для каждого значения "Товар" из таблицы в памяти "ТаблицаТоваров"
	Когда Я нахожу или создаю объект "Документы.ПоступлениеТоваров" с именем '$ИмяПеременнойДокумента$' на дату '$ДатаПоставки$'
	Тогда Я заполняю табличную часть "Товары" объекта '$ИмяПеременнойДокумента$', по таблице:
	|Номенклатура	|Количество	|
	|$Товар$		|10			|

Сценарий: проверка заполнения по строковому представлению
	Когда Я нахожу или создаю объект "Документы.ПоступлениеТоваров" с именем "ДокПТУ4" на дату 01.02.2020
	Тогда Я заполняю табличную часть "Товары" объекта "ДокПТУ4" по таблице:
	| Номенклатура | Количество | Сумма |
	| 'Товар 1'    | 10         | 100   |

Сценарий: откат изменений
Дано Я откатываю изменения
