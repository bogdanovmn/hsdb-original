<div id=left_menu>
		<fieldset>
			<legend>Персонаж</legend>
			<select name='character'>
				<TMPL_LOOP filter_character>
					<option <TMPL_IF selected>selected</TMPL_IF> value='<TMPL_VAR id>'>
						<TMPL_VAR name>
					</option>
				</TMPL_LOOP>
			</select>
		</fieldset>
		
		<!-- fieldset>
			<legend>Formats</legend>
			<input type=checkbox <TMPL_IF elo>checked</TMPL_IF> name=elo>
			<img class=for_checkbox src="http://static.beta.urban-rivals.com/img/pillz.png">
			<input type=checkbox <TMPL_IF standard>checked</TMPL_IF> name=standard>
			<img class=for_checkbox src="http://static.beta.urban-rivals.com/img/v2/icons/format_standard.png">
		</fieldset -->
</div>
