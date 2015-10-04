<div id=left_menu>
	<div class=filter><b>Персонаж</b>
		<div class=values>
			<TMPL_LOOP filter_character>
				<p>
				<TMPL_IF selected>
					<b><TMPL_VAR name></b>
				<TMPL_ELSE>
					<a href="?character_id=<TMPL_VAR id>">
						<TMPL_VAR name>
					</a>
				</TMPL_IF>
				</p>
			</TMPL_LOOP>
		</div>
	</div>
</div>
