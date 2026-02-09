{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 * FIXED: Handling for Empty Description & Layout Issues
 *}
{if !$heading}
	{assign var="heading" value="h2"}
{/if}
{assign var="articleHeading" value="h3"}
{if $heading == "h3"}
	{assign var="articleHeading" value="h4"}
{elseif $heading == "h4"}
	{assign var="articleHeading" value="h5"}
{elseif $heading == "h5"}
	{assign var="articleHeading" value="h6"}
{/if}

<div class="obj_issue_toc">

	{* Indicate if this is only a preview *}
	{if !$issue->getPublished()}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
	{/if}

	{* --- LOGIC: Cek apakah deskripsi benar-benar ada isinya (bukan cuma spasi) --- *}
	{assign var="rawDesc" value=$issue->getLocalizedDescription()}
	{assign var="cleanDesc" value=$rawDesc|strip_tags|trim}

	{* Issue introduction area above articles *}
	{* Tambahkan class 'no-description' jika cleanDesc kosong *}
	<div class="heading {if !$cleanDesc}no-description{/if}">

		{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
		{if $issueCover}
			<div class="cover">
				{capture assign="defaultAltText"}
					{translate key="issue.viewIssueIdentification" identification=$issue->getIssueIdentification()|escape}
				{/capture}
				<img src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:$defaultAltText}">
			</div>
		{/if}

		{* 2. DESCRIPTION *}
		{* Hanya tampilkan div description jika benar-benar ada teksnya *}
		{if $cleanDesc}
			<div class="description">
				{$rawDesc|strip_unsafe_html}
			</div>
		{/if}

		{* 3. PUBLISHED DATE *}
		{if $issue->getDatePublished()}
			<div class="published">
				<span class="label">
					{translate key="submissions.published"}:
				</span>
				<span class="value">
					{$issue->getDatePublished()|date_format:$dateFormatShort}
				</span>
			</div>
		{/if}

		{* 4. PUB ID & DOI *}
		{foreach from=$pubIdPlugins item=pubIdPlugin}
			{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
			{if $pubId}
				{assign var="resolvingUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
				<div class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
					<span class="type">{$pubIdPlugin->getPubIdDisplayType()|escape}:</span>
					<span class="id">
						{if $resolvingUrl}<a href="{$resolvingUrl|escape}">{$resolvingUrl}</a>{else}{$pubId}{/if}
					</span>
				</div>
			{/if}
		{/foreach}

		{assign var=doiObject value=$issue->getData('doiObject')}
		{if $doiObject}
			{assign var="doiUrl" value=$doiObject->getData('resolvingUrl')|escape}
			<div class="pub_id doi">
				<span class="type">DOI:</span>
				<span class="id">
					<a href="{$doiUrl|escape}">{$doiUrl}</a>
				</span>
			</div>
		{/if}

	</div> 
	{* --- END HEADING --- *}

	{* Full-issue galleys *}
	{if $issueGalleys}
		<div class="galleys">
			<{$heading} id="issueTocGalleyLabel">
				{translate key="issue.fullIssue"}
			</{$heading}>
			<ul class="galleys_links">
				{foreach from=$issueGalleys item=galley}
					<li>
						{include file="frontend/objects/galley_link.tpl" parent=$issue labelledBy="issueTocGalleyLabel" purchaseFee=$currentJournal->getData('purchaseIssueFee') purchaseCurrency=$currentJournal->getData('currency')}
					</li>
				{/foreach}
			</ul>
		</div>
	{/if}

	{* Articles *}
	<div class="sections">
	{if $publishedSubmissions|@count > 0}
		{foreach name=sections from=$publishedSubmissions item=section}
			<div class="section">
			{if $section.articles}
				{if $section.title}
					<{$heading}>
						{$section.title|escape}
					</{$heading}>
				{/if}
				<ul class="cmp_article_list articles">
					{foreach from=$section.articles item=article}
						<li>
							{include file="frontend/objects/article_summary.tpl" heading=$articleHeading}
						</li>
					{/foreach}
				</ul>
			{/if}
			</div>
		{/foreach}
	{else}
		<div class="no_articles_notice">
			<p>{translate key="issue.noArticles"}</p>
		</div>
	{/if}
	</div>
</div>