;; Tue Jul  1 08:35:19 2025 -- chugg portable --
;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.


;; This is a collection of snippets to help me reason about a project.
;; the commands are specific to my computing environment. I include it
;; to help me, and in case anyone else finds it useful.




;; this other character sheet template is way simpler but I might need more of the
;; stats and such from the matsavage one.  First game, don't know 🤷

(cd "~/chuggboarder/darksun_5e/character-sheet")

(shell-command "pdflatex main.tex")


(pwd)


(shell-command "git config --list")


;; my portable git environment mounts to a different drive letter sometimes.
;; so i occasionally have to remind it where my credentials are.

(shell-command "git config --global http.sslcainfo E:/WinApps/Git/mingw64/etc/ssl/certs/ca-bundle.crt")



(shell-command "git clone https://github.com/matsavage/DND-5e-LaTeX-Character-Sheet-Template.git")



;; Once I cloned that repo to my system, I hacked it locally.

;; its a submodule of a broader repo of DnD things.  I couldn't figure out how it all works with makefiles etc. It looks well documented - I'm just not there yet.
;; it also looks like I should install the DnD styles system wide into my TeX environment. So I'm set up to make other DnD styled things and store them wherever.

;; I used trial and error instead.  I kept running latex and downloading the missing files in the repo with my character sheet and rerunning it until it worked.



;; When I make some edits and I'm ready to refresh my sheet, I navigate into the
;; repo directory and run lualatex.


(cd "~/chuggboarder/irondice_darksun_5e/DND-5e-LaTeX-Character-Sheet-Template/")


(cd "/media/chuggboarder/CHUGG/home/chuggboarder/irondice_darksun_5e/DND-5e-LaTeX-Character-Sheet-Template/")

(cd "..")  

;; this is super slow - use lualatex
;; (async-shell-command "xelatex characters/zantwon.tex")





;; lualatex works the best -- but its not showing the background correctly
;; background works the 2nd time!

(async-shell-command "lualatex ./characters/zantwon.tex")





;; this doesnt work because of stupid ugly custom font needs lualatex
;; no disrespect to the OG author I just want to figure out how to change it.
;; I don't think my character's handwriting is "Kalam"

(async-shell-command "pdflatex characters/zantwon.tex")




;; I hacked up this existing repo and I want to make my own repo.  But I want it to be a "fork" so I can remember roughly how I got here.

;; I follow this guy's instruction:

(browse-url "https://gist.github.com/jagregory/710671")



(shell-command "git status")
(shell-command "git add .")

(shell-command "git remote -v")

(shell-command "git remote rename origin upstream")

(shell-command "git remote add origin https://github.com/chuggboarder/irondice_darksun_5e.git")

(shell-command "git commit -m \"added my own files and removed things Im not using\"")

(shell-command "git push origin")



;; I manage identity on a per repo basis, hence --local
;; this is for the actual commits
(shell-command "git config --local user.name \"chuggboarder\"")
(shell-command "git config --local user.email d********@gmail.com")  ;contact me on the discord

(shell-command "git config --global --unset credential.helper")
(shell-command "git config --local credential.helper store")

(shell-command "git config --list")


(browse-url "https://dimasmaulana.dev/posts/development/storing-git-credentials-locally/")


;; identities are secondarily managed on push using a github PAT. but this is just to push.  The commit tags have whatever identity in the config.

(shell-command "git remote set-url origin https://******PAT********@github.com/chuggboarder/irondice_darksun_5e.git")


 

(shell-command "git reset --soft HEAD~1")

(shell-command "git reset HEAD -- \"Dark Sun Campaign Setting 5E.pdf\"")
