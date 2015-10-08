<TMPL_IF user_id>
	<div id=top_menu>
		<div id=links>
			.::<TMPL_LOOP menu>
				<TMPL_IF current>
					<b><TMPL_VAR title></b>
				<TMPL_ELSE>
					<a href='<TMPL_VAR url>?<TMPL_VAR current_filter>'><TMPL_VAR title></a>
				</TMPL_IF>
				<TMPL_IF __first__>
					<span class=progress><TMPL_VAR collection_percent>%</span>
				</TMPL_IF>
			::</TMPL_LOOP>.
		</div>
		<div id=user_info>
			.::
			<TMPL_VAR user_name>
			::
			<a class=logout href='/logout/'>X</a>
			::.
		</div>
	</div>
</TMPL_IF>
