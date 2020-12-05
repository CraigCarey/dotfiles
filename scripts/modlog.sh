 git filter-branch --env-filter '
NEW_NAME="Craig"
NEW_EMAIL="sgccarey@gmail.com"

export GIT_COMMITTER_NAME="$NEW_NAME"
export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
export GIT_AUTHOR_NAME="$NEW_NAME"
export GIT_AUTHOR_EMAIL="$NEW_EMAIL"

' --tag-name-filter cat -- --branches --tags