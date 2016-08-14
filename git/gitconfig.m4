[advice]
    statusHints = false

[alias]
    others = ls-files --others --exclude-standard

[color]
    ui = true

[diff]
    tool = vimdiff

[difftool]
    prompt = false

[grep]
    extendRegexp = true
    lineNumber = true

[log]
    date = local
    decorate = short

[merge]
    ff = false

[push]
    default = current

[sendemail]
    confirm = compose
    smtpServer = DOTFILES_SENDMAIL

[status]
    short = true

[user]
    name = DOTFILES_NAME
    email = DOTFILES_EMAIL
    signingKey = DOTFILES_KEY
