<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['xml_file'])) {
    $xml = simplexml_load_file($_FILES['xml_file']['tmp_name']);

    // Connect to the database again
    $host = 'localhost';
    $dbname = 'phptest';
    $username = 'root';
    $password = '';
    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Insert XML content into the database
        $stmt = $pdo->prepare("INSERT INTO xml_data (xml_content) VALUES (:xml_content)");
        $xmlContent = $xml->asXML();
        $stmt->bindParam(':xml_content', $xmlContent);
        $stmt->execute();

        echo "XML data imported successfully!\n";
    
        $filteredUsers = [];
        foreach ($xml->User as $user) {
            $removeUser = false;
            foreach ($user->Pets->Pet as $pet) {
                if ((double)$pet['Age'] > 3) {
                    $removeUser = true;
                    //unset($user[0]);
                    break;
                }
            }
            
            if (!$removeUser) {
                $filteredUsers[] = $user;
            }
        }
        //var_dump($filteredUsers[0]);echo "<br/><br/><br/>";

        $newXml = new SimpleXMLElement('<?xml version="1.0" encoding="UTF-8"?><Users></Users>');
        //array_walk_recursive($filteredUsers, array ($newXml, 'addChild'));//var_dump($newXml);
        //file_put_contents('output.xml', $newXml->asXML());

        function array_to_xml($data, &$xml) {
            
            foreach($data[0]->attributes() as $key => $value) { 
                if(is_array($value)) {
                    $subnode = $xml->addChild($key);
                    array_to_xml($value, $subnode);
                } 
                if(!is_array($value)) {
                    $xml->addChild("$key",htmlspecialchars("$value"));
                }
            }
            $xml->addChild('Pets',' ');
            foreach($data[0]->Pets->Pet as $p) { $xml->addChild('Pet');
                foreach($p->attributes() as $key => $value) {
                    if(is_array($value)) {
                        $subnode = $xml->addChild($key);
                        array_to_xml($value, $subnode);
                    } 
                    if(!is_array($value)) {
                        $xml->addChild("$key",htmlspecialchars("$value"));
                    }
                }
                foreach($p->Nickname as $n) { 
                    if(is_array($p->Nickname)) {
                        $subnode = $xml->addChild('Nickname');
                        array_to_xml($p->Nickname->attributes(), $subnode);
                    } 
                    if(!is_array($p->Nickname->attributes())) {
                        $xml->addChild("Nickname",htmlspecialchars($p->Nickname->attributes()));
                    }
                }
                if(isset($p->Rewards)) $xml->addChild('Rewards');
                foreach($p->Rewards as $r) {                     
                    if(is_array($p->Rewards->Reward)) {
                        $subnode = $xml->addChild('Reward');
                        array_to_xml($p->Rewards->Reward->attributes(), $subnode);
                    } 
                    if(!is_array($p->Rewards->Reward->attributes())) {
                        $xml->addChild("Reward",htmlspecialchars($p->Rewards->Reward->attributes()));
                    }
                }
                if(isset($p->Parents)) $xml->addChild('Parents');
                foreach($p->Rewards as $r) {                     
                    if(is_array($p->Rewards->Reward)) {
                        $subnode = $xml->addChild('Reward');
                        array_to_xml($p->Rewards->Reward->attributes(), $subnode);
                    } 
                    if(!is_array($p->Rewards->Reward->attributes())) {
                        $xml->addChild("Reward",htmlspecialchars($p->Rewards->Reward->attributes()));
                    }
                }
            }
            
        }

        // Call the function to convert array to XML
        array_to_xml($filteredUsers, $newXml);

        // Output the XML
        file_put_contents('output.xml', $newXml->asXML());
                
    } catch (PDOException $e) {
        die("Error: " . $e->getMessage());
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Import XML Data</title>
</head>
<body>
    <h1>Import XML Data</h1>
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="xml_file">
        <button type="submit">Import</button>
    </form>
</body>
</html>