# ДЗ по 3 модулю terraform
### задание 2.1 count_vm
![alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/03/src/images/image.png?raw=true)
Прошу прощения за захардкоженный count, но думаю в этом блоке он не сильно опасен. Однако подробнее:

тут с помощью аргумента count говорим, что создаться должно определённое количество машин, а в поле имени задано, что оно состоит из приставки web и индекса count + 1 (выполнил операцию сложения, чтобы соблюсти задачу дз), также задали vm группу безопасности с помощью аргумента security_group_ids.
Ресурсы к этой вм передаются через переменную vms_resources.

### задание 2.2 файл for_each-vm.tf

![alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/03/src/images/image-1.png?raw=true)
![alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/03/src/images/image-2.png?raw=true)

Чтобы выполнить условие задания, создана map переменная, которая хранит в себе ресурсы создаваемых нами машин, для удобства, она помещена в один файл с этими машинами.

Просили использовать функцию file в локал? вот:

![alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/03/src/images/image-3.png?raw=true)


### задание 3.1 

![alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/03/src/images/image-4.png?raw=true)

### задание 3.2

![alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/03/src/images/image-5.png?raw=true)

т.к. машина одиночная, то создавать отдельные переменные для её ресурсов не стал.

Тут блок Secondary disk переделываем в динамический с помощью аргумента dynamic, внутр помещаем цикл, который пройдется по созданным дискам в disk_vm и получит оттуда значения.

### Задание 4

Пока я не знал что такое ansible и не начался модуль по нему, я понятия не имел как выполнить это дз. Однако, пересмотрев 4 раза лекцию и трижды прочитав первые 2 материала по ansible, стало понятно, что вообще нам нужно получить. Как итог:

![alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/03/src/images/image-6.png?raw=true)

Расписывать тут не буду, комментарии на скриншоте и в коде. А чтобы все работало, нужен шаблон:

![alt text](https://github.com/SanchezGogol/Netology-HomeWorks/blob/main/ter-homerworks/03/src/images/image-7.png?raw=true)

Комментарии по нему также в коде.

