{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal">
    {call_hook name="Templates::Index::journal"}

    {* === HERO BANNER === *}
    <section class="custom-hero-banner ojs-hero-wrapper">
        <div class="container">
            <div class="hero-inner">

                <span class="hero-subtitle ojs-hero-subtitle">
                    {translate key="plugins.themes.defaultOjs.hero.subtitle"}
                </span>

                <h1 class="hero-title ojs-hero-title">
                    {$currentJournal->getLocalizedName()|escape}
                </h1>

                {* strip_tags = Menghapus format bold/enter dari editor admin biar teksnya rapi *}
                <div class="hero-tagline ojs-hero-tagline">
                    {if $currentJournal->getLocalizedDescription()}
                        {$currentJournal->getLocalizedDescription()|strip_tags}
                    {else}
                        {translate key="journal.aboutTheJournal"} - {$currentJournal->getLocalizedName()|escape}. 
                        {translate key="plugins.themes.defaultOjs.hero.defaultTagline"}
                    {/if}
                </div>

                <div class="hero-btns ojs-hero-buttons">
                    <a href="{url page="about" op="submissions"}" class="btn-main ojs-btn-submission">
                        {translate key="plugins.themes.defaultOjs.hero.makeSubmission"}
                    </a>
                    {if $issue}
                    <a href="#homepageIssue" class="btn-outline-hero ojs-btn-issue">
                        {translate key="plugins.themes.defaultOjs.hero.viewCurrent"}
                    </a>
                    {/if}
                </div>

            </div>
        </div>
    </section>

    {* === MAIN CONTENT === *}
    <div class="container content-wrapper ojs-content-wrapper">
        <div class="row">
            
            {* Bagian Kiri: CURRENT ISSUE / ZERO STATE *}
            <main class="col-lg-8 col-md-12 ojs-main-content">

                {if $issue}
                <section class="current_issue content-card ojs-issue-card" id="homepageIssue">
                    <div class="card-header-custom">
                        <h2 class="section-title">
                            <svg class="icon-title" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                <polyline points="14 2 14 8 20 8"></polyline>
                                <line x1="16" y1="13" x2="8" y2="13"></line>
                                <line x1="16" y1="17" x2="8" y2="17"></line>
                                <polyline points="10 9 9 9 8 9"></polyline>
                            </svg>
                            {translate key="journal.currentIssue"}
                        </h2>
                        <span class="badge-new">{translate key="plugins.themes.defaultOjs.badge.latest"}</span>
                    </div>

                    <div class="toc-wrapper">
                        {include file="frontend/objects/issue_toc.tpl" heading="h3"}
                    </div>

                    <div class="card-footer-custom">
                        <a href="{url page="issue" op="archive"}" class="view-all-link">
                            <span class="text-label">{translate key="plugins.themes.defaultOjs.link.viewAll"}</span>
                            <svg class="icon-chevron" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M9 18L15 12L9 6" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </a>
                    </div>
                </section>
                {else}
                {* === ZERO STATE: TAMPILAN JIKA BELUM ADA JURNAL === *}
                <section class="current_issue content-card zero-state-card">
                    <div class="zero-state-content">
                        <div class="zero-state-header">
                            <div class="zero-state-icon-wrapper">
                                <div class="pulse-ring"></div>
                                <svg class="zero-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M12 8V12" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M12 16H12.01" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </div>
                            <h2 class="zero-title">{translate key="plugins.themes.defaultOjs.zero.title"}</h2>
                            <p class="zero-desc">
                                {translate key="plugins.themes.defaultOjs.zero.preparing"} <strong>{$currentJournal->getLocalizedName()|escape}</strong> {translate key="plugins.themes.defaultOjs.zero.dedicated"}
                            </p>
                        </div>
                        
                        <div class="zero-steps-container">
                            <h3 class="steps-title">{translate key="plugins.themes.defaultOjs.zero.stepsTitle"}</h3>
                            <div class="zero-steps">
                                <div class="step-item">
                                    <div class="step-icon-box">1</div>
                                    <div class="step-info">
                                        <span class="step-label">{translate key="plugins.themes.defaultOjs.zero.step1Label"}</span>
                                        <span class="step-text">{translate key="plugins.themes.defaultOjs.zero.step1Text"}</span>
                                    </div>
                                </div>
                                <div class="step-divider"></div>
                                <div class="step-item">
                                    <div class="step-icon-box">2</div>
                                    <div class="step-info">
                                        <span class="step-label">{translate key="plugins.themes.defaultOjs.zero.step2Label"}</span>
                                        <span class="step-text">{translate key="plugins.themes.defaultOjs.zero.step2Text"}</span>
                                    </div>
                                </div>
                                <div class="step-divider"></div>
                                <div class="step-item">
                                    <div class="step-icon-box">3</div>
                                    <div class="step-info">
                                        <span class="step-label">{translate key="plugins.themes.defaultOjs.zero.step3Label"}</span>
                                        <span class="step-text">{translate key="plugins.themes.defaultOjs.zero.step3Text"}</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="zero-actions">
                            <a href="{url page="about" op="submissions"}" class="btn-main">
                                <span class="btn-text">{translate key="plugins.themes.defaultOjs.zero.startSubmission"}</span>
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </a>
                            <a href="{url page="about"}" class="btn-secondary-custom">
                                {translate key="plugins.themes.defaultOjs.zero.learnMore"}
                            </a>
                        </div>
                    </div>
                </section>
                {/if}

            </main>

            
            <aside class="col-lg-4 col-md-12 ojs-sidebar">
                <div class="custom-sidebar">
                    {call_hook name="Templates::Common::Sidebar"}
                </div>
            </aside>
        </div>
    </div>
</div>

{include file="frontend/components/footer.tpl"}