<h1>Вход</h1>

<TMPL_IF error_msg>
	<div class=error_msg>
		<TMPL_VAR error_msg>
	</div>
</TMPL_IF>

<div class=login>
	<form method=post>
		<table>
		<tr>
			<td>E-mail
			<td><input type=text name=email>
		<tr>
			<td>Пароль
			<td><input type=password name=password value=''>
		<tr>
			<td><input type=submit name=login_submit value='  Войти  '>
			<td><a href='/register/'>Регистрация</a>
		</table>
	</form>
</div>
