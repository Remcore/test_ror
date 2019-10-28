# Тетсовое задагние
Требуемая версия Ruby - 2.6.3

Перед запуском приложения нужно выполнить несколько шагов:

1. `bundle install`
2. `gem install foreman`
3. `cp .env.example .env`
4. `docker-compose up`

Для запуска всего приложения `foreman start`

## Первый блок

Созданы классы в `app/interactors`:

Для выполнения через консоль `foreman run rails c`:
* Phone
    * phone = Phone.new("+7 999 999 999", "x", 3)
    * phone.escape => "+7 999 999 xxx"
* Email
    * email = Email.new("email@example.com", "x")
    * email.escape => "xxxxx@example.com"
* Skype
    * skype = Skype.new("skype:test") 
    * skype.escape => "skype:xxx"
    * skype = Skype.new("<a href=\"skype:tesfgfg?call\">skype</a>") 
    * skype.escape => "<a href=\"skype:xxx?call\">skype</a>"


## Второй блок

1 задание

```
SELECT user_id, SUM(reward) 
	FROM public.reports
	WHERE created_at > '2019-01-01' 
	AND user_id NOT IN (
		SELECT user_id 
		FROM public.reports 
		WHERE created_at < '2018-01-01' AND user_id NOT IN (
			SELECT user_id 
			WHERE created_at > '2018-01-01)) 
	GROUP BY user_id;
```

2 задание
не понимаю как использвоать аггрегативные функции для выполнения этого задания
```
SELECT reports.barcode, reports.price, title FROM public.reports
	LEFT OUTER JOIN public.pos ON title = title 
	WHERE reports.pos_id = pos.id AND title IN (SELECT title
		FROM public.pos
		GROUP BY title
		HAVING COUNT(*) > 1);
```
