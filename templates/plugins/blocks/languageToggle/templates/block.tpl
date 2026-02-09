{**
 * plugins/themes/defaultOjs/templates/plugins/blocks/languageToggle/templates/block.tpl
 *
 * Override for core language toggle block to use custom localized labels.
 *}
{if $enableLanguageToggle}
<div class="pkp_block block_language">
	<h2 class="title">
		{translate key="common.language"}
	</h2>

	<div class="content">
		<ul>
			{foreach from=$languageToggleLocales item=localeName key=localeKey}
                {assign var="sidebarLocaleName" value=$localeName}
                {if $currentLocale == 'en_US' or $currentLocale == 'en'}
                    {if $localeKey|substr:0:2 == 'id'}{assign var="sidebarLocaleName" value="Indonesian"}{else}{assign var="sidebarLocaleName" value="English"}{/if}
                {else}
                    {if $localeKey|substr:0:2 == 'en'}{assign var="sidebarLocaleName" value="Inggris"}{else}{assign var="sidebarLocaleName" value="Bahasa Indonesia"}{/if}
                {/if}
				<li class="locale_{$localeKey|escape}{if $localeKey == $currentLocale} current{/if}" lang="{$localeKey|replace:"_":"-"}">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}" {if $localeKey == $currentLocale}class="is_active"{/if}>
						{$sidebarLocaleName}
					</a>
				</li>
			{/foreach}
		</ul>
	</div>
</div><!-- .block_language -->
{/if}
