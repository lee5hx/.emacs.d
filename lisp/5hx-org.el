
(require 'org)

(setq org-ellipsis " ⤵"
      org-catch-invisible-edits 'error
      org-startup-indented t
      org-cycle-include-plain-lists 'integrate
      org-return-follows-link t
      org-M-RET-may-split-line nil
      org-src-fontify-natively t
      org-src-preserve-indentation t
      org-enforce-todo-dependencies t
      org-enforce-todo-checkbox-dependencies t
      org-link-frame-setup '((file . find-file))
      org-export-backends '(ascii html icalendar latex md)
      org-log-into-drawer t)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/ORG/todo.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("l" "Link" entry (file+headline "~/Dropbox/ORG/orgfiles/links.org" "Links")
             "* %? %^L %^g \n%T" :prepend t)
        ("j" "Journal" entry (file+datetree "~/Dropbox/ORG/orgfiles/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")))


;;(bind-key "C-c c" 'org-capture)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/Dropbox/ORG/notes.org")

;;(bind-key "C-c l" 'org-store-link)
(global-set-key (kbd "C-c l") 'org-store-link)

;;(bind-key "C-c a" 'org-agenda)
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-files
      (delq nil
            (mapcar (lambda (x) (and (file-exists-p x) x))
                    '("~/Dropbox/ORG/todo.org"
                      "~/Dropbox/ORG/cbsr_todo.org"))))



;;Org setup
(setq org-use-speed-commands t)
(setq org-image-actual-width 550)

;;Org tags
(setq org-tags-column 45)



;;Org JIRA

; (require 'org-jira)
; (setq jiralib-url "http://jira.mindasset.f3322.net:10080/")


; (global-set-key (kbd "C-c j pg") 'org-jira-get-projects)
; (global-set-key (kbd "C-c j ib") 'org-jira-browse-issue)
; (global-set-key (kbd "C-c j ig") 'org-jira-get-issues)
; (global-set-key (kbd "C-c j ih") 'org-jira-get-issues-headonly)
; (global-set-key (kbd "C-c j iu") 'org-jira-update-issue)
; (global-set-key (kbd "C-c j iw") 'org-jira-progress-issue)
; (global-set-key (kbd "C-c j ia") 'org-jira-assign-issue)
; (global-set-key (kbd "C-c j ir") 'org-jira-refresh-issue)
; (global-set-key (kbd "C-c j iR") 'org-jira-refresh-issues-in-buffer)
; (global-set-key (kbd "C-c j ic") 'org-jira-create-issue)
; (global-set-key (kbd "C-c j ik") 'org-jira-copy-current-issue-key)
; (global-set-key (kbd "C-c j sc") 'org-jira-create-subtask)
; (global-set-key (kbd "C-c j sg") 'org-jira-get-subtasks)
; (global-set-key (kbd "C-c j cu") 'org-jira-update-comment)
; (global-set-key (kbd "C-c j wu") 'org-jira-update-worklog)
; (global-set-key (kbd "C-c j tj") 'org-jira-todo-to-jira)




(provide '5hx-org)
;;; 5hx-org.el ends here
