﻿# language: ru

@lessons

Функционал: Интерактивная справка. Как устроен feature файл? Секция Структура сценария.

Сценарий: Как устроен feature файл? Секция Структура сценария.

	* Привет! В этом уроке я расскажу тебе про то, как устроен фича файл. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения

	* И загр^узим тестовый пример.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Ложь"
		И я отключаю показ строк подсценариев в редакторе VA в режиме обучения
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\ПримерКакУстроенФичаФайлСтруктураСценария.feature"
		И я позиционирую в центр строку редактора VA в режиме обучения 21

	* Структура сценария это особый вид сценария, который позволяет запускать один сценарий несколько раз с разными параметрами.

	* Рассмотрим как это работает.
	* Объявление структуры сценария обозначается соответствующим ключевым словом.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "Структура сценария:" 'Ключевое слово "Структура сценария"'

	* Далее идёт её имя.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "Структура сценария 1" 'Имя структуры сценария'

	* Далее в шагах сценария появляется возможность использовать специальный вид параметров, которые записываются в угловых скобках.
	* Например как в этой строке
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "<Параметр1>" 'Параметр в угловых скобках'
	
	* Или тут
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "<Параметр2>" 'Параметр в угловых скобках'

	* Далее после всех шагов структуры сценария пишется обязательное ключевое слово Примеры.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "Примеры:" 'Ключевое слово Примеры'

	* Затем идёт таблица примеров. В ней должно быть две строк^и или более.

	* В первой строке перечисляются все параметры структуры сценария, которые ранее использовались в шагах в угловых скобках.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "| \'Параметр1\' | \'Параметр2\' | \'Параметр3\' |" 'Строка с именами параметров'

	* За ней идут стр^оки, которые уже являются реальными примерами для данного сценария.
		И я делаю подсветку текста в редакторе VA в режиме обучения с 16 по 17 строку "Значения примеров"

	* Получается, что в данном случае сценарий будет выполнен два раза.
	* Первый раз он будет использовать значения параметров из этой строк^и.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "| \'Значение1\' | \'Значение2\' | \'Значение3\' |" 'Первый пример'
	* А второй раз уже из этой.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "| \'Значение4\' | \'Значение5\' | \'Значение6\' |" 'Второй пример'

	* На этом всё, переходи к следующему уроку интерактивной справки.