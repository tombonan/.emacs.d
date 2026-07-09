;; Org-mode configuration for Jira ticket tracking
;; https://cachestocaches.com/2016/9/my-workflow-org-agenda/

;; Core org-mode settings
(setq org-log-done 'time)  ; Add timestamp when marking DONE
(setq org-log-into-drawer t)  ; Store logs in :LOGBOOK: drawer

;; Agenda files - include active tickets
(setq org-agenda-files
      (list "~/Dropbox/org/tickets/active/"
            "~/Dropbox/org/agenda.org"))

;; Enhanced TODO keywords matching article workflow
;; NEXT = ready to work on today, WAITING = blocked by external dependency
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "IN-PROGRESS(i)" "WAITING(w)" "BLOCKED(b)" "REVIEW(r)" "|" "DONE(d)" "CANCELLED(c)")))

;; Custom TODO keyword faces
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red" :weight bold))
        ("NEXT" . (:foreground "cyan" :weight bold))
        ("IN-PROGRESS" . (:foreground "yellow" :weight bold))
        ("WAITING" . (:foreground "magenta" :weight bold))
        ("BLOCKED" . (:foreground "orange" :weight bold))
        ("REVIEW" . (:foreground "blue" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("CANCELLED" . (:foreground "gray" :weight bold))))

;; Refile targets - allow refiling to archive
(setq org-refile-targets
      '(("~/Dropbox/org/tickets/archive/2025/*.org" :maxlevel . 1)
        ("~/Dropbox/org/projects.org" :maxlevel . 2)
        ("~/Dropbox/org/agenda.org" :maxlevel . 1)))

(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)

;; Agenda display settings - clean minimal style
(setq org-agenda-block-separator ?=)  ; Use = for section separators
(setq org-agenda-compact-blocks nil)  ; Don't compact blocks, keep spacing
(setq org-agenda-tags-column 0)       ; Align tags to the right edge

