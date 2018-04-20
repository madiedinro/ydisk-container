
# Yandex Disk container

Удобно использовать на MacOS, чтобы не гонять стандартный тяжеловесный клиент

### Setup

Первым делом необходимо создать volume для хранения токена авторизации и конфига

    docker volume create ydcreds

Сборка образа

    docker build -t madiedinro/ydisk-container .

Выполнение конфигурации. В качестве директории хранения следует указать /ydisk

    docker run -it --rm \
        -v ydcreds:/root \
        madiedinro/ydisk-container \
        yandex-disk setup

Запуск синхронизирующего демона

    docker run -d --restart=unless-stopped \
        --name ydisk \
        -v ydcreds:/root \
        -v ~/YandexDisk:/ydisk \
        madiedinro/ydisk-container

Готово! В вашей домашней папке теперь есть YandexDisk синхронизация которой происходит через контейнер докера

### Проверка статуса 

    docker exec ydisk yandex-disk status
