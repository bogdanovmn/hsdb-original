<TMPL_LOOP cards>
	<div id=<TMPL_VAR id> class=card>
		<img src="http://wow.zamimg.com/images/hearthstone/cards/ruru/small/<TMPL_VAR image_url>.png?9786">
		<br>
		<div id='norm_<TMPL_VAR id>' class="counter norm_count"><TMPL_VAR norm_count></div>
		<div id='gold_<TMPL_VAR id>' class="counter gold_count"><TMPL_VAR gold_count></div>
	</div>
</TMPL_LOOP>

<script>

	$('div.card div.counter').click(
		function(event) {
			console.log(event.target.innerHTML);
			var type = event.target.id.split("_")[0];
			var id   = event.target.id.split("_")[1];
			var count= parseInt(event.target.innerHTML) + 1;

			if (count == 3) {
				count = 0;
			}

		
		
			$.ajax({ 
				url: '/count/' + type + '/' + id + '/' + count + '/',
				success: function(result) {
					$('#' + type + '_' + id).text(count);
				}
			});
		}
	);


</script>
