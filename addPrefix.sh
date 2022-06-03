#j=0

for i in [0-9]\ *; do
	mv "$i" "0$i"
	#((j++))
	#echo $i
	#b=$(printf '%01d\ *' ${i%\ *})
	#echo $b
done;
