;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
;; (unless package-archive-contents
;; (package-refresh-contents))
(package-refresh-contents)

;; ;; Install dependencies
(package-install 'htmlize)
(package-install 'org)
(package-install 'org-roam)

;; Load the publishing system
(require 'ox-publish)
(require 'org-roam)

(setq org-roam-directory (file-truename "~/Dropbox/documents/org/roam/pkc"))
(setq org-id-link-to-org-use-id t)
;; (org-roam-db-autosync-mode)

(setq org-publish-project-alist
      '(("org"
         :base-directory "~/Dropbox/documents/org/roam/pkc"
         :base-extension "org"
         ;; :exclude "20220504180110-pkc.org"
         :publishing-directory "./public"
         :publishing-function org-html-publish-to-html
         :recursive t
         :with-author nil           ;; Don't include author name
         :with-creator t            ;; Include Emacs and Org versions in footer
         :with-toc t                ;; Include a table of contents
         :with-title nil
         ;; :section-numbers 2       ;; include only first two section numbers
         :section-numbers nil       ;; Don't include section numbers
         :time-stamp-file nil
         
         ;; sitemap stuff
         :auto-sitemap t
         :sitemap-sort-files anti-chronologically
         
         ;; head, nav, footer
         :html-head "<link rel=\"stylesheet\" href=\"../css/style.css\"/>"
         :html-preamble
         "<nav class='navbar'>
          <!-- LOGO -->
            <a class='logo' href='sitemap.html'>PKCwiki</a>
            <!-- NAVIGATION MENU -->
            <ul class='nav-links'>
                <!-- USING CHECKBOX HACK -->
                <input type='checkbox' id='checkbox_toggle' />
                <label for='checkbox_toggle' class='hamburger'>&#9776;</label>
                <!-- NAVIGATION MENUS -->
                <div class='menu'>
                    <li><a href='20220521195427-problemos.html'>Problemos</a></li>
                    <li><a href='20220522061457-sandelys.html'>Sandelys</a></li>
                    <li><a href='20220522193000-tinklas.html'>Tinklas</a></li>
                    <li class='services'>
                        <a href='/'>Programos</a>
                        <!-- DROPDOWN MENU -->
                        <ul class='dropdown'>
                            <li><a href='20220326080528-active_directory.html'>Active directory</a></li>
                            <li><a href='20220521192142-o365.html'>o365</a></li>
                            <li><a href='20220414134329-ladas.html'>Ladas</a></li>
                            <li><a href='20220522065228-rdc.html'>RDC</a></li>
                            <li><a href='20220519110504-avix.html'>Avix</a></li>
                            <li><a href='20220414132838-vncviewer.html'>Vncviewer</a></li>
                            <li><a href='20220521201811-wise.html'>Wise</a></li>
                            <li><a href='20220524221035-cop.html'>COP</a></li>
                            <li><a href='20220414132558-lansweeper.html'>Lansweeper</a></li>
                            <li><a href='20220422115642-vmware.html'>Vmware</a></li>
                            <li><a href='20220505211200-vikarina.html'>Vikarina</a></li>
                            <li><a href='20220419152044-pulsesecure.html'>Pulse secure</a></li>
                            <li><a href='20220426190652-crowdstrike.html'>Crowdstrike</a></li>
                        </ul>
                    </li>
                    <li class='services'>
                        <a href='/'>Iranga</a>
                        <!-- DROPDOWN MENU -->
                        <ul class='dropdown'>
                            <li><a href='20220521185729-spausdintuvai.html'>Spausdintuvai</a></li>
                            <li><a href='20220521190020-kompiuteriai.html'>Kompiuteriai</a></li>
                            <li><a href='20220521190334-skaneriai.html'>Skaneriai</a></li>
                            <li><a href='20220422120253-kameros.html'>Kameros</a></li>
                            <li><a href='20220521190443-pelytes.html'>Pelytes</a></li>
                            <li><a href='20220523203440-telefonai.html'>Telefonai</a></li>
                            <li><a href='20220522061256-darbo_rubai.html'>Darbo rubai ir pan</a></li>
                            <li><a href='20220523062804-irangos_pirkimas.html'>Irangos pirkimas</a></li>
                        </ul>
                    </li>
                </div>
            </ul>
         </nav>"
         ;; :html-preamble
         ;; "<div class='nav'>
         ;;     <ul>
         ;;         <li><a href='sitemap.html'>'Paieska'</a></li>
         ;;         <li><a href='20220521195427-problemos.html'>Problemos</a></li>
         ;;         <li><a href='20220522061457-sandelys.html'>Sandelys</a></li>
         ;;         <li><a href='20220522193000-tinklas.html'>Tinklas</a></li>
         ;;         <li class='dropdown'>
         ;;             <a href='javascript:void(0)' class='dropbtn'>Programos</a>
         ;;             <div class='dropdown-content'>
         ;;                 <a href='20220326080528-active_directory.html'>Active directory</a>
         ;;                 <a href='20220521192142-o365.html'>o365</a>
         ;;                 <a href='20220414134329-ladas.html'>Ladas</a>
         ;;                 <a href='20220522065228-rdc.html'>RDC</a>
         ;;                 <a href='20220519110504-avix.html'>Avix</a>
         ;;                 <a href='20220414132838-vncviewer.html'>Vncviewer</a>
         ;;                 <a href='20220521201811-wise.html'>Wise</a>
         ;;                 <a href='20220414132558-lansweeper.html'>Lansweeper</a>
         ;;                 <a href='20220422115642-vmware.html'>Vmware</a>
         ;;                 <a href='20220505211200-vikarina.html'>Vikarina</a>
         ;;                 <a href='20220419152044-pulsesecure.html'>Pulse secure</a>
         ;;                 <a href='20220426190652-crowdstrike.html'>Crowdstrike</a>
         ;;             </div>
         ;;         </li>
         ;;         <li class='dropdown'>
         ;;             <a href='javascript:void(0)' class='dropbtn'>Iranga</a>
         ;;             <div class='dropdown-content'>
         ;;                 <a href='20220521185729-spausdintuvai.html'>Spausdintuvai</a>
         ;;                 <a href='20220521190020-kompiuteriai.html'>Kompiuteriai</a>
         ;;                 <a href='20220521190334-skaneriai.html'>Skaneriai</a>
         ;;                 <a href='20220422120253-kameros.html'>Kameros</a>
         ;;                 <a href='20220521190443-pelytes.html'>Pelytes</a>
         ;;                 <a href='20220523203440-telefonai.html'>Telefonai</a>
         ;;                 <a href='20220522061256-darbo_rubai.html'>Darbo rubai ir pan</a>
         ;;                 <a href='20220523062804-irangos_pirkimas.html'>Irangos pirkimas</a>
         ;;             </div>
         ;;         </li>
         ;;     </ul>
         ;; </div>
         ;; <div id=\"updated\">Updated: %C</div>"
         :html-postamble
         "<div class='footer'>
             <hr>
             Last updated %C. <br>
             Jei matai kokiu neatitikimu ar noretum ka papildyti - sakyk Arvydui.<br>
             Built with %c.
         </div>")

        ("static"
         :base-directory "~/Dropbox/documents/org/roam/pkc/static"
         :base-extension "jpg\\|gif\\|png\\|pdf\\|xlsx\\|txt"
         :publishing-directory "./public/static"
         :publishing-function org-publish-attachment
         :recursive t)
        ("css"
         :base-directory "./css"
         :base-extension "css"
         :publishing-directory "./css"
         :publishing-function org-publish-attachment
         :recursive t)
        ("all" :components ("org" "static" "css"))))

(setq org-export-with-broken-links 'mark)

;; --------------------------------------------------------------------------------
;; Stuff below converts roam links to html links on export
;; https://www.reddit.com/r/emacs/comments/q82zci/how_to_include_the_id_links_into_your_orgroam/

(setq org-id-extra-files (org-roam-list-files))

(defun org-html--reference (datum info &optional named-only)
  "Return an appropriate reference for DATUM.
DATUM is an element or a `target' type object.  INFO is the
current export state, as a plist.
When NAMED-ONLY is non-nil and DATUM has no NAME keyword, return
nil.  This doesn't apply to headlines, inline tasks, radio
targets and targets."
  (let* ((type (org-element-type datum))
	 (user-label
	  (org-element-property
	   (pcase type
	     ((or `headline `inlinetask) :CUSTOM_ID)
	     ((or `radio-target `target) :value)
	     (_ :name))
	   datum))
         (user-label (or user-label
                         (when-let ((path (org-element-property :ID datum)))
                           (concat "ID-" path)))))
    (cond
     ((and user-label
	   (or (plist-get info :html-prefer-user-labels)
	       ;; Used CUSTOM_ID property unconditionally.
	       (memq type '(headline inlinetask))))
      user-label)
     ((and named-only
	   (not (memq type '(headline inlinetask radio-target target)))
	   (not user-label))
      nil)
     (t
      (org-export-get-reference datum info)))))

;; --------------------------------------------------------------------------------

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
