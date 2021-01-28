$( document ).ready(function() {
	var pageName = document.location.pathname.match(/[^\/]+$/)[0]
  	pageName = pageName.replace('.php','');
  	get_question(pageName)

  $('img[src="https://cdn.000webhost.com/000webhost/logo/footer-powered-by-000webhost-white2.png"]').prop('hidden',true);

  $('#btn_dit').on('click', function(event) {
  	event.preventDefault();
  	var text = $('#text_ans');
    text.val(text.val() + '.');

    var audio = $("#audio_dit")[0];
	audio.play();
  });

  $('#btn_dah').on('click', function(event) {
  	event.preventDefault();
  	var text = $('#text_ans');
    text.val(text.val() + '-');

    var audio2 = $("#audio_dah")[0];
	audio2.play();
  });

  $('#btn_spacebar').on('click', function(event) {
  	event.preventDefault();
  	var text = $('#text_ans');
    text.val(text.val() + '/ /');
  });

  $('#btn_delete').on('click', function(event) {
  	event.preventDefault();
  	var text = $('#text_ans').val();
    var backSpace = text.substr(0, text.length-1);
        $('#text_ans').val(backSpace);
  });

});

function get_question(pageName){
	$.ajax({
		url: '../system/cmd.php',
		type: 'POST',
		data: {
			command: 'get_question',
			pageName: pageName
		},
		success:function(data){
			data = JSON.parse(data);
			$('#question_desc').html(data.question_desc);

			$('#form_ans').submit(function(event) {
		  		event.preventDefault();
		  		var user_ans = $('#text_ans').val();
		  		if(user_ans == data.question_ans){
		  			console.log('Correct');
		  			$('#modal_success').modal('show')
		  			if(data.question_status == ""){
		  				var html = 	'<div class="col-12" align="center"><h1>ยินดีด้วย คุณได้รับรางวัล</h1></div>'+
		  							'<div class="col-12" align="center"><h4 style="color: blue;">+++"'+data.question_item+'"+++</h4></div>'+
		  							'<form class="form-group" id="send_reward">'+
		  							'<div class="col-12 row">'+
		  							'<div class="col-12">โปรดกรอกชื่อของคุณไว้เพื่อเป็นหลักฐาน</div>'+
		  							'<div class="col-12 col-sm-5 col-md-5 col-lg-5" style="margin-bottom: 5px;"><input type="text" id="user_Fname" class="form-control" placeholder="ชื่อ" required></div>'+
		  							'<div class="col-12 col-sm-5 col-md-5 col-lg-5"><input type="text" id="user_Lname" class="form-control" placeholder="นามสกุล" required></div>'+
		  							'<div class="col-12" style="margin-top: 20px;"><button type="submit" class="btn btn-lg btn-success">รับรางวัล</button></div>'+
		  							'</form>'+
		  							'</div>';
		  			}else{
		  				var html = '<div class="col-12" align="center"><h3>เสียใจด้วย คุณตอบถูก แต่รางวัลหมดแล้ว</h3></div>';
		  			}
		  			$('.modal-body').html(html);
		  		}
		  		else{
		  			console.log('Wrong');
		  			$('#modal_success').modal('show')
		  			var html = '<div class="col-12" align="center"><h1>เสียใจด้วย คุณตอบผิด</h1></div>';
		  			$('.modal-body').html(html);
		  		}

		  		$('#send_reward').submit(function(event) {
				  	event.preventDefault();
				  	var Fname = $('#user_Fname').val();
				  	var Lname = $('#user_Lname').val();
				  	send_reward(Fname,Lname,data.question_id,data.question_reward);
				});
		  	});
		},
		error:function(){

		}
	});
}

function send_reward(Fname,Lname,question_id,question_reward){
	$.ajax({
		url: '../system/cmd.php',
		type: 'POST',
		data: {
			command: 'send_reward',
			question_id: question_id,
			Fname:Fname,
			Lname:Lname
		},
		success:function(data){
			data = JSON.parse(data);
			if(data.status == 1){
				var html2 = '<div class="col-12" align="center"><h3>Code รับรางวัลของคุณ</h3></div>'+
						'<div class="col-12" align="center"><h3 style="color: blue;">'+question_reward+'</h3></div><br>'+
						'<div class="col-12" align="center"><h5 style="color: #FA9E41;">โปรดบันทึกหน้าจอไว้เพื่อเป็นหลักฐาน</h5></div><br>'+
						'<div class="col-12" align="center"><h5>สามารถนำมาแลกของรางวัลได้ที่บูธในวันงาน</h5></div>';
			}
			else{
				var html2 = '<div class="col-12" align="center"><h5 style="color: #FA9E41;">ขณะที่คุณใส่ชื่อ..ก็มีคนแซงหน้าเอารางวัลไปแล้ว</h5></div>';
			}
			
			$('.modal-body').html(html2);
		},
		error:function(){

		}
	});
}