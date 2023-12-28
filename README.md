# manga_site_fastapi

Есть версия на django с сайтом (на fastapi не нашел приемлемого бесплатного хостинга) [django](https://github.com/TimurMeshchenko/manga_site_django)
Основные отличия от django версии: 
    Redis используется для кэширования данных для каталога,
    Через RabbitMQ отправляются письма для восстановления пароля,
    Регистрация, авторизация основаны на JWT,
    Защита от CSRF по принципу cookie-to-header token,   
    Вместо ajax fetch,

Сайт создан в учебных целях, источник дизайна и данных для базы данных [remanga](https://remanga.org/),  
(js написан с нуля).  

## Реализованный функционал: 

**Каталог тайтлов:**
    Redis кэширует данные необходимые для страницы. Это достигается путем получения данных из бд в моделях, их парсинга в списки словарей lists[hashes], чтобы при следующих обновлениях страницы получать из redis, в течении 2 минут.
    
    Infinity scroll (тайтлы загружаются при прокрутке вниз). Когда пользователь скролит до последнего тайтла, отправляется fetch запрос на получение новых тайтлов.
    
    Фильтрация тайтлов через параметры запроса.

**Страница с тайтлом:**
    Оценка тайтла (под названием тайтла нажать на звезду) fetch.
    
    Сохранение тайтла в закладки. Реализовано с помощью **websockets**, 
    при добавлении тайтла в закладки, он появляется в закладках и обновляется 
    информация о тайтле у всех сессий пользователя.
    
    Комментарии. Реализовано с помощью **websockets**, при отправлении добавляется
    у всех пользователей, которые сейчас находятся на той же странице.

    Оценка комментариев и переход по профилю автора fetch.

**Профиль:**
    Изменение аватарки fetch и пароля.

**Поиск.** Infinity scroll
**Закладки.** Обновляются в режиме реального времени с помощью websockets
**Безопасность.** Защита от CSRF по принципу cookie-to-header token. 
Когда пользователь заходит на страницу для него генерируется 
32 битное шестнадцатеричное число, которое будет являться csrf_token и добавляться в cookie httpOnly и template context, где сохраняется в константе. 
Когда пользователь отправляет POST, PUT запрос, он должен отправить тот же csrf_token в header,
что и в cookie. На стороне сервера проверется, что csrf_token в header совпадает с cookie.
**Регистрация, авторизация.** Основаны на JWT, присутствует валидация.
**Восстановление пароля.** Асинхронное(asyncio) отправление письма через RabbitMQ
**Выход.** Удаление jwt_token из cookie

**Парсер** в django версии

## Установка

Активировать виртуальное окружение. 
```bash
myenv/Scripts/activate
```

Или

Установить django и его зависимости. 
```bash
pip install -r requirements.txt
```

Заменить данные для подключения бд на свои в файле .env

```bash
DB_HOST=localhost
DB_PORT=5432
DB_NAME=remanga_fastapi
DB_USER=postgres
DB_PASS=Qewads
```

DB_*_TEST бд для тестов, если не запускать тесты можно не менять.
REDIS, RABBITMQ если не включены, то можно не менять, предусмотрены версия без них. 
Если включены, то ввести свои данные.

SMTP если не работает, то заменить на свой.

Для запуска с данными нужно импортировать PostgreSQL backup в директории database_backups. 
```bash
psql -U DB_USER -d DB_NAME -f database_backups/release.sql

Ex. psql -U postgres -d remanga_fastapi -f database_backups/release.sql
```

Запустить проект. 
```bash
cd remanga_fastapi/src

Windows. python -m uvicorn main:app --reload
Linux. uvicorn main:app --reload
```

### Docker версия. 

Запуск  
```bash 
docker compose up 
```
Для запуска с данными нужно восстановить бд

```bash 
docker exec -it postgresdb bash
psql -U postgres -d postgres -f /database_backups/release.sql
Пароль postgres
```

## Тесты. 
Запускаются в github actions, можно и локально, только нужно изменить в .env DB_TEST данные на свои.

Проверка получения csrf_token в cookie.
Проверка исключений в параметрах запроса, которые могут привести к ошибкам.
Проверка как сохраняются данные в redis и извлекаются.
Проверка всех фильтров тайтлов.