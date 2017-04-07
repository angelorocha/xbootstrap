<div class="extgallery">
	<a title="<{$extgalleryName}>" href="<{xoAppUrl modules/extgallery/}>"><{$extgalleryName}></a>
	<{foreachq item=node from=$catPath name=breadcrumb}>
	<img src="images/breadcrumb-link.gif" alt="BreadCrumb" />
	<a title="<{$node.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$node.cat_id}>"><{$node.cat_name}></a>
	<{/foreach}>
	<img src="images/breadcrumb-link.gif" alt="BreadCrumb" /> <{$cat.cat_name}>

	<table class="outer">
		<tr>
			<th><{$lang.categoriesAlbums}></th>
			<th class="txtcenter"><{$lang.nbAlbums}></th>
			<th class="txtcenter"><{$lang.nbPhotos}></th>
		</tr>
		<{foreachq item=child from=$catChild}>
		<tr class="<{cycle values="even,odd"}>">
			<{if $child.cat_nb_album == 0}>
			<td colspan="2">
				<{else}>
			<td>
				<{/if}>

				<!-- Category/album image -->
				<!-- Si l'option d'affichage de la photo de la categorie est active, alors -->
				<{if $disp_cat_img == 1 }>
					<{if $child.cat_imgurl != "" }>
						<div class="catThumb">
							<{if $child.cat_isalbum}>
								<a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>"><img src="<{$child.cat_imgurl}>" alt="<{$child.cat_name}>" title="" width="100" /></a>
							<{else}>
								<a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>"><img src="<{$child.cat_imgurl}>" alt="<{$child.cat_name}>" title="" width="100" /></a>
							<{/if}>
						</div>
					<{else}>
						<{if $child.photo}>
							<div class="catThumb">
								<{if $child.cat_isalbum}>
									<a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>"><img src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" alt="<{$child.photo.photo_title}>" title="<{$child.photo.photo_title}>" /></a>
								<{else}>
									<a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>"><img src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" alt="<{$child.photo.photo_title}>" title="<{$child.photo.photo_title}>" /></a>
								<{/if}>
							</div>
						<{/if}>
					<{/if}>
				<{else}>
					<{if $child.photo}>
						<div class="catThumb">
							<{if $child.cat_isalbum}>
								<a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>"><img src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" alt="<{$child.photo.photo_title}>" title="<{$child.photo.photo_title}>" /></a>
							<{else}>
								<a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>"><img src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" alt="<{$child.photo.photo_title}>" title="<{$child.photo.photo_title}>" /></a>
							<{/if}>
						</div>
					<{/if}>
				<{/if}>

				<!-- Fin de la modif -->
				<{if $child.cat_isalbum}>
				<strong><a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>"><{$child.cat_name}></a></strong><br /><{$child.cat_desc}></td>
			<{else}>
				<h2><a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>"><{$child.cat_name}></a></h2><br /><h3><{$child.cat_desc}></h3>
			<{/if}>
			<{if $child.cat_nb_album != 0}>
				<td class="txtcenter"><{$child.cat_nb_album}></td>
			<{/if}>
			<td class="txtcenter"><{$child.cat_nb_photo}></td>
		</tr>
		<{/foreach}>
	</table>

	<{if $show_rss}>
		<div id="rss">
			<a href="<{xoAppUrl modules/extgallery/public-rss.php}>" title="<{$smarty.const._MD_EXTGALLERY_RSS}>">
				<img src="<{xoAppUrl modules/extgallery/images/feed.png}>" alt="<{$smarty.const._MD_EXTGALLERY_RSS}>" />
			</a>
		</div>
	<{/if}>

	<{include file='db:system_notification_select.html'}>
</div>
