#bash!

file="$1"    # file can't be in a folder
scp rclinux-git.rockwellcollins.com:/data/users/new_archives/template_new_archives "new_${file}"
sed -i "s/ARCHIVE_NAME=.*/ARCHIVE_NAME=\"${file}\"/" "new_${file}"
sed -i "s/ARCHIVE_SHA1SUM=.*/ARCHIVE_SHA1SUM=\"$(sha1sum "${file}" | awk '{print $1}')\"/" "new_${file}"
# Set the url in the template (using nano since vim has tries to be smart about the extension on the file)
nano "new_${file}"
chmod 664 "new_${file}" "${file}"
scp "new_${file}" "${file}" rclinux-git.rockwellcollins.com:/data/users/new_archives/

