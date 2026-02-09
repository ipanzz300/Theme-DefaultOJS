{**
 * templates/frontend/pages/issue.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a landing page for a single issue. It will show the table of contents
 *  (toc) or a cover image, with a click through to the toc.
 *
 * @uses $issue Issue The issue
 * @uses $issueIdentification string Label for this issue, consisting of one or
 *       more of the volume, number, year and title, depending on settings
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $primaryGenreIds array List of file genre IDs for primary types
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$issueIdentification}

<div class="page page_issue">

	{* Display a message if no current issue exists *}
	{if !$issue}
		{include file="frontend/components/breadcrumbs_issue.tpl" currentTitleKey="current.noCurrentIssue"}
		
		<div class="issue-zero-state content-card">
			<div class="zero-state-icon">
				<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="#94a3b8" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
					<path d="M12 8V12" stroke="#94a3b8" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
					<path d="M12 16H12.01" stroke="#94a3b8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
				</svg>
			</div>
			<h2 class="zero-title">{translate key="current.noCurrentIssue"}</h2>
			<p class="zero-desc">
				{translate key="current.noCurrentIssueDesc"}
				{$currentJournal->getLocalizedName()|escape} {translate key="plugins.themes.defaultOjs.issue.preparingNext"} 
				{translate key="plugins.themes.defaultOjs.issue.stayTuned"}
			</p>
			<div class="zero-actions">
				<a href="{url page="issue" op="archive"}" class="btn-secondary-custom">
					{translate key="plugins.themes.defaultOjs.issue.browsePast"}
				</a>
				<a href="{url page="about" op="submissions"}" class="btn-main">
					{translate key="plugins.themes.defaultOjs.hero.makeSubmission"}
				</a>
			</div>
		</div>

	{* Display an issue with the Table of Contents *}
	{else}
		{include file="frontend/components/breadcrumbs_issue.tpl" currentTitle=$issueIdentification}
		<h1>
			{$issueIdentification|escape}
		</h1>
		{include file="frontend/objects/issue_toc.tpl"}
	{/if}
</div>

{include file="frontend/components/footer.tpl"}
