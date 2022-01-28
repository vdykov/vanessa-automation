﻿# language: ru


@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnUFSovm82Builds
@IgnoreOnWeb

@IgnoreOn836
@IgnoreOn837
@IgnoreOn838
@IgnoreOn839
@IgnoreOn8310
@IgnoreOn8311
@IgnoreOn8312
@IgnoreOn8313
@IgnoreOn8314
@IgnoreOn8315
@IgnoreOn8316

@ServerCodeCoverage


Функциональность: Озвучка текущей строки фича файла

    Как разработчик
    Я хочу чтобы в редакторе можно было быстро озвучить текущую строку фича файла
    Чтобы я мог быстро выполнить отладку звука в автоинструкции

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой 'VAEditor'


Сценарий: Озвучка текущей строки фича файла
	* Заполнение настроек для создавания автовидео
		И я перехожу к закладке с именем "ГруппаНастройки"
		И я перехожу к закладке с именем "СтраницаАвтоИнструкции"
		И я перехожу к закладке с именем "ГруппаАвтоинструкцииVanessaExtChrome"
		И я разворачиваю группу с именем "ГруппаРаботаСВидео"
			
		И В открытой форме я устанавливаю флаг "Создавать видеоинструкцию"

		И Я заполняю настройки записи видео в TestClient

	* Загрузка служебной фичи	
		И я нажимаю на кнопку с именем 'ФормаПерейтиВVanessaEditor'

		И я перехожу к закладке с именем "ГруппаСлужебная"
		Когда В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "VAEditor\VanessaEditor39"
		И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient

	* Снятие флага записи видео
		И я перехожу к закладке с именем "ГруппаНастройки"
		И я снимаю флаг с именем 'СоздаватьИнструкциюВидео'
		И я перехожу к закладке с именем "ГруппаЗапускТестов"

	* Включение использование компоненты
		И я перехожу к закладке с именем "ГруппаНастройки"
		И я перехожу к закладке с именем "СтраницаСервисОсновные"
		И я устанавливаю флаг с именем 'ИспользоватьКомпонентуVanessaExt'
		И Пауза 1
		
	* Включение отладки			
		И я перехожу к закладке с именем "ГруппаНастройки"
		И я устанавливаю флаг с именем 'DebugLog'
			
	* Подготовка
		И я очищаю окно сообщений пользователю
		

	* Установка нужной строки текущей. Группа.
		И я перехожу к закладке с именем "ГруппаСлужебная"
		И я перехожу к закладке с именем "ГруппаСлужебноеВыполнитьКод"
		И в поле с именем 'РеквизитПроизвольныйКод' я ввожу текст 'VanessaTabs.current.editor.setPosition(17, 1, "");'
		И я нажимаю на кнопку с именем 'ВыполнитьПроизвольныйКод'
		И пауза 1
		И я перехожу к закладке с именем "ГруппаЗапускТестов"
	
	* Выполнение команды по озвучке	
		И я нажимаю на кнопку с именем 'VanessaEditorОзвучитьТекущуюСтрокуРедактора'
		И Пауза 15
		
				
	* Установка нужной строки текущей. Обычный шаг.
		И я перехожу к закладке с именем "ГруппаСлужебная"
		И я перехожу к закладке с именем "ГруппаСлужебноеВыполнитьКод"
		И в поле с именем 'РеквизитПроизвольныйКод' я ввожу текст 'VanessaTabs.current.editor.setPosition(20, 1, "");'
		И я нажимаю на кнопку с именем 'ВыполнитьПроизвольныйКод'
		И пауза 1
		И я перехожу к закладке с именем "ГруппаЗапускТестов"
	
	* Выполнение команды по озвучке	
		И я нажимаю на кнопку с именем 'VanessaEditorОзвучитьТекущуюСтрокуРедактора'
		И Пауза 15


	* Установка нужной строки текущей. Шаг видеовставка.
		И я перехожу к закладке с именем "ГруппаСлужебная"
		И я перехожу к закладке с именем "ГруппаСлужебноеВыполнитьКод"
		И в поле с именем 'РеквизитПроизвольныйКод' я ввожу текст 'VanessaTabs.current.editor.setPosition(22, 1, "");'
		И я нажимаю на кнопку с именем 'ВыполнитьПроизвольныйКод'
		И пауза 1
		И я перехожу к закладке с именем "ГруппаЗапускТестов"
	
	* Выполнение команды по озвучке	
		И я нажимаю на кнопку с именем 'VanessaEditorОзвучитьТекущуюСтрокуРедактора'
		И Пауза 15

	* Проверка, что не было ошибки
		Тогда не появилось окно предупреждения системы
		Тогда в логе сообщений TestClient есть строки:
			|'Text=Группа шагов'|
			|'Text=И Я запоминаю значение выражения \'30+30\' в переменную "ИмяПеременной3"'|
			|'Text=ТекстДиктора'|

	* Закрытие клиента тестирования
		И я закрываю сеанс текущего клиента тестирования
		