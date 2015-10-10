<div id=left_menu>
	<div class=filter><b>Персонаж</b>
		<div class=values>
			<table>
			<TMPL_LOOP filter_character>
				<tr>
				<td class=progress>
					<TMPL_IF progress>
						<span class="progress progress_<TMPL_VAR type>"><TMPL_VAR progress>%</span>
					</TMPL_IF>
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
	
	<div class=filter>
		<b>Редкость</b>
		<TMPL_IF rarity_id>
			<a class=reset href="?rarity_id=0&<TMPL_VAR current_filter_wo_rarity_id>">сбросить</a>
		</TMPL_IF>

		<div class=values>
			<TMPL_LOOP filter_rarity>
				<TMPL_IF selected>
					<div class="rarity_filter rarity_filter_<TMPL_VAR id>_selected"></div>
				<TMPL_ELSE>
					<a class=rarity_filter href="?rarity_id=<TMPL_VAR id>&<TMPL_VAR current_filter_wo_rarity_id>">
						<div class="rarity_filter rarity_filter_<TMPL_VAR id> selected"></div>
					</a>
				</TMPL_IF>
			</TMPL_LOOP>
		</div>
	</div>

	<div class=filter>
		<b>Набор</b>
		<TMPL_IF set_id>
			<a class=reset href="?set_id=0&<TMPL_VAR current_filter_wo_set_id>">сбросить</a>
		</TMPL_IF>

		<div class=values>
			<table>
			<TMPL_LOOP filter_set>
				<tr>
				<td class=progress>
					<TMPL_IF progress>
						<span class="progress progress_<TMPL_VAR type>"><TMPL_VAR progress>%</span>
					</TMPL_IF>
				<td>
					<TMPL_IF selected>
						<b><TMPL_VAR name></b>
					<TMPL_ELSE>
						<a href="?set_id=<TMPL_VAR id>&<TMPL_VAR current_filter_wo_set_id>">
							<TMPL_VAR name>
						</a>
					</TMPL_IF>
			</TMPL_LOOP>
			</table>
		</div>
	</div>
</div>
