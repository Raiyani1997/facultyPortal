$(document).ready(function(){
	var funk=[],column;
	
	$('.col').click(function(){
		column = $(this).attr('id');
		column = "#"+column;
		//$('#modal1').modal('close');
		//$('#modal2').modal('close');
		//alert(column);
	});
	
	$('#toggle').click(function(){
		$('#submit').hide();
		var str = $(column).attr('class');
		var next = $(column).attr('id');
		var v = next;
		next++;
		var n = '#'+(next);
		var str1 = $(n).attr('class');
		
		if((v<10) || (v%10)==0 || (v%10)>7 || (v%10)==2 || (v%10)==4 ){
			alert("toggle not possible");
		}
		else if(str.indexOf("s1")!=-1 && str1.indexOf("s2")!=-1){
			alert("toggle for laboratory is not possible");
		}
		else if(str.indexOf("s1")!=-1){
			$(n).hide();
			$(n).html("");
			$(column).html("");
			$(column).attr('class',str.replace('s1', 's2'));
		}
		else if(str.indexOf("s2")!=-1){					
			$(n).show();
			$(n).html("");
			$(column).html("");
			$(column).attr('class',str.replace('s2', 's1'));
		}
		
	});
	
	$(".col").dblclick(function(){
		$('#submit').hide();
		var next = $(this).attr('id');
		var str = $(this).attr('class');
		if((next%10)==0 && next>=10){
			var text = prompt("Enter SEMESTER-DIVISION","");
			if(text.length != 0){
				$(this).html(text.toUpperCase());
				next = '.'+next;
				$(next).val(text.toUpperCase());
			}

		}
		else if(!((next<10) || (next%10)==0)){
			var a = $(this).attr('id');
                        var b = '#'+a;
			a = ((a-(a%10))/10)*10;
			a = '#'+a;
			if($(a).html() != ""){
				if(str.indexOf("s1")!=-1){
                                        var c = $(b).html();
                                        if(c!=" "){
                                            $("#facname").val(c.split('<div class="divider" style="visibility:hidden"></div>')[0]);
                                            $("#theorysub").val(c.split('<div class="divider" style="visibility:hidden"></div>')[1]);
                                        }
                                        else{
                                            $("#facname").val("");
                                            $("#theorysub").val("");
                                        }
					funk = next;
					$('#modal1').modal('open');
					$('#facname').focus();
				}
				else{
					funk = next;
					$('#modal2').modal('open');
					$('#labbat1').focus();
				}
			}
			else{
				alert("semester-division required first ");
			}
			
			
		}
	});
	
	$('#action1').click(function(){
		var fac = $('#facname').val().toUpperCase();
		var sub = $('#theorysub').val().toUpperCase();
		var data = fac +'<div class="divider" style="visibility:hidden"></div>'+sub;
		var data1 = fac +' '+sub;
		ff = funk;
		funk = "#"+funk;
		$(funk).html(data);
		ff = "."+ff;
		$(ff).val(data1);
		$('#modal1').modal('close');
	});
	$('#action2').click(function(){
		var batch1 = $('#labbat1').val().toUpperCase()+"-"+$('#facname1').val().toUpperCase()+"-"+$('#labsub1').val().toUpperCase()+"-"+$('#labloc1').val().toUpperCase()+" ";
		var batch2 = $('#labbat2').val().toUpperCase()+"-"+$('#facname2').val().toUpperCase()+"-"+$('#labsub2').val().toUpperCase()+"-"+$('#labloc2').val().toUpperCase()+" ";
		var batch3 = $('#labbat3').val().toUpperCase()+"-"+$('#facname3').val().toUpperCase()+"-"+$('#labsub3').val().toUpperCase()+"-"+$('#labloc3').val().toUpperCase()+" ";
		var batch4 = $('#labbat4').val().toUpperCase()+"-"+$('#facname4').val().toUpperCase()+"-"+$('#labsub4').val().toUpperCase()+"-"+$('#labloc4').val().toUpperCase()+" ";
		var data = batch1+'<div class="divider"></div>'+batch2+'<div class="divider"></div>'+batch3+'<div class="divider"></div>'+batch4;
		var data1 = batch1+batch2+batch3+batch4;
		var funk1 = funk;
		var f = funk;
		funk = "#"+funk;
		$(funk).html(data);
		f = "."+f;
		$(f).val(data1);
		
		funk1++;
		ff = funk1;
		funk1 = "#"+funk1;
		ff = "."+ff;
		$(ff).val(data1);
		$(funk1).html(data);
		$('#modal2').modal('close');
	});
});