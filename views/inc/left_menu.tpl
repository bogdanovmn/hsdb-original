<div id=left_menu>
	<div class=filter><b>Персонаж</b>
		<div class=values>
			<table>
			<TMPL_LOOP filter_character>
				<tr>
				<td class=progress>
					<span class="progress progress_<TMPL_VAR type>"><TMPL_VAR progress>%</span>
				<td>
					<TMPL_IF selected>
						<b><TMPL_VAR name></b>
					<TMPL_ELSE>
						<a href="?character_id=<TMPL_VAR id>&<TMPL_VAR current_filter_wo_character_id>">
							<TMPL_VAR name>
						</a>
					</TMPL_IF>
			</TMPL_LOOP>
			</table>
		</div>
	</div>
	
	<div class=filter><b>Редкость</b>
		<div class=values>
			<TMPL_LOOP filter_rarity>
				<p>
				<TMPL_IF selected>
					<b><TMPL_VAR name></b>
				<TMPL_ELSE>
					<a href="?rarity_id=<TMPL_VAR id>&<TMPL_VAR current_filter_wo_rarity_id>">
						<TMPL_VAR name>
					</a>
				</TMPL_IF>
				</p>
			</TMPL_LOOP>
		</div>
	</div>

</div>
