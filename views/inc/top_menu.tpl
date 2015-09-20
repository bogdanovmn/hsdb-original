<TMPL_IF user_id>
	<div id=top_menu>
		<div id=links>
			.::
			<a href='/collection/'>Пополнить коллекцию</a>
			::
			<a href='/booster/'>Открыть бустер</a>
			::.
		</div>
		<div id=user_info>
			.::
			<TMPL_VAR user_name>
			::
			<a href='/logout/'>X</a>
			::.
		</div>
	</div>
</TMPL_IF>
