﻿# language: ru
#parent uf:
@UF5_формирование_результатов_выполнения_сценариев
#parent ua:
@UA20_формировать_прочие_отчеты

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb
@IgnoreOnUFSovm82Builds
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



Функционал: Проверка генерации шагов инструментом ПодготовкаИЗагрузкаДанных

Контекст:
	И я удаляю объекты "Справочники.Товары" без контроля ссылок
	И я закрываю сеанс текущего клиента тестирования
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой 'VAEditor'


	И я перехожу к закладке с именем "ГруппаЗапускТестов"
	И я нажимаю на кнопку с именем 'ФормаПерейтиВVanessaEditor'
	И я нажимаю на кнопку с именем 'VanessaEditorОткрытьИнструментПодготовкаИЗагрузкаДанных'
		
	Тогда открылось окно 'Подготовка и загрузка данных*'
	
Сценарий: Проверка генерации шагов инструментом ПодготовкаИЗагрузкаДанных

	Допустим я меняю значение переключателя с именем 'StepsLanguage' на 'ru'

	Когда открылось окно 'Подготовка и загрузка данных*'
	И в таблице "MetadataList" я перехожу к строке:
		| 'Использовать' | 'Представление' |
		| 'Нет'          | 'Константы'     |
	И в таблице "MetadataList" я активизирую поле с именем "MetadataListUse"
	И в таблице "MetadataList" я устанавливаю флаг с именем 'MetadataListUse'
	
	И в таблице "MetadataList" я перехожу к строке:
		| 'Использовать' | 'Представление' |
		| 'Нет'          | 'Справочники'   |
	И в таблице "MetadataList" я устанавливаю флаг с именем 'MetadataListUse'
	
	И в таблице "MetadataList" я перехожу к строке:
		| 'Использовать' | 'Представление' |
		| 'Нет'          | 'Документы'     |
	И в таблице "MetadataList" я устанавливаю флаг с именем 'MetadataListUse'
	
	И в таблице "MetadataList" я перехожу к строке:
		| 'Использовать' | 'Представление'             |
		| 'Нет'          | 'Планы видов характеристик' |
	И в таблице "MetadataList" я устанавливаю флаг с именем 'MetadataListUse'
	
	И в таблице "MetadataList" я перехожу к строке:
		| 'Использовать' | 'Представление'     |
		| 'Нет'          | 'Регистры сведений' |
	И в таблице "MetadataList" я устанавливаю флаг с именем 'MetadataListUse'
	
	И в таблице "MetadataList" я перехожу к строке:
		| 'Использовать' | 'Представление'       |
		| 'Нет'          | 'Регистры накопления' |
	И в таблице "MetadataList" я устанавливаю флаг с именем 'MetadataListUse'
	И я меняю значение переключателя с именем 'CreateFileForStorage' на 'Нет'	
	И я нажимаю на кнопку с именем '*GenerateFeature*'
	И я меняю значение переключателя с именем 'StepsLanguage' на 'en'
	И я нажимаю на кнопку с именем '*GenerateFeature*'
	И я меняю значение переключателя с именем 'StepsLanguage' на 'ru'
	И я нажимаю на кнопку с именем '*GenerateFeature*'
	
