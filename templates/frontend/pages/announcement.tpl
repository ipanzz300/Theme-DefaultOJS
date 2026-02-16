{**
 * plugins/themes/defaultOjs/templates/frontend/pages/announcement.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view an individual announcement
 *
 * @uses $announcement Announcement The announcement to display
 * @uses $announcementTitle string Title of the announcement
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$announcementTitle}

<div class="page page_announcement">
	{include file="frontend/components/breadcrumbs_announcement.tpl" currentTitle=$announcementTitle}
	{include file="frontend/objects/announcement_full.tpl"}
</div>

{include file="frontend/components/footer.tpl"}
