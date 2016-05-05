{
	a[$2][$1]+=1
}
END{
	first_file=1
	id = 1
	print "{ \"name\" : \"root\", \"id\": 0, \"children\" : ["
	for(i in a) {
		if(first_file==1) {
			first_file=0
		} else {
			print ","
		} 
		print "{ \"name\" : \""i"\", \"id\": "id", \"children\" : ["
		id++
		first_author = 1
		for(j in a[i]) {
			if(first_author==1) {
				first_author=0
			} else {
				print ","
			}
			print "{ \"name\" : \""j"\", \"id\": "id", \"size\" : "a[i][j]"}"
			id++
		}
		print "]}"	
	}
	print "]}"
}

