commit=$(git log -1 --pretty="%H%n%ci") # hash \n date
commit_hash=$(echo "$commit" | head -1)
commit_date=$(echo "$commit" | head -2 | tail -1) # 2022-12-28 05:55:55 +0300

branch_name=$(git symbolic-ref -q HEAD)
branch_name=${branch_name##refs/heads/}
branch_name=${branch_name:-HEAD} # 'HEAD' indicates detached HEAD situation

# Write it
echo "prev_commit='$commit_hash'\ndate='$commit_date'\nbranch='$branch_name'\n" > commit-hash.txt