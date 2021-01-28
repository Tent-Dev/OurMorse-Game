<?php
include("class_db.php");
$mysql = new Main_db;
$mysql->Connect_db(); //เชื่อมต่อdb
$mysql->SetCharacter();
$cmd = isset($_POST["command"]) ? $_POST["command"] : "";

if ($cmd != "") {
	if($cmd == 'get_question'){
		$sql = "SELECT * FROM tbl_question WHERE question_encypt = '".$_POST['pageName']."'";
		$result = $mysql->Select_db_one($sql);

		$arr = array(
			'question_id' => $result['question_id'],
			'question_desc' => $result['question_desc'],
			'question_ans' => $result['question_ans'],
			'question_status' => $result['question_status'],
			'question_reward' => $result['question_reward'],
			'question_item' => $result['question_item']
		);
		echo json_encode($arr);
	}

	if($cmd == 'send_reward'){
		$check_used = "SELECT * FROM tbl_question WHERE question_id = ".$_POST['question_id']."";
		$result = $mysql->Select_db_one($check_used);
		if($result['question_status'] == 'Used'){
			echo json_encode(array('status' => 0));
		}
		else{
			$arr = array( 
				"user_Fname"=> $_POST['Fname'],
				"user_Lname"=> $_POST['Lname'],
				"user_questionID"=> $_POST['question_id'],
				);
			$check = $mysql->Insert_db($arr,"tbl_user"); //Check echo >>>> arr,ชื่อtable(พว่งหับ $tableName ใน Class_db.php)

			if($check && $_POST['question_id'] != 1){
				$arr2 = array( //field ต่างๆ
					"question_id" => $_POST['question_id'],
					"question_status" => 'Used'
				);

				$key = array("question_id");
				$check2 = $mysql->Update_db($arr2,$key,"tbl_question");
			}
			else if($check && $_POST['question_id'] == 1){
				$check2 =1;
			}

			if ($check2) {
				echo json_encode(array('status' => 1, ));
			}
		}
	}
}
?>