Тестовое задание состоит из двух частей:

    1. Подготовить Dockerfile и команду запуска docker контейнера выполняющего сборку приложения Signal Server https://github.com/signalapp/Signal-Server
    В результате выполнения должен быть получен .jar файл приложения. Решением по данной задаче, должно быть 2 файла, Dockerfile и файл build.sh содержащий команды для сборки docker образа и сборки файла приложения

    2. Подготовить файл docker-compose.yml содержащий все необходимые сервисы (контейнеры) для запуска приложения (.jar файла), которое было собрано в рамках первой задачи. Также необходимо сконфигурировать приложение для запуска на локальном порту хостовой OC, при этом для облачных сервисов, достаточно указать валидные параметры, без реальных сервисов, достаточно, чтоб приложение запускалось и слушало указанный в конфигурации порт. Решением по данной задаче должен быть файл docker-compose.yml, все необходимые файлы для запуска приложения в среде docker (config.yml, docker entrypoint и т.п.) и readme файл с инструкцией по запуску. Будет плюсом использование БД в конфигурации master-slave.