;; Custom agenda header faces - simple blue text (solarized blue), no background
(with-eval-after-load 'org-faces
  (set-face-attribute 'org-agenda-structure nil
                      :foreground "#268bd2"
                      :weight 'normal
                      :inherit 'default)
  (set-face-attribute 'org-agenda-date-today nil
                      :foreground "#268bd2"
                      :weight 'bold
                      :inverse-video nil))

;; Ensure org-agenda uses default font (not variable-pitch)
(add-hook 'org-agenda-mode-hook
          (lambda ()
            (buffer-face-mode -1)
            (variable-pitch-mode -1)))

;; Custom agenda commands - inspired by cachestocaches.com article
(setq org-agenda-custom-commands
      '(("d" "Daily View"
         ((agenda "" ((org-agenda-span 'day)
                      (org-agenda-overriding-header "Today's Schedule:")))
          (todo "NEXT"
                ((org-agenda-overriding-header "Next Tasks:")
                 (org-agenda-sorting-strategy '(priority-down tag-up))))
          (todo "IN-PROGRESS"
                ((org-agenda-overriding-header "Active Projects:")))
          (agenda "" ((org-agenda-span 'week)
                      (org-agenda-start-day "+0d")
                      (org-agenda-overriding-header "Week At A Glance:")))
          (todo "TODO"
                ((org-agenda-overriding-header "Remaining Project Tasks:")
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))))

        ("w" "Work Focus"
         ((agenda "" ((org-agenda-span 'day)
                      (org-agenda-overriding-header "Today's Schedule:")))
          (tags-todo "WORK/NEXT"
                     ((org-agenda-overriding-header "Next Work Tasks:")))
          (tags-todo "WORK/IN-PROGRESS"
                     ((org-agenda-overriding-header "Active Work Projects:")))
          (tags-todo "WORK/TODO"
                     ((org-agenda-overriding-header "Work Backlog:")))))

        ("p" "Personal Focus"
         ((agenda "" ((org-agenda-span 'day)
                      (org-agenda-overriding-header "Today's Schedule:")))
          (tags-todo "PERSONAL/NEXT"
                     ((org-agenda-overriding-header "Next Personal Tasks:")))
          (tags-todo "PERSONAL/IN-PROGRESS"
                     ((org-agenda-overriding-header "Active Personal Projects:")))
          (tags-todo "PERSONAL/TODO"
                     ((org-agenda-overriding-header "Personal Backlog:")))))

        ("t" "Active Tickets Overview"
         ((todo "IN-PROGRESS"
                ((org-agenda-overriding-header "In Progress:")))
          (todo "BLOCKED"
                ((org-agenda-overriding-header "Blocked:")))
          (todo "WAITING"
                ((org-agenda-overriding-header "Waiting:")))
          (todo "REVIEW"
                ((org-agenda-overriding-header "In Review:")))
          (todo "NEXT"
                ((org-agenda-overriding-header "Next Up:")))
          (todo "TODO"
                ((org-agenda-overriding-header "Todo:")))))

        ("u" "Urgent Items" tags-todo "urgent"
         ((org-agenda-overriding-header "Urgent Items:")))

        ("x" "Blocked & Waiting Review"
         ((todo "BLOCKED"
                ((org-agenda-overriding-header "Blocked Tasks:")))
          (todo "WAITING"
                ((org-agenda-overriding-header "Waiting on Others:")))
          (todo "REVIEW"
                ((org-agenda-overriding-header "In Review:")))))))

;; Capture templates for quick ticket entry
(setq org-capture-templates
      '(("j" "Jira Ticket" entry
         (file "~/Dropbox/org/tickets/inbox.org")
         "* TODO %^{Ticket ID} %^{Description}
:PROPERTIES:
:TICKET: %\\1
:CREATED: %U
:STATUS: Todo
:PRIORITY: %^{Priority|Medium|High|Low}
:POINTS: %^{Story Points}
:END:

[[https://redcanary.atlassian.net/browse/%\\1][Jira Link]]

** Summary
%?

** Acceptance Criteria
- [ ]

** Investigation

** Solution Design

** Implementation

** Testing

** Documentation
"
         :empty-lines 1)

        ("n" "Next Task - Do Today" entry
         (file "~/Dropbox/org/agenda.org")
         "* NEXT %? :WORK:
SCHEDULED: %t DEADLINE: %t
:PROPERTIES:
:CREATED: %U
:END:
"
         :empty-lines 1)

        ("q" "Quick Note" entry
         (file "~/Dropbox/org/tickets/inbox.org")
         "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n"
         :empty-lines 1)

        ("m" "Meeting Notes" entry
         (file "~/Dropbox/org/agenda.org")
         "* MEETING %? :WORK:
:PROPERTIES:
:CREATED: %U
:END:

** Attendees
-

** Discussion
%?

** Action Items
- [ ]
"
         :empty-lines 1
         :clock-in t
         :clock-resume t)

        ("i" "Idea / Future Task" entry
         (file "~/Dropbox/org/agenda.org")
         "* TODO %? :IDEA:
:PROPERTIES:
:CREATED: %U
:END:
"
         :empty-lines 1)))

;; Archive settings - move completed tickets to dated archive
(setq org-archive-location "~/Dropbox/org/tickets/archive/%s_archive::")

;; Function to archive ticket by moving file
(defun tom/archive-ticket-file ()
  "Move current ticket file to archive directory."
  (interactive)
  (let* ((current-file (buffer-file-name))
         (filename (file-name-nondirectory current-file))
         (year (format-time-string "%Y"))
         (archive-dir (expand-file-name year "~/Dropbox/org/tickets/archive/"))
         (archive-file (expand-file-name filename archive-dir)))
    (unless (file-exists-p archive-dir)
      (make-directory archive-dir t))
    (when (yes-or-no-p (format "Archive %s to %s? " filename archive-file))
      (rename-file current-file archive-file)
      (kill-buffer)
      (message "Archived to %s" archive-file))))

;; Function to update the :UPDATED: property
(defun tom/update-ticket-timestamp ()
  "Update the UPDATED property with current timestamp."
  (interactive)
  (org-set-property "UPDATED" (format-time-string "[%Y-%m-%d %a]")))

;; Auto-update timestamp when saving
(defun tom/auto-update-ticket-timestamp ()
  "Automatically update UPDATED property when saving ticket files."
  (when (and (derived-mode-p 'org-mode)
             (string-match-p "tickets/active" (or (buffer-file-name) "")))
    (save-excursion
      (goto-char (point-min))
      (when (re-search-forward ":PROPERTIES:" nil t)
        (tom/update-ticket-timestamp)))))

(add-hook 'before-save-hook 'tom/auto-update-ticket-timestamp)

;; Key bindings for ticket management
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c t a") 'tom/archive-ticket-file)
  (define-key org-mode-map (kbd "C-c t u") 'tom/update-ticket-timestamp))

;; Enhanced tag suggestions - added WORK and PERSONAL for filtering
(setq org-tag-alist
      '((:startgroup . nil)
        ("WORK" . ?w)
        ("PERSONAL" . ?p)
        (:endgroup . nil)
        (:startgroup . nil)
        ("@backend" . ?b)
        ("@frontend" . ?f)
        ("@infra" . ?i)
        ("@security" . ?s)
        (:endgroup . nil)
        ("urgent" . ?u)
        ("blocked" . ?x)
        ("research" . ?r)
        ("bug" . ?g)
        ("feature" . ?e)
        ("refactor" . ?c)
        ("documentation" . ?d)
        ("IDEA" . ?a)
        ("MEETING" . ?m)))

;; Function to create directory structure
(defun tom/setup-org-ticket-directories ()
  "Create the recommended org ticket directory structure."
  (interactive)
  (let ((dirs '("~/Dropbox/org/tickets/active"
                "~/Dropbox/org/tickets/archive/2024"
                "~/Dropbox/org/tickets/archive/2025"
                "~/Dropbox/org/tickets/archive/2026")))
    (dolist (dir dirs)
      (let ((expanded (expand-file-name dir)))
        (unless (file-exists-p expanded)
          (make-directory expanded t)
          (message "Created directory: %s" expanded))))))

;; Function to move existing tickets to active directory
(defun tom/migrate-tickets-to-active ()
  "Move all .org files from tickets/ to tickets/active/."
  (interactive)
  (let* ((tickets-dir (expand-file-name "~/Dropbox/org/tickets/"))
         (active-dir (expand-file-name "~/Dropbox/org/tickets/active/"))
         (files (directory-files tickets-dir t "\\.org$")))
    (unless (file-exists-p active-dir)
      (make-directory active-dir t))
    (dolist (file files)
      (let* ((filename (file-name-nondirectory file))
             (new-path (expand-file-name filename active-dir)))
        (when (yes-or-no-p (format "Move %s to active/? " filename))
          (rename-file file new-path)
          (message "Moved %s" filename))))))

;; Initialize directories on first load
(tom/setup-org-ticket-directories)

(provide 'setup-org-tickets)
