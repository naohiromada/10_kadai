<?php
session_start();
include("functions.php");
check_session_id();
$pdo = connect_to_db();

// POSTで送信された値は$_POSTで受け取る
// 入力チェック（未入力の場合は弾く，commentのみ任意）
if (
    !isset($_POST['facility']) || $_POST['facility'] == '' ||
    !isset($_POST['Postal_code']) || $_POST['Postal_code'] == '' ||
    !isset($_POST['Prefectures']) || $_POST['Prefectures'] == '' ||
    !isset($_POST['Addres_1']) || $_POST['Addres_1'] == '' ||
    !isset($_POST['Addres_2']) || $_POST['Addres_2'] == '' ||
    !isset($_POST['Addres_3']) || $_POST['Addres_3'] == '' ||
    !isset($_POST['Tel_no']) || $_POST['Tel_no'] == '' ||
    !isset($_POST['Fax_no']) || $_POST['Fax_no'] == ''
) {
    echo json_encode(["error_msg" => "no input"]);
    exit();
}
// 解説
// 「ParamError」が表示されたら，必須データが送られていないことがわかる

// データを変数に格納
$facility = $_POST['facility'];
$Postal_code = $_POST['Postal_code'];
$Prefectures = $_POST['Prefectures'];
$Addres_1 = $_POST['Addres_1'];
$Addres_2 = $_POST['Addres_2'];
$Addres_3 = $_POST['Addres_3'];
$Tel_no = $_POST['Tel_no'];
$Fax_no = $_POST['Fax_no'];
// $image = $_POST['image'];

// var_dump($image);
// exit();

// DB接続情報
// $dbn = 'mysql:dbname=gsacf_d08_13;charset=utf8;port=3306;host=localhost';
// $user = 'root';
// $pwd = '';

// // DB接続
// try {
//     $pdo = new PDO($dbn, $user, $pwd);
// } catch (PDOException $e) {
//     echo json_encode(["db error" => "{$e->getMessage()}"]);
//     exit();
// }
// var_dump($_FILES['upfile']);
// exit();

if (isset($_FILES['upfile']) && $_FILES['upfile']['error'] == 0) {
    // 送信が正常に行われたときの処理
    $uploaded_file_name = $_FILES['upfile']['name']; //ファイル名の取得 
    $temp_path = $_FILES['upfile']['tmp_name']; //tmpフォルダの場所 
    $directory_path = 'upload/'; //アップロード先フォルダ
    $extension = pathinfo($uploaded_file_name, PATHINFO_EXTENSION);
    $unique_name = date('YmdHis') . md5(session_id()) . "." . $extension;
    $filename_to_save = $directory_path . $unique_name;
} else {
    // 送られていない，エラーが発生，などの場合
    // exit('Error:画像が送信されていません');
    // SQL作成&実行
    $sql = 'INSERT INTO 
    housing_support_table(id, facility, Postal_code, Prefectures, Addres_1, Addres_2, Addres_3, Tel_no, Fax_no, image) 
    VALUES(NULL, :facility, :Postal_code, :Prefectures, :Addres_1, :Addres_2, :Addres_3, :Tel_no, :Fax_no, :NULL)';
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':facility', $facility, PDO::PARAM_STR);
    $stmt->bindValue(':Postal_code', $Postal_code, PDO::PARAM_STR);
    $stmt->bindValue(':Prefectures', $Prefectures, PDO::PARAM_STR);
    $stmt->bindValue(':Addres_1', $Addres_1, PDO::PARAM_STR);
    $stmt->bindValue(':Addres_2', $Addres_2, PDO::PARAM_STR);
    $stmt->bindValue(':Addres_3', $Addres_3, PDO::PARAM_STR);
    $stmt->bindValue(':Tel_no', $Tel_no, PDO::PARAM_STR);
    $stmt->bindValue(':Fax_no', $Fax_no, PDO::PARAM_STR);
    // $stmt->bindValue(':image', $filename_to_save, PDO::PARAM_STR);
    $status = $stmt->execute(); // SQLを実行
    // 
    if ($status == false) {
        $error = $stmt->errorInfo();
        echo json_encode(["error_msg" => "{$error[2]}"]);
        exit();
    } else {
        header("Location:Housing_support_read.php");
        exit();
    }
}
// var_dump($_FILES);
// exit();

if (is_uploaded_file($temp_path)) {
    // ↓ここでtmpファイルを移動する
    if (move_uploaded_file($temp_path, $filename_to_save)) {
        chmod($filename_to_save, 0644); // 権限の変更 
        // $img = '<img src="' . $filename_to_save . '" >'; // imgタグを設定
        // ここからファイルアップロード&DB登録の処理を追加しよう！！！
        $sql = 'INSERT INTO 
        housing_support_table(id, facility, Postal_code, Prefectures, Addres_1, Addres_2, Addres_3, Tel_no, Fax_no, image) 
        VALUES(NULL, :facility, :Postal_code, :Prefectures, :Addres_1, :Addres_2, :Addres_3, :Tel_no, :Fax_no, :image)';
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':facility', $facility, PDO::PARAM_STR);
        $stmt->bindValue(':Postal_code', $Postal_code, PDO::PARAM_STR);
        $stmt->bindValue(':Prefectures', $Prefectures, PDO::PARAM_STR);
        $stmt->bindValue(':Addres_1', $Addres_1, PDO::PARAM_STR);
        $stmt->bindValue(':Addres_2', $Addres_2, PDO::PARAM_STR);
        $stmt->bindValue(':Addres_3', $Addres_3, PDO::PARAM_STR);
        $stmt->bindValue(':Tel_no', $Tel_no, PDO::PARAM_STR);
        $stmt->bindValue(':Fax_no', $Fax_no, PDO::PARAM_STR);
        $stmt->bindValue(':image', $filename_to_save, PDO::PARAM_STR);
        $status = $stmt->execute();

        if ($status == false) {
            $error = $stmt->errorInfo();
            echo json_encode(["error_msg" => "{$error[2]}"]);
            exit();
        } else {
            header("Location:Housing_support_read.php");
            exit();
        }
    } else {
        exit('Error:アップロードできませんでした'); // 画像の保存に失敗 
    }
} else {
    //     exit('Error:画像がありません'); // tmpフォルダにデータがない 
    //  } else 
    //   {

}