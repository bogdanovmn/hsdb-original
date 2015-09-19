<TMPL_IF error_msg>
	<div class=error_msg>
		<TMPL_VAR error_msg>
	</div>
</TMPL_IF>

<div class=login>
	<form method=post>
		<p>E-mail
		<br>
		<input type=text name=email>
		<p>Пароль
		<br>
		<input type=password name=password value=''>
		<p>
		<input type=submit name=login_submit value='Войти'>
		<a href='/register/'>Регистрация</a>
	</form>
</div>
