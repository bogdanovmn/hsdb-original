<TMPL_INCLUDE 'inc/error_msg.tpl'>

<div class=register>
	<form method=post>
		<p>E-mail
		<br>
		<input type=text name=email>
		<p>Пароль (не от мыла)
		<br>
		<input type=password name=password value=''>
		<p>Пароль еще разок
		<br>
		<input type=password name=password_check value=''>
		<p>Два минус три плюс пять
		<br>
		<input type=text name=zombi_check>
		<p>Как к Вам обращаться
		<br>
		<input type=text name=name>
		<p>
		<input type=submit name=register_submit value='Зарегиться'>
	</form>
</div>
