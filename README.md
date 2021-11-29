
Цель: Реализовать приложение для просмотра видео с камер наблюдения.

Описание интерфейса: Приложение должно состоять из двух основных интерфейсов (экранов / представлений, - формулировка в зависимости от ОС Android/IOS отличается). Первый интерфейс предназначен для просмотра списка камер, второй для получения видеотрансляции с камеры.

Пример интерфейса:
Внешний вид интерфейса приложения показан на рис. 1.
 
Задачи:
1) Реализовать экран просмотра списка камер. Данный экран должен открываться при старте приложения, и должен содержать в себе список карточек камер. Карточка камеры в свою очередь должна содержать следующие данные: изображение(preview) и название. 
2) Реализовать экран просмотра видеопотока(изображения) с камеры. Данный экран должен открываться при нажатии на карточку камеры(см. первый интерфейс). Внутри себя данный экран должен содержать webview компонент в рамках которого должен открываться плеер для воспроизведения потока. Ссылка на воспроизведение должна пробрасываться внутрь webview компонента.
3*) По желанию попробовать совместить UIKit и Swiftui либо наоборот

Backend API:
https://orionnet.online/api/v1/cameras/public - API для получения списка камер. Необходимые поля: ID, Title
https://orionnet.online/api/v2/preview_images/{id} - API для получения превью камеры. Вместо {id} необходимо подставлять идентификатор камеры(тестовый id - 1).
https://krkvideo1.orionnet.online/cam{id}/embed.html - ссылка для просмотра потока с камеры. Для просмотра необходимо вместо {id} в ссылку подставить id камеры. 