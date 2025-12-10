<p align="center">
    <img src="https://github.com/xiozip/nagios-sendsms-via-perl/blob/main/header.jpg" />
</p>
# nagios-sendsms-via-perl
Sript PERL send SMS via GSM-route
=
Можно подключить  этот скрипт к событию в Nagios и к Вам будут приходить SMS.

Для начала не забудьте подключить к PERL модули из CPAN.
В самом скрипте сделайте изменения.
В строке :

$connect->open('X.X.X.X');
Необходимо прописать IP адрес роутера.

В строке:

$connect->login('admin', 'password');

Пропишите учетную запись и пароль.

В шаблоне 8XXXXXXXXXX   пропишите номер телефона для получения СМС

В секций

//####################

//# Send to Email MIME

//####################


Пропишите реквизиты почты.

Подключите скрипт к Nagios

EXTERNAL COMMAND FILE

This is the file that Nagios checks for external command requests.
It is also where the command CGI will write commands that are submitted
by users, so it must be writeable by the user that the web server
is running as (usually 'nobody').  Permissions should be set at the
directory level instead of on the file, as the file is deleted every
time its contents are processed.

command_file=@localstatedir@/rw/nagios.cmd

https://github.com/NagiosEnterprises/nagioscore/blob/master/sample-config/nagios.cfg.in
