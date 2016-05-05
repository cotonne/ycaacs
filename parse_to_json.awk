BEGIN{
	print "{\"name\": \"d3\", \"children\": ["
	previous=""
	first=1
	level = 0;
}
{
	if(match($1, /\//)) {
		match($1, /(.?*)\/([^\/]*)/, arr)
		if(previous!=arr[1] ){
			if(previous!="") {
				for( i = 0; i < level; i++) {
					print "]}"
				}
				print ","
				level=0
			}
			nbElements=split(arr[1], b, "/");
			for(e in b) {
				print "{\"name\": \""b[e]"\", \"children\": ["
				level++;
			}
			previous=arr[1]
			first = 1
		}
		if(first == 1) {
			first = 0
		} else {
			print ","
		}
	
		print "{\"name\": \""arr[2]"\", \"size\": "$4", \"nbChanges\": "$3",\"nbCommits\": "$2"}"
	} else {
		root[$1][1] = $4
		root[$1][2] = $3
		root[$1][3] = $2
	}
}
END{
	for( i = 0; i < level; i++) {
		print "]}"
	}
	print ","
	first = 1
	for(e in root) {
		if(first == 1)  {
			first=0
		} else {
			print ","
		}

		print "{\"name\": \""e"\", \"size\": "root[e][1]", \"nbChanges\": "root[e][2]",\"nbCommits\": "root[e][3]"}"
	}
	print "]}"
}