<?php

include('./config/config.php');
use Ramsey\Uuid\Uuid;

function insertUser($data)
{
    $db = db();
    $id = $db->insert ('users', $data);
    if($id) return ["status" => true, "id" => $id];
    else return ["status" => false, "error" => $db->getLastError()];
}

// Create User;
function createUuid()
{
    $uuid = Uuid::uuid4();
    $uuids = $uuid->toString().rand(11, 99);
    
    // Check uuid exists;
    $check = getSingleUserByColVal("uuid", $uuids);
    
    // Check Uuid Already Exist or Not
    if($check["count"] == 1)
    {
        return createUuid(); // Uuid already found in db so recall this function;
    }
    else
    {
        return $uuids;
    }
}


function createUsername($uuid)
{
    $str = $uuid;
    $strArr = explode("-",$str);
    $first = $strArr[0];
    $uname = "guest_".$first.rand(111,999).rand(11,99);
    
    // Check uuid exists;
    $check = getSingleUserByColVal("username", $uname);
    
    // Check Uuid Already Exist or Not
    if($check["count"] == 1)
    {
        return createUsername($uuid); // Uuid already found in db so recall this function;
    }
    else
    {
        return $uname;
    }
}



// GET
function getSingleUserByColVal($col, $val)
{
    //$uuid 
    $db = db();
    $db->where($col, $val);
    $users = $db->getOne("users");
    if($users == null)
    {
        return ["count" => 0, "msg" => "No Found in Database."];
    }
    else
    {
        return ["count" => 1, "msg" => "No User Found.", "data" => $users, "uuid" => $users['uuid']];
    }
}

// Create
function createNewUser()
{

    $input = jsonParser();
    $data = $input;

    // Mobile
    if(isset($data["mobile"]))
    {
        $mobile = $data["mobile"];
        $user_data_mb = getSingleUserByColVal("mobile", $mobile);
        if($user_data_mb["count"] == 1)
        {
            $successResponse = array(
                "status" => "success",
                "message" => "record-found",
                "data" => array
                (
                    "uuid" =>  $user_data_mb["uuid"],
                    "username" => $user_data_mb["data"]["username"],
                    "name" => $user_data_mb["data"]["name"],
                    "mobile" => $user_data_mb["data"]["mobile"]
                )
            );
            return json_encode($successResponse);
        }
    }
    else
    {
        $mobile = null;
    }

    $uuid = createUuid();
    $user_nm = createUsername($uuid);
    
    // Name
    if(isset($data["name"]))
    {
        $name = $data["name"]; 
    }
    else
    {
        $name = "Guest";
    }

    $mobile_verified = 0;
    $country = null;
    $state = null;
    $inserData = [
        "uuid" => $uuid,
        "username" => $user_nm,
        "name" => $name,
        "mobile" => $mobile,
        "mobile_verified" => $mobile_verified,
        "country" => $country,
        "state" => $state,
    ];
    $insertU =  insertUser($inserData);
    if($insertU["status"] == true)
    {
        $user_data = getSingleUserByColVal("id", $insertU["id"]);
        $successResponse = array(
            "status" => "success",
            "message" => "record-inserted",
            "data" => array
            (
                "uuid" =>  $user_data["uuid"],
                "username" => $user_data["data"]["username"],
                "name" => $user_data["data"]["name"],
                "mobile" => $user_data["data"]["mobile"]
            )
        );
        return json_encode($successResponse);
    }
    else
    {
        return json_encode(['status' => false, 'error' => 'Something went wrong while creating new record', "message" =>  $insertU["error"]]);
    }
}


echo createNewUser();


?>