Сценарий: Выгрузка объекта с реквизитом ХранилищеЗначения
	
	Когда открылось окно 'Подготовка и загрузка данных:*'
	И в таблице "MetadataList" я разворачиваю строку:
		| 'Использовать' | 'Представление' |
		| 'Нет'          | 'Справочники'   |
	И в таблице "MetadataList" я перехожу к строке:
		| 'Использовать' | 'Представление' |
		| 'Нет'          | 'Товары'        |
	И в таблице "MetadataList" я устанавливаю флаг с именем 'MetadataListUse'
	И в таблице "MetadataList" я завершаю редактирование строки
	И выгрузка в обычном формате
		И в таблице "MetadataList" я нажимаю на кнопку с именем 'MetadataListGenerateFeature'
		Тогда элемент формы с именем "Feature" стал равен шаблону
			|'#language: ru'|
			|'@дерево'|
			|''|
			|'Функционал: экспорт сценариев'|
			|''|
			|'Контекст:'|
			|'	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий'|
			|''|
			|'Сценарий: Создание объектов для справочника Товары'|
			|''|
			|'	И я проверяю или создаю для справочника \"Товары\" объекты:'|
			|'		\| \'Ссылка\'                                                            \| \'ПометкаУдаления\' \| \'Код\'       \| \'Наименование\'        \| \'Изображение\'                                                                                                                                                                           \|'|
			|'		\| \'e1cib/data/Справочник.Товары?ref=*\' \| \'False\'           \| \'000000001\' \| \'Вентилятор Binatone\' \| \'ValueStorage:*\' \|'|
			|''|
			|''|


	И выгрузка в файл
		И я меняю значение переключателя с именем 'CreateFileForStorage' на 'Да'
		И я выбираю файл "$КаталогПроекта$\\temp\\"
		И я нажимаю кнопку выбора у поля с именем "PathToUpload"
		И в таблице "MetadataList" я нажимаю на кнопку с именем 'MetadataListGenerateFeature'
		Тогда элемент формы с именем "Feature" стал равен шаблону
			|'#language: ru'|
			|'@дерево'|
			|''|
			|'Функционал: экспорт сценариев'|
			|''|
			|'Контекст:'|
			|'	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий'|
			|''|
			|'Сценарий: Создание объектов для справочника Товары'|
			|''|
			|'	И я проверяю или создаю для справочника \"Товары\" объекты:'|
			|'		\| \'Ссылка\'                             *\| \'ПометкаУдаления\' \| \'Код\'       \| \'Наименование\'        \| \'Изображение\'                                                               \|'|
			|'		\| \'e1cib/data/Справочник.Товары?ref=*\' \| \'False\'           \| \'000000001\' \| \'Вентилятор Binatone\' \| \'ValueStoragePath:$workspaceRoot\temp\044C6890489C36DAA259AF1E6D08AD25.bin\' \|'|
			|''|
			|''|
		И Файл "$КаталогПроекта$\\temp\\044C6890489C36DAA259AF1E6D08AD25.bin" существует
	И протестируем загрузку
		И я проверяю или создаю для справочника "Товары" объекты:
			| 'Ссылка'                                                            | 'ПометкаУдаления' | 'Код'       | 'Наименование'          | 'Изображение'                                                               |
			| 'e1cib/data/Справочник.Товары?ref=b23ae4b31852270311ec6c78778f6e60' | 'False'           | '000000002' | 'Тестовая номенклатура' | 'ValueStoragePath:$workspaceRoot\temp\044C6890489C36DAA259AF1E6D08AD25.bin' |
		Тогда существует элемент справочника "Товары" с "Наименование" равным "Тестовая номенклатура"

Сценарий: Проверка флажков Выбрать все и Снять все

	Когда открылось окно 'Подготовка и загрузка данных*'
	И в таблице "MetadataList" я нажимаю на кнопку с именем 'MetadataListSelectAll'
	Тогда таблица "MetadataList" стала равной:
		| 'Использовать' | 'Представление'             |
		| 'Да'           | 'Константы'                 |
		| 'Да'           | 'Справочники'               |
		| 'Да'           | 'Документы'                 |
		| 'Да'           | 'Планы видов характеристик' |
		| 'Да'           | 'Регистры сведений'         |
		| 'Да'           | 'Регистры накопления'       |		
	Когда открылось окно 'Подготовка и загрузка данных: Vanessa Automation'
	И в таблице "MetadataList" я нажимаю на кнопку с именем 'MetadataListDeselectAll'
	Тогда таблица "MetadataList" стала равной:
		| 'Использовать' | 'Представление'             |
		| 'Нет'          | 'Константы'                 |
		| 'Нет'          | 'Справочники'               |
		| 'Нет'          | 'Документы'                 |
		| 'Нет'          | 'Планы видов характеристик' |
		| 'Нет'          | 'Регистры сведений'         |
		| 'Нет'          | 'Регистры накопления'       |
	
