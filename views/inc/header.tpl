<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>HSDB Tool</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="/css/main.css" type="text/css">
</head>

<body>

<TMPL_IF user_id>
	<div class=top_menu>
		<div class=login>
			<TMPL_VAR user_name>
			<a href='/logout/'>X</a>
		</div>
	</div>
</TMPL_IF>
