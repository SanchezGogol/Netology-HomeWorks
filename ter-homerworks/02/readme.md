##Задание 1 пункт 4: Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
При попытке запуска проекта мы сталкиваемся с проблемой:
- ![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image.png?raw=true)

Тут суть в том, что нами небыли записаны значения в переменные, по этому терраформ просит ввести значения этих переменных из консоли.
Для исправления нужно указать какие значения нам нужно использовать:

- ![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-2.png?raw=true)

После попытки применить terraform apply, Сталкиваемся с ошибкой допустимого количества ядер в указанной платформе. Перед этим, была ошибка о том, что id платформы небыло найдено. Как оказалось, в описании было id standart-v4, оно было изменено мной на standard-v2,  но ситуацию это не решило. Изменение platform_id на "standard-v1", как указано в документации это дефолтное значение, дало возможность проекту запуститься.

- ![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-1.png?raw=true)

 применяем terraform apply 

- ![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-4.png?raw=true)

По итогу вм запускается и можно выполнить curl ifconfig.me

- ![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-3.png?raw=true)

Для выполнения следующих заданий кладём прод:

- ![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-5.png?raw=true)

------

## Задание 3: vms_platform.tf и netology-develop-platform-db

Я создал файл vms_platform.tf и перенёс туда переменные, касающиеся параметров ВМ. Т.к. далее потребуется создать ещё одну машину, сразу задаю ей дополнительные переменные. По условиям, вторая вм должна работать в другой зоне, по этому я ещё добавил дополнительную подсеть, т.к. машина должна работать в той же зоне, в какой и находится подсеть (параметры зоны выставил в файле variables):
### vms_platform.tf
![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-6.png?raw=true)
![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-7.png?raw=true)


### variables.tf
![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-8.png?raw=true)
![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-9.png?raw=true)

### main.tf

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-10.png?raw=true)
![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-11.png?raw=true)

### Итоги в яндексе
![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-12.png?raw=true)
![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-13.png?raw=true)

------

## Задание 4: Файл output
Прописываем файл putputs:

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-16.png?raw=true)

В нём я в вывод подаю список из двух списков, в каждом из которых спрятано имя машины и список с её конфигурациями.

Вывод:

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-17.png?raw=true)

-----

## Задание 5: locals

Для выполнения этого задания я создал дополнительные переменные:

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-18.png?raw=true)

В locals описал метод создания имени машины:

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-19.png?raw=true)

правим main.tf для того, чтобы использовались locals

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-20.png?raw=true)

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-21.png?raw=true)

Применяем изменения:

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-22.png?raw=true)

Видим, что изменения были приняты и новое имя машины не отличается от старого, по этому tf не вносил изменения.

####map

Теперь необходимо создать map переменную для metadata. Т.К. terraform не позволяет использовать переменные внутри других переменных, я использую locals для создания map переменной с переменной в строке ssh ключа:

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-23.png?raw=true)

Помещаю данную переменную в блоки metadata:

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-24.png?raw=true)

эту процедуру я провел с конфигами обеих ВМ.

Теперь закомментирую все ненужные переменные:

![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-25.png?raw=true)
![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-26.png?raw=true)

Terraform plan:
![Alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/02/images/image-27.png?raw=true)