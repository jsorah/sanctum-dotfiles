# Get the MIME type for a given URL
urlh "$1" Content-Type |

# Use last line only, remove any charset suffix
sed '
$!d
s/;.*//
'
