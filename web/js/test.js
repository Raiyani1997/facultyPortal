$(document).ready(function(){
	$('#test').click(function(){
		var flag=true,column,data,i,j,k,l,m,n=true,err="error cause for faculty  ",column1,column2;
		for(column=11;column<19;column++){
			data=[];
			for(i=column;i<51;i+=10){
				j="#"+i;
				if($(j).text()!=""){
					n=false;
					k = $(j).text().split(" ");
					if(k[0].indexOf("-")!=-1){
						for(l=0;l<k.length;l++){
							m = k[l].split("-");
							if(m[1] != "")
								data.push(m[1]);
						}	
					}
					else
						data.push(k[0]);
				}
			}
			if(data.length != 0){
			
				for(i=0;i<data.length;i++){
					for(j=i+1;j<data.length;j++){
						if(data[i]==data[j]){
							flag=false;
							column1 = column;
							column2 = column%10;
							column1 ="#"+column1;
							column2 ="#"+column2;
							// err.push(data[j]+" in time slot "+$(column2).text());
							err+="\n"+data[j]+" in time slot "+$(column2).text();
							break;
						}
					}
				}
			}
		}
		if(n==false && flag==true)
		{
			alert("successful");
			$('#submit').show();
		}
		else if(flag==false){	
			alert(err);
			// break;
		}
	});
});