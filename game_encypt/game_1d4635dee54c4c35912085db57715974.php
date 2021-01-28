<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Our MORSE</title>
	<?php include('../include/lib.html') ?>
</head>
<body>
	<?php include('../include/nav.html') ?>
	<div class="container">
		<div class="row">
			<div class="col-12" align="center">
				<div class="col-12 my-header">Our MORSE Game</div>
				<div class="col-sm-6 col-md-5 col-lg-4">
					<img src="../images/dit.png" alt="" width="100%">
				</div>
				<div class="col-12 my-content-game alert alert-info"><span id="question_desc"></span>&nbsp; <i class="fas fa-question-circle"></i></div>

				<div class="col-12">
					<form class="form-group" id="form_ans">
						<div class="col-sm-12 col-md-7 col-lg-6">
							<input type="text" value="" id="text_ans" class="form-control" placeholder="พิมพ์คำตอบด้วยการกดปุ่มด้านล่าง" readonly>
						</div>
						<div class="col-12" align="center" style="margin-top: 20px;">
							<div class="col-sm-12 col-md-12 col-lg-10 row" style="justify-content: center;">
								<div class="col-6 col-sm-3 col-md-2 col-lg-2" align="center">
									<button type="button" id="btn_dit" class="btn btn-lg btn-morse"><i class="fas fa-circle"></i></button>
								</div>
								<div class="col-6 col-sm-3 col-md-2 col-lg-2" align="center" style="margin-bottom: 10px;">
									<button type="button" id="btn_dah" class="btn btn-lg btn-morse"><i class="fas fa-minus"></i></button>
								</div>
								<div class="col-12 col-sm-5 col-md-3 col-lg-3" align="center" style="margin-bottom: 10px;">
									<button type="button" id="btn_spacebar" class="btn btn-lg btn-morse"><b>Space bar</b></button>
								</div>
								<div class="col-12 col-sm-5 col-md-3 col-lg-3" align="center">
									<button type="button" id="btn_delete" class="btn btn-lg btn-danger"><b><i class="fas fa-backspace"></i>&nbsp;Delete</b></button>
								</div>
							</div>
							<div class="col-12" style="margin-top: 20px;">
								<button type="submit" class="btn btn-lg btn-success">ส่งคำตอบ</button>
								<audio id="audio_dit" src="../audio/dit.wav"></audio>
								<audio id="audio_dah" src="../audio/dah.wav"></audio>
							</div>
						</div>
					</form>
				</div>
				<?php include('../include/notice.html')?>
			</div>
		</div>
	</div>
	<footer>
		<div class="col-12">
			© Copyright 2020 Our MORSE | By Chutipas Borsub | For DTM-302 สื่อใหม่กับสังคม
		</div>
	</footer>

		<!-- Modal -->
	<div class="modal fade" id="modal_success" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Our MORSE</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>